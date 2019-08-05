SET ANSI_PADDING ON
GO

-- Secondary importance >>

PRINT '****************************  G_L Register ****************************'
GO

PRINT 'G_L Register [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$G_L Register]
(
	[Creation Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Register [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$G_L Register]
(
	[Source Code] ASC,
	[Journal Batch Name] ASC,
	[Creation Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L Register - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO