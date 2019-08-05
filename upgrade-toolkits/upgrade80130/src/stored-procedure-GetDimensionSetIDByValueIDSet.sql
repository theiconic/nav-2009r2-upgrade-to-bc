IF OBJECT_ID('Cronus$GetDimensionSetIDByValueIDSet') IS NOT NULL
	DROP PROCEDURE [dbo].[Cronus$GetDimensionSetIDByValueIDSet]
GO

CREATE PROCEDURE [dbo].[Cronus$GetDimensionSetIDByValueIDSet] 
(
	@DimensionValueIDSet VARCHAR(60),
	@DimensionSetID INT OUTPUT,
	@Debug BIT = 1
)
AS
BEGIN
	SET NOCOUNT ON

	IF @Debug = 1 PRINT(' -> GetDimensionSetID call')

	DECLARE @xml as XML, @Delimiter as varchar(10)
	SET @Delimiter =','
	SET @xml = cast(('<X>'+replace(@DimensionValueIDSet,@Delimiter ,'</X><X>')+'</X>') as xml)

	DECLARE @DimValueID INT, 
		@Found BIT,
		@InUse BIT,
		@DimSetID INT,
		@ParentDimensionSetID INT

	DECLARE DimCursor CURSOR FOR 
	SELECT N.value('.', 'int') as DimValueID 
	FROM @xml.nodes('X') as T(N) 
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
		SELECT @DimensionSetID, [Dimension Code], [Code], DimValueID
		FROM (
			SELECT N.value('.', 'int') as DimValueID 
			FROM @xml.nodes('X') as T(N)
		) d
		LEFT JOIN [Cronus$Dimension Value] dv
		ON dv.[Dimension Value ID] = d.DimValueID
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


