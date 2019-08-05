SET ANSI_PADDING ON
GO

PRINT 'Item Ledger Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Document Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [22] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$22] ON [dbo].[Cronus$Item Ledger Entry]
(
	[External Document No_] ASC,
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Source Type] ASC,
	[Source No_] ASC,
	[Item No_] ASC,
	[Variant Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [23] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$23] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Global Dimension 1 Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

/* Enabled in BC object
PRINT 'Item Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Item Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'Item Ledger Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Order Type] ASC,
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Entry Type] ASC,
	[Prod_ Order Comp_ Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Applied Entry to Adjust] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Positive] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [20] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$20] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [21] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$21] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Location Code] ASC,
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry Type] ASC,
	[Variant Code] ASC,
	[Drop Shipment] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Open] ASC,
	[Variant Code] ASC,
	[Positive] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Country_Region Code] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

