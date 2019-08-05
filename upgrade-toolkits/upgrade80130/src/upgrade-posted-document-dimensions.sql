-- approx. 11 hours

SET NOCOUNT ON

DECLARE @DisplayQueries bit = 0, 
		@Debug bit = 0,
		@CommitRecordNumber int = 50000

BEGIN TRAN DocDim

IF OBJECT_ID('Cronus$TI Doc Dim Processing Log') IS NULL
	CREATE TABLE [Cronus$TI Doc Dim Processing Log] (
		TableId int not null PRIMARY KEY,		
		LastDocumentNoProcessed varchar(20) COLLATE DATABASE_DEFAULT not null,
		LastDocLineNoProcessed int not null
	)

IF OBJECT_ID('tempdb..#DocumentDimension') IS NOT NULL
	DROP TABLE #DocumentDimension;
CREATE TABLE #DocumentDimension (
	TableID int,
	DocumentNo varchar(20) COLLATE DATABASE_DEFAULT,
	DocLineNo int,
	CONSTRAINT [TempDocumentDimension$PK] PRIMARY KEY (TableID, DocumentNo, DocLineNo)
);
IF OBJECT_ID('tempdb..#DimensionSetCache') IS NOT NULL
	DROP TABLE #DimensionSetCache;
CREATE TABLE #DimensionSetCache(
	DimValueIDSet varchar(60) PRIMARY KEY CLUSTERED,
	DimSetID int NOT NUll	
);

DECLARE @StartTime datetime,
	@DimensionSetID int,
	@RecordCounter int = 0,
	@LastCommitted datetime,
	@CurrentTime datetime,
	@TotalSeconds int,
	@Seconds int,
	@Minutes int, 
	@Hours int,
	@DimensionValueIDSet varchar(60),
	@NewDimensionSetID bit,
	@TableID int,
	@DocumentNo varchar(20),
	@DocLineNo int,
	@TableName varchar(150),
	@CurrentTableID int = 0,
	@Query nvarchar(max),
	@ParamDefinition nvarchar(max)

SET @StartTime = GETDATE()
SET @CurrentTime = @StartTime
SET @LastCommitted = @CurrentTime
PRINT 'Started at ' + CAST(@StartTime AS NVARCHAR(MAX))

INSERT INTO #DimensionSetCache (DimValueIDSet, DimSetID)
SELECT DimValues, DimSetID
FROM (
	SELECT [Dimension Set ID] DimSetID,
		STUFF((SELECT ',' + CAST([Dimension Value ID] AS varchar(10)) AS [text()]
				FROM [Cronus$Dimension Set Entry] dse
				WHERE dse.[Dimension Set ID] = dstn.[Dimension Set ID]
				ORDER BY [Dimension Value ID]
				FOR XML PATH('')
				), 1, 1, '' 
		) AS DimValues	
	FROM [Cronus$Dimension Set Tree Node] dstn
) d
WHERE DimValues IS NOT NULL 

-- this takes 5 minutes
INSERT INTO #DocumentDimension(TableID, DocumentNo, DocLineNo)
SELECT DISTINCT [Table ID], [Document No_], [Line No_]
FROM [dbo].[Cronus$Posted Document Dimension$UPG] with(nolock)

DECLARE Doc_Cursor CURSOR FOR
SELECT t.TableID, t.DocumentNo, t.DocLineNo
FROM #DocumentDimension t
LEFT JOIN [Cronus$TI Doc Dim Processing Log] l 
ON l.TableId = t.TableID
WHERE l.LastDocumentNoProcessed IS NULL
	OR t.DocumentNo = LastDocumentNoProcessed AND DocLineNo > LastDocLineNoProcessed 
	OR t.DocumentNo > LastDocumentNoProcessed

OPEN Doc_Cursor 
FETCH NEXT FROM Doc_Cursor INTO @TableId, @DocumentNo, @DocLineNo

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @NewDimensionSetID = 0

	IF @CurrentTableID <> @TableID 
	BEGIN
		SET @TableName = (SELECT 'Cronus$' + Replace(Replace([Name],'/','_'),'.','_')
						  FROM [dbo].[Object] WITH(NOLOCK) 
						  WHERE [Type] = 1 AND [ID] = @TableID)
		SET @CurrentTableID = @TableID
	END

	SET @DimensionValueIDSet = ISNULL(
		(SELECT STUFF(
			(SELECT ',' + CAST(dimv.[Dimension Value ID] AS varchar(10)) AS [text()]
			FROM [dbo].[Cronus$Posted Document Dimension$UPG] dim with(nolock)
			INNER JOIN dbo.[Cronus$Dimension Value] dimv with(nolock)
			ON dimv.[Dimension Code] = dim.[Dimension Code] AND dimv.Code = dim.[Dimension Value Code]
			WHERE dim.[Table ID] = @TableID AND dim.[Document No_] = @DocumentNo AND dim.[Line No_] = @DocLineNo
			ORDER BY [Dimension Value ID]
			FOR XML PATH(''))
			, 1, 1, '' )
		), '')

	IF @DimensionValueIDSet <> '' 
	BEGIN
		SET @DimensionSetID = ISNULL((SELECT DimSetID FROM #DimensionSetCache WHERE DimValueIDSet = @DimensionValueIDSet), 0)
		IF @DimensionSetID = 0
		BEGIN
			EXEC dbo.[Cronus$GetDimensionSetIDByValueIDSet] @DimensionValueIDSet, @DimensionSetID OUTPUT, @Debug;		
	
			INSERT INTO #DimensionSetCache (DimValueIDSet, DimSetID)
			SELECT @DimensionValueIDSet, @DimensionSetID

			IF @Debug = 1 PRINT 'New Dimension Set ID for Table ' + @TableName
				+ ', Document No ' + CAST(@DocumentNo AS NVARCHAR(MAX)) 
				+ ', Document Line No ' + CAST(@DocLineNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

			SET @NewDimensionSetID = 1
		END ELSE
			IF @Debug = 1 PRINT 'Found cached Dimension Set ID for Table ' + @TableName
				+ ', Document No ' + CAST(@DocumentNo AS NVARCHAR(MAX)) 
				+ ', Document Line No ' + CAST(@DocLineNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

		SET @Query = N'
			UPDATE dbo.[' + @TableName + ']
			SET [Dimension Set ID] = ' + CAST(@DimensionSetID as nvarchar(max)) + '
			WHERE'
			+ CASE WHEN @DocLineNo > 0 
				THEN '  [Document No_] = @DocumentNo AND [Line No_] = @DocLineNo' 
				ELSE '  [No_] = @DocumentNo ' 
			  END 
			
		IF @DisplayQueries = 1 
			PRINT(@Query)

		SET @ParamDefinition = N'@DocumentNo nvarchar(30),@DocLineNo int'
		EXECUTE sp_executesql @Query, @ParamDefinition, @DocumentNo=@DocumentNo, @DocLineNo=@DocLineNo
	END		

	FETCH NEXT FROM Doc_Cursor INTO @TableId, @DocumentNo, @DocLineNo

	SET @RecordCounter = @RecordCounter + 1
	IF (@NewDimensionSetID = 1) OR (@RecordCounter % @CommitRecordNumber = 0)
	BEGIN	
		UPDATE [Cronus$TI Doc Dim Processing Log]
		SET LastDocumentNoProcessed = @DocumentNo, LastDocLineNoProcessed = @DocLineNo
		WHERE TableId = @TableID

		IF @Debug=0 COMMIT TRAN DocDim	
			
		SET @CurrentTime = GETDATE()

		SET @TotalSeconds = DATEDIFF(second,@StartTime,@CurrentTime)
		SET @Hours = @TotalSeconds / 3600 
		SET @Minutes = (@TotalSeconds - @Hours * 3600) / 60
		SET @Seconds = @TotalSeconds - @Hours * 3600 - @Minutes * 60
		PRINT 'Processed ' + CAST(@RecordCounter AS NVARCHAR(MAX)) + ' records, working for ' 
			+ CAST(@Hours as varchar(20)) + ' hours '
			+ CAST(@Minutes as varchar(20)) + ' minutes ' 
			+ CAST(@Seconds as varchar(20)) + ' seconds' 

		PRINT '    Last processed record was Table ' + @TableName
				+ ', Document No ' + CAST(@DocumentNo AS NVARCHAR(MAX)) 
				+ ', Document Line No ' + CAST(@DocLineNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

		SET @LastCommitted = @CurrentTime
		WAITFOR DELAY '00:00:00:100'

		IF @Debug=0 BEGIN TRAN DocDim		

		IF @Debug=1 BREAK
	END;

END
CLOSE Doc_Cursor
DEALLOCATE Doc_Cursor

UPDATE [Cronus$TI Doc Dim Processing Log]
SET LastDocumentNoProcessed = @DocumentNo, LastDocLineNoProcessed = @DocLineNo
WHERE TableId = @TableID

IF @Debug=0 
	COMMIT TRAN DocDim
ELSE
	ROLLBACK TRAN DocDim

SET @CurrentTime = GETDATE()
SET @TotalSeconds = DATEDIFF(second,@StartTime,@CurrentTime)
SET @Hours = @TotalSeconds / 3600 
SET @Minutes = (@TotalSeconds - @Hours * 3600) / 60
SET @Seconds = @TotalSeconds - @Hours * 3600 - @Minutes * 60
PRINT 'Done. Processed ' + CAST(@RecordCounter AS NVARCHAR(MAX)) + ' records, it took me ' 
	+ CAST(@Hours as varchar(20)) + ' hours '
	+ CAST(@Minutes as varchar(20)) + ' minutes ' 
	+ CAST(@Seconds as varchar(20)) + ' seconds'
PRINT '    Last processed record was Table ' + @TableName
				+ ', Document No ' + CAST(@DocumentNo AS NVARCHAR(MAX)) 
				+ ', Document Line No ' + CAST(@DocLineNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

IF OBJECT_ID('tempdb..#DimensionSetCache') IS NOT NULL
	DROP TABLE #DimensionSetCache;
IF OBJECT_ID('tempdb..#DocumentDimension') IS NOT NULL
	DROP TABLE #DocumentDimension;

GO

/*
 * When this query is cancelled, run the following to make sure the database is consistent:
 * 
 * ROLLBACK TRAN DocDim
 *
*/
