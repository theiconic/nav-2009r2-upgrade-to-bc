-- Execute just before the opening with NAV 2013 for conversion

-- Move LE and document dimensions out of the conversion process to use as a source to generate Dimensions in BC later
EXEC sp_rename 'Cronus$Ledger Entry Dimension$0', 'Cronus$Ledger Entry Dimension$UPG$0', 'object'
EXEC sp_rename 'Cronus$Ledger Entry Dimension', 'Cronus$Ledger Entry Dimension$UPG'
GO
CREATE TABLE [dbo].[Cronus$Ledger Entry Dimension](
	[timestamp] [timestamp] NOT NULL,
	[Table ID] [int] NOT NULL,
	[Entry No_] [int] NOT NULL,
	[Dimension Code] [varchar](20) NOT NULL,
	[Dimension Value Code] [varchar](20) NOT NULL,
 CONSTRAINT [Cronus$Ledger Entry Dimension$0] PRIMARY KEY CLUSTERED 
(
	[Table ID] ASC,
	[Entry No_] ASC,
	[Dimension Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data Filegroup 1]
) ON [Data Filegroup 1]
GO

EXEC sp_rename 'Cronus$Posted Document Dimension$0', 'Cronus$Posted Document Dimension$UPG$0', 'object'
EXEC sp_rename 'Cronus$Posted Document Dimension', 'Cronus$Posted Document Dimension$UPG'
GO
CREATE TABLE [dbo].[Cronus$Posted Document Dimension](
	[timestamp] [timestamp] NOT NULL,
	[Table ID] [int] NOT NULL,
	[Document No_] [varchar](20) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Dimension Code] [varchar](20) NOT NULL,
	[Dimension Value Code] [varchar](20) NOT NULL,
 CONSTRAINT [Cronus$Posted Document Dimension$0] PRIMARY KEY CLUSTERED 
(
	[Table ID] ASC,
	[Document No_] ASC,
	[Line No_] ASC,
	[Dimension Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data Filegroup 1]
) ON [Data Filegroup 1]
GO

EXEC sp_rename 'Cronus$Document Dimension$0', 'Cronus$Document Dimension$UPG$0', 'object'
EXEC sp_rename 'Cronus$Document Dimension', 'Cronus$Document Dimension$UPG'
GO
CREATE TABLE [dbo].[Cronus$Document Dimension](
	[timestamp] [timestamp] NOT NULL,
	[Table ID] [int] NOT NULL,
	[Document Type] [int] NOT NULL,
	[Document No_] [varchar](20) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Dimension Code] [varchar](20) NOT NULL,
	[Dimension Value Code] [varchar](20) NOT NULL,
 CONSTRAINT [Cronus$Document Dimension$0] PRIMARY KEY CLUSTERED 
(
	[Table ID] ASC,
	[Document Type] ASC,
	[Document No_] ASC,
	[Line No_] ASC,
	[Dimension Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data Filegroup 1]
) ON [Data Filegroup 1]
GO

EXEC sp_rename 'Cronus$Document Dimension Archive$0', 'Cronus$Document Dimension Archive$UPG$0', 'object'
EXEC sp_rename 'Cronus$Document Dimension Archive', 'Cronus$Document Dimension Archive$UPG'
GO
CREATE TABLE [dbo].[Cronus$Document Dimension Archive](
	[timestamp] [timestamp] NOT NULL,
	[Table ID] [int] NOT NULL,
	[Document Type] [int] NOT NULL,
	[Document No_] [varchar](20) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Doc_ No_ Occurrence] [int] NOT NULL,
	[Version No_] [int] NOT NULL,
	[Dimension Code] [varchar](20) NOT NULL,
	[Dimension Value Code] [varchar](20) NOT NULL,
 CONSTRAINT [Cronus$Document Dimension Archive$0] PRIMARY KEY CLUSTERED 
(
	[Table ID] ASC,
	[Document Type] ASC,
	[Document No_] ASC,
	[Line No_] ASC,
	[Doc_ No_ Occurrence] ASC,
	[Version No_] ASC,
	[Dimension Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data Filegroup 1]
) ON [Data Filegroup 1]
GO

EXEC sp_rename 'Cronus$Journal Line Dimension$0', 'Cronus$Journal Line Dimension$UPG$0', 'object'
EXEC sp_rename 'Cronus$Journal Line Dimension', 'Cronus$Journal Line Dimension$UPG'
GO
CREATE TABLE [dbo].[Cronus$Journal Line Dimension](
	[timestamp] [timestamp] NOT NULL,
	[Table ID] [int] NOT NULL,
	[Journal Template Name] [varchar](10) NOT NULL,
	[Journal Batch Name] [varchar](10) NOT NULL,
	[Journal Line No_] [int] NOT NULL,
	[Allocation Line No_] [int] NOT NULL,
	[Dimension Code] [varchar](20) NOT NULL,
	[Dimension Value Code] [varchar](20) NOT NULL,
	[New Dimension Value Code] [varchar](20) NOT NULL,
 CONSTRAINT [Cronus$Journal Line Dimension$0] PRIMARY KEY CLUSTERED 
(
	[Table ID] ASC,
	[Journal Template Name] ASC,
	[Journal Batch Name] ASC,
	[Journal Line No_] ASC,
	[Allocation Line No_] ASC,
	[Dimension Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data Filegroup 1]
) ON [Data Filegroup 1]
GO

-- The standard upgrade drops primary keys, which makes the server rebuild the rest of the indexes. 
-- To trick NAV, rename the tables' PK constraints and provide NAV with a fake to drop during the conversion.
DECLARE @TableNo int, @TableName nvarchar(200)

DECLARE @CompName nvarchar(50) = 'Cronus'
DECLARE @InvalidChars nvarchar(128) = '.\/"'''

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

	PRINT 'Updating ' + @TableName + ' - ' + CAST(@TableNo AS NVARCHAR(MAX))	

	SET @PK0Name = @TableName + '$0'
	SET	@NewPK0Name = @TableName + '$0$PK'
	
	/*
	SET @query = 'ALTER TABLE [dbo].[' + @TableName + '] ' +
		'DROP CONSTRAINT [' + @NewPK0Name + ']'
	EXEC(@query)
	*/
			
	EXEC sp_rename @objname=@PK0Name,@newname=@NewPK0Name, @objtype='object'

	-- add trivial constraint to drop by NAV and keep the PK
	SET @query = 'ALTER TABLE [dbo].[' + @TableName + '] WITH NOCHECK ' +
		'ADD CONSTRAINT ['+ @PK0Name +'] CHECK (NULL=NULL); ' +
		'ALTER TABLE [dbo].[' + @TableName + '] NOCHECK CONSTRAINT ['+ @PK0Name +'];'
	EXEC(@query)
	--PRINT @query	

	FETCH NEXT FROM Table_Cursor INTO @TableName, @TableNo
END
CLOSE Table_Cursor
DEALLOCATE Table_Cursor
GO


-- Remove all indexes that were created manually
print 'Dropping manually added indexes'
DECLARE @IndexName varchar(200), @TableName varchar(200)

DECLARE index_cursor CURSOR FOR
SELECT TABLE_NAME, i.name 
FROM DynamicsNAV.INFORMATION_SCHEMA.TABLES t
INNER JOIN sys.indexes i 
ON i.object_id = OBJECT_ID(TABLE_NAME) AND i.name IS NOT NULL
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME LIKE 'Cronus%'
	AND i.is_primary_key = 0
	/* don't drop created by NAV */
	AND i.name NOT LIKE '$%[0-9]'	

OPEN index_cursor
FETCH NEXT FROM index_cursor INTO @TableName, @IndexName

WHILE @@FETCH_STATUS = 0
BEGIN
	print 'Dropping index [' + @IndexName + '] on [' + @TableName + ']'
	EXEC('DROP INDEX [' + @IndexName + '] ON [' + @TableName +']')

	FETCH NEXT FROM index_cursor INTO @TableName, @IndexName
END

CLOSE index_cursor
DEALLOCATE index_cursor

GO

-- fix localisation issue that stops data uprade in NAV 2015
UPDATE [Cronus$Outlook Synch_ Filter]
SET Value = 'Organizer'
WHERE [Table No_] = 5080 AND [Field No_] = 45 AND Value = 'Organiser'
GO