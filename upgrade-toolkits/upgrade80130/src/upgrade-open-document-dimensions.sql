USE DynamicsNAV -- UPDATE IF REQUIRED
GO

SET NOCOUNT ON

DECLARE @DisplayQueries bit = 0,
	@Debug bit = 0

DECLARE @CompanyName nvarchar(100) = 'Cronus',
	@TableID int, 
	@TableName nvarchar(150),
	@HasLines bit,
	@HasDocumentType bit,
	@Query nvarchar(max),
	@ParamDefinition nvarchar(max),
	@StartTime datetime,
	@DocumentType int,
	@DocumentNo nvarchar(30),
	@DocLineNo int,
	@DimensionSetID int,
	@RecordCount int,
	@CurrRecordIndex int,
	@LastStatusUpdateTime datetime

IF OBJECT_ID('tempdb..#TIUpgDocRecord') IS NOT NULL
	DROP TABLE #TIUpgDocRecord

CREATE TABLE #TIUpgDocRecord(
	[Document Type] int,
	[Document No_] nvarchar(20),
	[Line No_] int
) 

IF OBJECT_ID('tempdb..#DimensionSetEntry') IS NOT NULL
	DROP TABLE #DimensionSetEntry

CREATE TABLE #DimensionSetEntry(
	DimCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	DimValueCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	DimValueID int NOT NUll		
)

DECLARE Table_Cursor CURSOR FOR
SELECT DISTINCT 
	d.[Table ID] as TableID, 
	@CompanyName + '$' + o.Name as TableName, 
	CASE WHEN d.[Line No_] <> 0 THEN 1 ELSE 0 END HasLines,
	CASE WHEN d.[Document Type] < 6 /* Space/blank */ THEN 1 ELSE 0 END HasDocumentType
FROM [dbo].[Cronus$Document Dimension$UPG] d with(nolock)
INNER JOIN [dbo].[Object] o with(nolock)  
	ON o.Type = 1 /* Table */ AND o.ID = d.[Table ID]

OPEN Table_Cursor 
FETCH NEXT FROM Table_Cursor INTO @TableID, @TableName, @HasLines, @HasDocumentType

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @StartTime = GETDATE()
	PRINT ('***************** ' + CAST(@TableID AS NVARCHAR(MAX)) + ' ' + @TableName + ' ******************************')
	SET @LastStatusUpdateTime = @StartTime

	TRUNCATE TABLE #TIUpgDocRecord

	SET @Query = N'
		INSERT INTO #TIUpgDocRecord ([Document Type], [Document No_], [Line No_])
		SELECT DISTINCT dim.[Document Type], dim.[Document No_], dim.[Line No_]		
		FROM [dbo].[Cronus$Document Dimension$UPG] dim with(nolock)
		INNER JOIN dbo.[' + @TableName + '] doc with(nolock)
		ON'
		+ CASE WHEN @HasDocumentType = 1 THEN N' doc.[Document Type] = dim.[Document Type] AND' ELSE '' END		
		+ CASE 
			WHEN @HasLines = 1 
				THEN N' doc.[Document No_] = dim.[Document No_] AND dim.[Line No_] = doc.[Line No_] ' 
				ELSE N' doc.[No_] = dim.[Document No_] AND dim.[Line No_] = 0 '
		END + '
		WHERE dim.[Table ID] = @TableID AND doc.[Dimension Set ID] = 0
		'
	IF @DisplayQueries = 1 
		PRINT(@Query)

	SET @ParamDefinition = N'@TableID int'
	EXECUTE sp_executesql @Query, @ParamDefinition, @TableID=@TableID

	SET @RecordCount = ISNULL((SELECT COUNT(*) FROM #TIUpgDocRecord), 0)
	SET @CurrRecordIndex = 0
	PRINT 'Processing ' + CAST(@RecordCount AS NVARCHAR(MAX)) + ' records...'

	DECLARE RecordCursor CURSOR FOR
	SELECT [Document Type], [Document No_], [Line No_] 
	FROM #TIUpgDocRecord 

	OPEN RecordCursor 
	FETCH NEXT FROM RecordCursor INTO @DocumentType, @DocumentNo, @DocLineNo

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @CurrRecordIndex = @CurrRecordIndex + 1
		IF DATEDIFF(minute, @LastStatusUpdateTime, GETDATE()) > 5
		BEGIN
			PRINT 'Processed ' + CAST(@CurrRecordIndex AS NVARCHAR(MAX)) + ' records, ~' 
				 + CAST(CAST(ROUND(100.0*@CurrRecordIndex/@RecordCount,0) AS int) as nvarchar(max)) + '% done'   
			SET @LastStatusUpdateTime = GETDATE()
		END	

		TRUNCATE TABLE #DimensionSetEntry

		INSERT INTO #DimensionSetEntry
		SELECT dim.[Dimension Code], dim.[Dimension Value Code], dimv.[Dimension Value ID]
		FROM [dbo].[Cronus$Document Dimension$UPG] dim with(nolock)
		INNER JOIN dbo.[Cronus$Dimension Value] dimv with(nolock)
			ON dimv.[Dimension Code] = dim.[Dimension Code] AND dimv.Code = dim.[Dimension Value Code]
		WHERE dim.[Table ID] = @TableID AND dim.[Document Type] = @DocumentType AND dim.[Document No_] = @DocumentNo
			AND dim.[Line No_] = @DocLineNo

		IF @debug = 1
			SELECT @TableName 'TableName', @TableID 'TableID',  @DocumentType 'Doc Type', @DocumentNo 'Doc No', @DocLineNo 'Doc Line No', * 
			FROM #DimensionSetEntry

		EXEC dbo.[Cronus$GetDimensionSetID] @DimensionSetID OUTPUT, @Debug;

		IF @Debug = 1
			SELECT @DimensionSetID 'Dimension Set ID'
	
		SET @Query = N'
			UPDATE dbo.[' + @TableName + ']
			SET [Dimension Set ID] = ' + CAST(@DimensionSetID as nvarchar(max)) + '
			WHERE'
			+ CASE WHEN @HasDocumentType = 1 THEN N' [Document Type] = @DocumentType AND' ELSE '' END		
			+ CASE WHEN @HasLines = 1 
				THEN '  [Document No_] = @DocumentNo AND [Line No_] = @DocLineNo' 
				ELSE '  [No_] = @DocumentNo ' 
			  END 
			
		IF @DisplayQueries = 1 
			PRINT(@Query)

		SET @ParamDefinition = N'@DocumentType int,@DocumentNo nvarchar(30),@DocLineNo int'
		EXECUTE sp_executesql @Query, @ParamDefinition, @DocumentType=@DocumentType, @DocumentNo=@DocumentNo, @DocLineNo=@DocLineNo

		FETCH NEXT FROM RecordCursor INTO @DocumentType, @DocumentNo, @DocLineNo;
	END
	CLOSE RecordCursor
	DEALLOCATE RecordCursor

	PRINT 'Done....... Elapsed Time = ' + CAST(DATEDIFF(minute,@StartTime,GETDATE()) as varchar(20)) + ' minutes ' + CAST(DATEDIFF(second,@StartTime,GETDATE()) as varchar(20)) + ' seconds'

	FETCH NEXT FROM Table_Cursor INTO @TableID, @TableName, @HasLines, @HasDocumentType
END
CLOSE Table_Cursor
DEALLOCATE Table_Cursor
	
IF OBJECT_ID('tempdb..#TIUpgDocRecord') IS NOT NULL
	DROP TABLE #TIUpgDocRecord
IF OBJECT_ID('tempdb..#DimensionSetEntry') IS NOT NULL
	DROP TABLE #DimensionSetEntry

GO
