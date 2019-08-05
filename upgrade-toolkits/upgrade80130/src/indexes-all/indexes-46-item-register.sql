SET ANSI_PADDING ON
GO

-- Secondary importance >>

PRINT '**************************** Item Register ****************************'
GO

PRINT 'Item Register [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Item Register]
(
	[Creation Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Register [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Item Register]
(
	[Source Code] ASC,
	[Journal Batch Name] ASC,
	[Creation Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Register - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO