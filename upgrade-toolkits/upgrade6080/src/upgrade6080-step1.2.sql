-- Revert chnages done to PKs in case tables were not recreated
DECLARE @TableNo int, @TableName nvarchar(200)

DECLARE @CompName nvarchar(50) = 'Cronus'

DECLARE Table_Cursor CURSOR FORWARD_ONLY FOR
SELECT [Name],[ID] 
FROM [Object] WITH (NOLOCK)
WHERE ([Type] = 1) AND ([ID] < 2000000000) 
ORDER BY [ID]

DECLARE @query nvarchar(max), @PK0Name nvarchar(max), @NewPK0Name nvarchar(max)

OPEN Table_Cursor
FETCH NEXT FROM Table_Cursor INTO @TableName, @TableNo
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @TableName = Replace(@TableName,'.','_')
	SET @TableName = Replace(@TableName,'\','_')
	SET @TableName = Replace(@TableName,'/','_')
	SET @TableName = Replace(@TableName,'''','_')
	SET @TableName = Replace(@TableName,'"','_')
	SET @TableName = @CompName + '$' + @TableName

	IF OBJECT_ID(@TableName) IS NULL 
	BEGIN
		-- we shouldn't bother about these but worth checking
		PRINT 'Warinig: not found: ' + @TableName + ' - ' + CAST(@TableNo AS NVARCHAR(MAX))	
		FETCH NEXT FROM Table_Cursor INTO @TableName, @TableNo
		CONTINUE
	END		

	SET @PK0Name = @TableName + '$0'
	SET	@NewPK0Name = @TableName + '$0$PK'
	
	IF OBJECT_ID(@NewPK0Name) IS NOT NULL
	BEGIN
		PRINT 'Updating ' + @TableName + ' - ' + CAST(@TableNo AS NVARCHAR(MAX))
		SET @query = 'ALTER TABLE [dbo].[' + @TableName + '] ' +
		'DROP CONSTRAINT [' + @PK0Name + ']'
		EXEC(@query)
		print(@query)
		EXEC sp_rename @objname=@NewPK0Name,@newname=@PK0Name, @objtype='object'
	END
		
	FETCH NEXT FROM Table_Cursor INTO @TableName, @TableNo
END
CLOSE Table_Cursor
DEALLOCATE Table_Cursor
GO