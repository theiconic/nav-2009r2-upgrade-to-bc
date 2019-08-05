
PRINT 'Value Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Value Entry]
(
	[Item Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Item Ledger Entry Type] ASC,
	[Entry Type] ASC,
	[Variance Type] ASC,
	[Item Charge No_] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Value Entry]
(
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'Value Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Value Entry]
(
	[Order Type] ASC,
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Value Entry]
(
	[Job No_] ASC,
	[Job Task No_] ASC,
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Value Entry]
(
	[Item Ledger Entry Type] ASC,
	[Posting Date] ASC,
	[Item No_] ASC,
	[Inventory Posting Group] ASC,
	[Dimension Set ID] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [15] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$15] ON [dbo].[Cronus$Value Entry]
(
	[Location Code] ASC,
	[Inventory Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [16] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$16] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Item Charge No_] ASC,
	[Global Dimension 1 Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Valuation Date] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Value Entry]
(
	[Source Type] ASC,
	[Source No_] ASC,
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry Type] ASC,
	[Adjustment] ASC,
	[Item Ledger Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Value Entry]
(
	[Item Charge No_] ASC,
	[Inventory Posting Group] ASC,
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Value Entry]
(
	[Capacity Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Value Entry - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


