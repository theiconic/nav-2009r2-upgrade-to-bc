
PRINT 'Bank Account Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Document No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Transaction No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'Bank Account Ledger Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[External Document No_] ASC,
	[Bank Account No_] ASC,
	[Posting Date] ASC,
	[Amount] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Open] ASC,
	[Reversed] ASC,
	[Statement Status] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Document Type] ASC,
	[Document No_] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Document No_] ASC,
	[Posting Date] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Statement No_] ASC,
	[Statement Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

