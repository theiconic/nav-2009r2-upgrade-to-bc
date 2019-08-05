/*
Takes ~ 3:43:37
Timeline of starts:
[1] - Apr  5 2019  9:22PM
[3] - Apr  5 2019  9:53PM
[4] - Apr  5 2019 10:15PM
[5] - Apr  5 2019 10:28PM
[6] - Apr  5 2019 11:15PM
[8] - Apr  5 2019 11:23PM
[9] - Apr  5 2019 11:34PM
[10] - Apr  5 2019 11:39PM
[16] - Apr  5 2019 11:44PM
[17] - Apr  5 2019 11:56PM
[18] - Apr  6 2019 12:09AM
[19] - Apr  6 2019 12:22AM
[20] - Apr  6 2019 12:33AM
[21] - Apr  6 2019 12:45AM
[22] - Apr  6 2019 12:57AM
*/

SET ANSI_PADDING ON
GO

PRINT 'Cust. Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Posting Date] ASC,
	[Currency Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Transaction No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[External Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance

PRINT 'Cust. Ledger Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Open] ASC,
	[Positive] ASC,
	[Due Date] ASC,
	[Currency Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Open] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Salesperson Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Closed by Entry No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [16] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$16] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Applies-to ID] ASC,
	[Open] ASC,
	[Positive] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [17] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$17] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Document Date] ASC,
	[BAS Adjustment] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [18] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$18] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Positive] ASC,
	[Applies-to Doc_ Type] ASC,
	[Applies-to Doc_ No_] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [19] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$19] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Customer No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [20] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$20] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [21] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$21] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document Type] ASC,
	[Customer No_] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [22] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$22] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO


