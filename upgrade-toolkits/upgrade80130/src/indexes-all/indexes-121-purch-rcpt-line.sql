
-- Secondary importance >>

PRINT '**************************** Purch_ Rcpt_ Line ****************************'
GO

PRINT 'Purch_ Rcpt_ Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Purch_ Rcpt_ Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Purch_ Rcpt_ Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Purch_ Rcpt_ Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Purch_ Rcpt_ Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Purch_ Rcpt_ Line]
(
	[Item Rcpt_ Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Purch_ Rcpt_ Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Purch_ Rcpt_ Line]
(
	[Pay-to Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Purch_ Rcpt_ Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Purch_ Rcpt_ Line]
(
	[Buy-from Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Purch_ Rcpt_ Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


