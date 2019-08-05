-- 41 minutes

USE DynamicsNAV -- UPDATE IF REQUIRED
GO

/*
 * This script updates the G/L Entry (17) only Dimension Set IDs. 
 * 
 * The list of tables that used to be in the Ledger Entry Dimension table:
 * TableID	TableName
 * 17	G_L Entry
 * 21	Cust_ Ledger Entry
 * 25	Vendor Ledger Entry
 * 32	Item Ledger Entry
 * 271	Bank Account Ledger Entry
 * 281	Phys_ Inventory Ledger Entry
 * 5601	FA Ledger Entry
 * 5802	Value Entry
 * 
 */

BEGIN TRAN GLEntryDim

SET NOCOUNT ON

IF OBJECT_ID('Cronus$TI Ledger Entry Processing Log') IS NULL
	CREATE TABLE [Cronus$TI Ledger Entry Processing Log] (
		TableId int not null PRIMARY KEY,
		LastEntryNoProcessed int not null
	)

DECLARE @Debug bit = 0

DECLARE @StartTime datetime,
	@EntryNo int,
	@FirstEntryNoWithDimension int,
	@StartFromEntryNo int,
	@DimensionSetID int,
	@EntryCounter int = 0,
	@LastCommitted datetime,
	@CurrentTime datetime,
	@TotalSeconds int,
	@Seconds int,
	@Minutes int, 
	@Hours int,
	@DimensionValueIDSet varchar(60),
	@NewDimensionSetID bit

IF OBJECT_ID('tempdb..#DimensionSetCache') IS NOT NULL
	DROP TABLE #DimensionSetCache

CREATE TABLE #DimensionSetCache(
	DimValueIDSet varchar(60) PRIMARY KEY CLUSTERED,
	DimSetID int NOT NUll	
)

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

DECLARE @TableID int = 32 

IF NOT EXISTS(SELECT TOP 1 NULL FROM [Cronus$TI Ledger Entry Processing Log] WHERE TableId = @TableID)
	INSERT INTO [Cronus$TI Ledger Entry Processing Log] (TableId, LastEntryNoProcessed)
	SELECT @TableID, 0

SET @StartTime = GETDATE()
SET @CurrentTime = @StartTime
SET @LastCommitted = @CurrentTime
PRINT 'Started at ' + CAST(@StartTime AS NVARCHAR(MAX))

SET @StartFromEntryNo = ISNULL((SELECT LastEntryNoProcessed FROM [Cronus$TI Ledger Entry Processing Log] WHERE TableId = @TableID), 0) + 1
SET @FirstEntryNoWithDimension = ISNULL((SELECT MIN([Entry No_]) FROM [dbo].[Cronus$Ledger Entry Dimension$UPG] WHERE [Table ID] = @TableID), 0)

IF @StartFromEntryNo < @FirstEntryNoWithDimension
	SET @StartFromEntryNo = @FirstEntryNoWithDimension

DECLARE Entry_Cursor CURSOR FOR
SELECT [Entry No_], [Dimension Set ID]
FROM [Cronus$Item Ledger Entry] t
WHERE t.[Entry No_] >= @StartFromEntryNo

OPEN Entry_Cursor 
FETCH NEXT FROM Entry_Cursor INTO @EntryNo, @DimensionSetID

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @NewDimensionSetID = 0

	SET @DimensionValueIDSet = ISNULL(
		(SELECT STUFF(
			(SELECT ',' + CAST(dimv.[Dimension Value ID] AS varchar(10)) AS [text()]
			FROM [dbo].[Cronus$Ledger Entry Dimension$UPG] dim with(nolock)
			INNER JOIN dbo.[Cronus$Dimension Value] dimv with(nolock)
			ON dimv.[Dimension Code] = dim.[Dimension Code] AND dimv.Code = dim.[Dimension Value Code]
			WHERE dim.[Table ID] = @TableID AND dim.[Entry No_] = @EntryNo
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

			IF @Debug = 1 PRINT 'New Dimension Set ID for Entry No ' + CAST(@EntryNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

			SET @NewDimensionSetID = 1
		END ELSE
			IF @Debug=1 PRINT 'Found cached Dimension Set ID for Entry No ' + CAST(@EntryNo AS NVARCHAR(MAX)) + ': ' 
				+ CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' set of value IDs ' + @DimensionValueIDSet

		UPDATE dbo.[Cronus$Item Ledger Entry]
		SET [Dimension Set ID] = @DimensionSetID		
		WHERE [Entry No_] = @EntryNo		
	END		

	FETCH NEXT FROM Entry_Cursor INTO @EntryNo, @DimensionSetID

	SET @EntryCounter = @EntryCounter + 1
	IF (@NewDimensionSetID = 1) OR (@EntryCounter % 50000 = 0)
	BEGIN	
		UPDATE [Cronus$TI Ledger Entry Processing Log]
		SET LastEntryNoProcessed = ISNULL(@EntryNo, 0)
		WHERE TableId = @TableID

		COMMIT TRAN GLEntryDim	
			
		SET @CurrentTime = GETDATE()

		SET @TotalSeconds = DATEDIFF(second,@StartTime,@CurrentTime)
		SET @Hours = @TotalSeconds / 3600 
		SET @Minutes = (@TotalSeconds - @Hours * 3600) / 60
		SET @Seconds = @TotalSeconds - @Hours * 3600 - @Minutes * 60
		PRINT 'Processed ' + CAST(@EntryCounter AS NVARCHAR(MAX)) + ' records, working for ' 
			+ CAST(@Hours as varchar(20)) + ' hours '
			+ CAST(@Minutes as varchar(20)) + ' minutes ' 
			+ CAST(@Seconds as varchar(20)) + ' seconds' 

		SET @LastCommitted = @CurrentTime
		WAITFOR DELAY '00:00:00:100'

		BEGIN TRAN GLEntryDim		

		IF @Debug=1 BREAK
	END;

END
CLOSE Entry_Cursor
DEALLOCATE Entry_Cursor

UPDATE [Cronus$TI Ledger Entry Processing Log]
SET LastEntryNoProcessed = ISNULL(@EntryNo, 0)
WHERE TableId = @TableID

SET @CurrentTime = GETDATE()
SET @TotalSeconds = DATEDIFF(second,@StartTime,@CurrentTime)
SET @Hours = @TotalSeconds / 3600 
SET @Minutes = (@TotalSeconds - @Hours * 3600) / 60
SET @Seconds = @TotalSeconds - @Hours * 3600 - @Minutes * 60
PRINT 'Done. Processed ' + CAST(@EntryCounter AS NVARCHAR(MAX)) + ' records, it took me ' 
	+ CAST(@Hours as varchar(20)) + ' hours '
	+ CAST(@Minutes as varchar(20)) + ' minutes ' 
	+ CAST(@Seconds as varchar(20)) + ' seconds'

IF OBJECT_ID('tempdb..#DimensionSetEntry') IS NOT NULL
	DROP TABLE #DimensionSetEntry

COMMIT TRAN GLEntryDim

GO

/*
 * When this query is cancelled, run the following to make sure the database is consistent:
 * 
 * ROLLBACK TRAN GLEntryDim
 *
*/
