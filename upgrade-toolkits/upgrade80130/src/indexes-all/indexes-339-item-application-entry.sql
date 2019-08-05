SET ANSI_NULLS ON
GO

PRINT 'Item Application Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Item Application Entry]
(
	[Inbound Item Entry No_] ASC,
	[Outbound Item Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Item Application Entry]
(
	[Item Ledger Entry No_] ASC,
	[Output Completely Invd_ Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary Importance >>
SET ANSI_NULLS ON
GO

PRINT 'Item Application Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Item Application Entry]
(
	[Inbound Item Entry No_] ASC,
	[Item Ledger Entry No_] ASC,
	[Outbound Item Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Item Application Entry]
(
	[Outbound Item Entry No_] ASC,
	[Item Ledger Entry No_] ASC,
	[Cost Application] ASC,
	[Transferred-from Entry No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Item Application Entry]
(
	[Transferred-from Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


