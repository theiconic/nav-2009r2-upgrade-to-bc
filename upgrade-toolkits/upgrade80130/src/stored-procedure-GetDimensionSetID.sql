USE DynamicsNAV
GO 

IF OBJECT_ID('Cronus$GetDimensionSetID') IS NOT NULL
	DROP PROCEDURE [dbo].[Cronus$GetDimensionSetID]
GO

CREATE PROCEDURE [dbo].[Cronus$GetDimensionSetID] 
(
	@DimensionSetID INT OUTPUT,
	@Debug BIT = 1
)
AS
BEGIN
	SET NOCOUNT ON

	IF @Debug = 1 PRINT(' -> GetDimensionSetID call')

	IF 1=0 /* for the sake of intellisense */
		CREATE TABLE #DimensionSetEntry(
			DimCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
			DimValueCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
			DimValueID int NOT NUll		
		)

	DECLARE @DimSetEntry TABLE 
	(
		DimCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
		DimValueCode nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
		DimValueID int NOT NUll	
	)

	INSERT INTO @DimSetEntry (DimCode, DimValueCode, DimValueID)
	SELECT DimCode, DimValueCode, DimValueID
	FROM #DimensionSetEntry
	WHERE DimCode <> '' AND DimValueCode <> ''

	DECLARE @DimValueID INT, 
		@Found BIT,
		@InUse BIT,
		@DimSetID INT,
		@ParentDimensionSetID INT

	DECLARE DimCursor CURSOR FOR 
	SELECT DimValueID 
	FROM @DimSetEntry
	ORDER BY DimValueID

	SET @Found = 1
	SET @DimensionSetID = 0

	OPEN DimCursor
	FETCH NEXT FROM DimCursor INTO @DimValueID 
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		IF ISNULL(@DimValueID,0) = 0 
		BEGIN
			RAISERROR(N'Dimension Value ID cannot be blank.', 16, 1)
			RETURN
		END;

		IF @Found = 1 
		BEGIN
			SELECT @DimSetID  = 0, @InUse = 0

			SELECT @ParentDimensionSetID = [Parent Dimension Set ID], @DimSetID = [Dimension Set ID], @InUse = [In Use] 
			FROM [Cronus$Dimension Set Tree Node]
			WHERE [Parent Dimension Set ID] = @DimensionSetID AND [Dimension Value ID] = @DimValueID
		
			IF @DimSetID <> 0 
				SET @DimensionSetID = @DimSetID
			ELSE
				SET @Found = 0
		END

		IF @Found = 0 
		BEGIN
			INSERT INTO [Cronus$Dimension Set Tree Node] ([Parent Dimension Set ID], [Dimension Value ID], [In Use])
			VALUES(@DimensionSetID, @DimValueID, 0) 
		
			SELECT @ParentDimensionSetID = [Parent Dimension Set ID], @DimensionSetID = [Dimension Set ID], @InUse = [In Use] 
			FROM [Cronus$Dimension Set Tree Node]
			WHERE [Parent Dimension Set ID] = @DimensionSetID 
				AND [Dimension Value ID] = @DimValueID							
		END 

		IF @Debug = 1 
			PRINT(CAST(@DimensionSetID AS NVARCHAR(MAX)) + ' - DimeValueID: ' + CAST(@DimValueID AS NVARCHAR(MAX)) + ' - In Use: ' + CAST(@InUse AS NVARCHAR(MAX)))

		FETCH NEXT FROM DimCursor INTO @DimValueID 
	END
	CLOSE DimCursor
	DEALLOCATE DimCursor

	IF ISNULL(@DimensionSetID,0) = 0
	BEGIN
		RAISERROR(N'Dimension Set ID was not found.', 16, 1)
		RETURN
	END

	IF @InUse = 0
	BEGIN
		IF @Debug = 1
			PRINT 'Inserting DImension Set ' + CAST(@DimensionSetID AS NVARCHAR(MAX))

		UPDATE [Cronus$Dimension Set Tree Node]
		SET [In Use] = 1
		WHERE [Parent Dimension Set ID] = @ParentDimensionSetID AND [Dimension Value ID] = @DimValueID	

		INSERT INTO [Cronus$Dimension Set Entry] 
			([Dimension Set ID], [Dimension Code], [Dimension Value Code], [Dimension Value ID])
		SELECT @DimensionSetID, DimCode, DimValueCode, DimValueID
		FROM @DimSetEntry
	END

	IF @Debug = 1 PRINT(' -- GetDimensionSetID finished')


/*
Found := TRUE;
DimSetTreeNode."Dimension Set ID" := 0;
REPEAT
  DimSetEntry.TESTFIELD("Dimension Value ID");
  IF Found THEN
    IF NOT DimSetTreeNode.GET(DimSetTreeNode."Dimension Set ID",DimSetEntry."Dimension Value ID") THEN BEGIN
      Found := FALSE;
      DimSetTreeNode.LOCKTABLE;
    END;
  IF NOT Found THEN BEGIN
    DimSetTreeNode."Parent Dimension Set ID" := DimSetTreeNode."Dimension Set ID";
    DimSetTreeNode."Dimension Value ID" := DimSetEntry."Dimension Value ID";
    DimSetTreeNode."Dimension Set ID" := 0;
    DimSetTreeNode."In Use" := FALSE;
    IF NOT DimSetTreeNode.INSERT(TRUE) THEN
      DimSetTreeNode.GET(DimSetTreeNode."Parent Dimension Set ID",DimSetTreeNode."Dimension Value ID");
  END;
UNTIL DimSetEntry.NEXT = 0;
IF NOT DimSetTreeNode."In Use" THEN BEGIN
  IF Found THEN BEGIN
    DimSetTreeNode.LOCKTABLE;
    DimSetTreeNode.GET(DimSetTreeNode."Parent Dimension Set ID",DimSetTreeNode."Dimension Value ID");
  END;
  DimSetTreeNode."In Use" := TRUE;
  DimSetTreeNode.MODIFY;
  InsertDimSetEntries(DimSetEntry,DimSetTreeNode."Dimension Set ID");
END;

DimSetEntry.COPY(DimSetEntry2);

EXIT(DimSetTreeNode."Dimension Set ID");

*/

END
GO