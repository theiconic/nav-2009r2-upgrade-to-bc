
PRINT 'VAT Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$VAT Entry]
(
	[Document No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$VAT Entry]
(
	[Transaction No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$VAT Entry]
(
	[Type] ASC,
	[Closed] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'VAT Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$VAT Entry]
(
	[Type] ASC,
	[Closed] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Tax Jurisdiction Code] ASC,
	[Use Tax] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$VAT Entry]
(
	[Document Type] ASC,
	[Type] ASC,
	[Currency Code] ASC,
	[Posting Date] ASC,
	[Closed] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$VAT Entry]
(
	[Bill-to_Pay-to No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$VAT Entry]
(
	[Sett_ Payment Entry No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [14] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$14] ON [dbo].[Cronus$VAT Entry]
(
	[Posting Date] ASC,
	[Type] ASC,
	[Closed] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Reversed] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [15] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$15] ON [dbo].[Cronus$VAT Entry]
(
	[Document Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$VAT Entry]
(
	[Type] ASC,
	[Closed] ASC,
	[Tax Jurisdiction Code] ASC,
	[Use Tax] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$VAT Entry]
(
	[Type] ASC,
	[Country_Region Code] ASC,
	[VAT Registration No_] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$VAT Entry]
(
	[Tax Jurisdiction Code] ASC,
	[Tax Group Used] ASC,
	[Tax Type] ASC,
	[Use Tax] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$VAT Entry]
(
	[BAS Doc_ No_] ASC,
	[BAS Version] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$VAT Entry]
(
	[Type] ASC,
	[Closed] ASC,
	[BAS Adjustment] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Posting Date] ASC,
	[BAS Doc_ No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'VAT Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


