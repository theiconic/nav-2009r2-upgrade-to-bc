
PRINT 'Detailed Cust. Ledg. Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Cust_ Ledger Entry No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Transaction No_] ASC,
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Applied Cust_ Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Initial Document Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'Detailed Cust. Ledg. Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Cust_ Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Initial Document Type] ASC,
	[Entry Type] ASC,
	[Customer No_] ASC,
	[Currency Code] ASC,
	[Initial Entry Global Dim_ 1] ASC,
	[Initial Entry Global Dim_ 2] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Customer No_] ASC,
	[Currency Code] ASC,
	[Initial Entry Global Dim_ 1] ASC,
	[Initial Entry Global Dim_ 2] ASC,
	[Initial Entry Due Date] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Application No_] ASC,
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


