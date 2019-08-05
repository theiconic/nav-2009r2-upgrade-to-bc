USE DynamicsNAV -- UPDATE IF REQUIRED
GO

SET NOCOUNT ON

DECLARE @DisplayQueries bit = 0,
	@Debug bit = 0

DECLARE @CompanyName nvarchar(100) = 'Cronus',
	@TableID int, 
	@TableName nvarchar(150),
	@Query nvarchar(max),
	@ParamDefinition nvarchar(max),
	@StartTime datetime,
	@TemplateName nvarchar(20),
	@BatchName nvarchar(20),
	@LineNo int,
	@AllocationLineNo int,
	@DimensionSetID int,
	@RecordCount int,
	@CurrRecordIndex int,
	@LastStatusUpdateTime datetime

IF OBJECT_ID('tempdb..#TIUpgRecord') IS NOT NULL
	DROP TABLE #TIUpgRecord

CREATE TABLE #TIUpgRecord(
	[Journal Template Name] nvarchar(20),
	[Journal Batch Name] nvarchar(20),
	[Journal Line No_] int,
	[Allocation Line No_] int
) 

IF OBJECT_ID('tempdb..#DimensionSetEntry') IS NOT NULL
	DROP TABLE #DimensionSetEntry

CREATE TABLE #DimensionSetEntry(
	DimCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	DimValueCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	DimValueID int NOT NUll		
)

DECLARE Table_Cursor CURSOR FOR
SELECT DISTINCT d.[Table ID] as TableID, 
	@CompanyName + '$' + Replace(Replace(o.Name,'/','_'),'.','_') as TableName
FROM [dbo].[Cronus$Journal Line Dimension$UPG] d with(nolock)
INNER JOIN [dbo].[Object] o with(nolock) ON o.Type = 1 /* Table */ AND o.ID = d.[Table ID]

OPEN Table_Cursor 
FETCH NEXT FROM Table_Cursor INTO @TableID, @TableName

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @StartTime = GETDATE()
	PRINT ('***************** ' + CAST(@TableID AS NVARCHAR(MAX)) + ' ' + @TableName + ' ******************************')
	SET @LastStatusUpdateTime = @StartTime

	TRUNCATE TABLE #TIUpgRecord

	SET @Query = N'
		INSERT INTO #TIUpgRecord ([Journal Template Name], [Journal Batch Name], [Journal Line No_], [Allocation Line No_])
		SELECT DISTINCT dim.[Journal Template Name], dim.[Journal Batch Name], dim.[Journal Line No_], dim.[Allocation Line No_]
		FROM [dbo].[Cronus$Journal Line Dimension$UPG] dim with(nolock)
		INNER JOIN dbo.[' + @TableName + '] r with(nolock)'
		+ CASE 			
			WHEN @TableID = 221 /* Gen_ Jnl_ Allocation  */
				THEN 
		'ON r.[Journal Template Name] = dim.[Journal Template Name] AND r.[Journal Batch Name] = dim.[Journal Batch Name] 
			AND r.[Journal Line No_] = dim.[Journal Line No_] AND r.[Line No_] = dim.[Allocation Line No_] 	
		WHERE dim.[Table ID] = @TableID AND r.[Dimension Set ID] = 0
		'
			WHEN @TableID = 751 /* Standard General Journal Line */
				THEN
		'ON r.[Journal Template Name] = dim.[Journal Template Name] AND r.[Standard Journal Code] = dim.[Journal Batch Name] 
			AND r.[Line No_] = dim.[Journal Line No_] 	
		WHERE dim.[Table ID] = @TableID AND dim.[Allocation Line No_] = 0 AND r.[Dimension Set ID] = 0
		'
			ELSE -- WHEN @TableID IN (81,83) THEN /* Gen_ Journal Line, Item Journal Line  */
		'ON r.[Journal Template Name] = dim.[Journal Template Name] AND r.[Journal Batch Name] = dim.[Journal Batch Name] 
			AND r.[Line No_] = dim.[Journal Line No_]		
		WHERE dim.[Table ID] = @TableID AND dim.[Allocation Line No_] = 0 AND r.[Dimension Set ID] = 0
		'
		END

	IF @DisplayQueries = 1 
		PRINT(@Query)

	SET @ParamDefinition = N'@TableID int'
	EXECUTE sp_executesql @Query, @ParamDefinition, @TableID=@TableID

	SET @RecordCount = ISNULL((SELECT COUNT(*) FROM #TIUpgRecord), 0)
	SET @CurrRecordIndex = 0
	PRINT 'Processing ' + CAST(@RecordCount AS NVARCHAR(MAX)) + ' records...'

	DECLARE RecordCursor CURSOR FOR
	SELECT [Journal Template Name], [Journal Batch Name], [Journal Line No_], [Allocation Line No_]
	FROM #TIUpgRecord 

	OPEN RecordCursor 
	FETCH NEXT FROM RecordCursor INTO @TemplateName, @BatchName, @LineNo, @AllocationLineNo

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @CurrRecordIndex = @CurrRecordIndex + 1
		IF DATEDIFF(minute, @LastStatusUpdateTime, GETDATE()) > 5
		BEGIN
			PRINT 'Processed ' + CAST(@CurrRecordIndex AS NVARCHAR(MAX)) + ' records, ~' + ROUND(@CurrRecordIndex/@RecordCount*100, 0) + '% done'   
			SET @LastStatusUpdateTime = GETDATE()
		END	

		TRUNCATE TABLE #DimensionSetEntry

		INSERT INTO #DimensionSetEntry
		SELECT dim.[Dimension Code], dim.[Dimension Value Code], dimv.[Dimension Value ID]
		FROM [dbo].[Cronus$Journal Line Dimension$UPG] dim with(nolock)
		INNER JOIN dbo.[Cronus$Dimension Value] dimv with(nolock)
			ON dimv.[Dimension Code] = dim.[Dimension Code] AND dimv.Code = dim.[Dimension Value Code]
		WHERE dim.[Table ID] = @TableID 
			AND dim.[Journal Template Name] = @TemplateName AND dim.[Journal Batch Name] = @BatchName 
			AND dim.[Journal Line No_] = @LineNo AND dim.[Allocation Line No_] = @AllocationLineNo

		IF @debug = 1
			SELECT @TableName 'TableName', @TableID 'TableID',  @TemplateName 'Template Name', @BatchName 'Batch Name', @LineNo 'Line No', * 
			FROM #DimensionSetEntry

		EXEC dbo.[Cronus$GetDimensionSetID] @DimensionSetID OUTPUT, @Debug;

		IF @Debug = 1
			SELECT @DimensionSetID 'Dimension Set ID'
	
		SET @Query = N'
			UPDATE dbo.[' + @TableName + ']
			SET [Dimension Set ID] = ' + CAST(@DimensionSetID as nvarchar(max))
			+ CASE 			
				WHEN @TableID = 221 /* Gen_ Jnl_ Allocation  */
					THEN 
			'WHERE [Journal Template Name] = @TemplateName AND [Journal Batch Name] = @BatchName 
				AND [Journal Line No_] = @LineNo AND [Line No_] = @AllocationLineNo' 
				WHEN @TableID = 751 /* Standard General Journal Line */
					THEN
			'WHERE [Journal Template Name] = @TemplateName AND [Standard Journal Code] = @BatchName 
				AND [Line No_] = @LineNo' 
				ELSE
			'WHERE [Journal Template Name] = @TemplateName AND [Journal Batch Name] = @BatchName 
				AND [Line No_] = @LineNo'
			END
						
		IF @DisplayQueries = 1 
			PRINT(@Query)

		SET @ParamDefinition = N'@TemplateName nvarchar(20),@BatchName nvarchar(20),@LineNo int, @AllocationLineNo int'
		EXECUTE sp_executesql @Query, @ParamDefinition, @TemplateName=@TemplateName, @BatchName=@BatchName, @LineNo=@LineNo, @AllocationLineNo=@AllocationLineNo

		FETCH NEXT FROM RecordCursor INTO @TemplateName, @BatchName, @LineNo, @AllocationLineNo
	END
	CLOSE RecordCursor
	DEALLOCATE RecordCursor

	PRINT 'Done....... Elapsed Time = ' + CAST(DATEDIFF(minute,@StartTime,GETDATE()) as varchar(20)) + ' minutes ' + CAST(DATEDIFF(second,@StartTime,GETDATE()) as varchar(20)) + ' seconds'

	FETCH NEXT FROM Table_Cursor INTO @TableID, @TableName
END
CLOSE Table_Cursor
DEALLOCATE Table_Cursor
	
IF OBJECT_ID('tempdb..#TIUpgRecord') IS NOT NULL
	DROP TABLE #TIUpgRecord
IF OBJECT_ID('tempdb..#DimensionSetEntry') IS NOT NULL
	DROP TABLE #DimensionSetEntry

GO