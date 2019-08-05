/*
Takes ~16:36:43
Start times:
[10] - Apr  5 2019  8:59PM
[11] - Apr  6 2019 12:05AM
[12] - Apr  6 2019  1:54AM
[13] - Apr  6 2019  3:25AM
[15] - Apr  6 2019  5:02AM
[16] - Apr  6 2019  6:16AM
[19] - Apr  6 2019  7:58AM
[2] - Apr  6 2019  9:38AM
[20] - Apr  6 2019 10:09AM
[7] - Apr  6 2019 10:55AM
[8] - Apr  6 2019 11:20AM
[9] - Apr  6 2019 12:28PM

*/

SET ANSI_PADDING ON
GO

PRINT 'G_L Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$G_L Entry]
(
	[G_L Account No_] ASC,
	[Global Dimension 1 Code] ASC,
	[Global Dimension 2 Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$G_L Entry]
(
	[Document No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$G_L Entry]
(
	[Transaction No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$G_L Entry]
(
	[Posting Date] ASC,
	[G_L Account No_] ASC,
	[Dimension Set ID] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [20] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$20] ON [dbo].[Cronus$G_L Entry]
(
	[Source Code] ASC,
	[Document No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [19] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$19] ON [dbo].[Cronus$G_L Entry]
(
	[Source Code] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT 'G_L Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$G_L Entry]
(
	[Gen_ Bus_ Posting Group] ASC,
	[Gen_ Prod_ Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$G_L Entry]
(
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [15] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$15] ON [dbo].[Cronus$G_L Entry]
(
	[BAS Doc_ No_] ASC,
	[BAS Version] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [16] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$16] ON [dbo].[Cronus$G_L Entry]
(
	[G_L Account No_] ASC,
	[BAS Adjustment] ASC,
	[VAT Bus_ Posting Group] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Posting Date] ASC,
	[BAS Doc_ No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$G_L Entry]
(
	[IC Partner Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$G_L Entry]
(
	[G_L Account No_] ASC,
	[Job No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE = ON)
GO

PRINT 'G_L Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
