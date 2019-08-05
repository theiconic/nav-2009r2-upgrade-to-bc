
PRINT 'Registered Whse_ Activity Hdr_ [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Registered Whse_ Activity Hdr_]
(
	[No_] ASC,
	[Type] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Hdr_ [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Registered Whse_ Activity Hdr_]
(
	[Whse_ Activity No_] ASC,
	[Type] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Hdr_ [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Registered Whse_ Activity Hdr_]
(
	[Location Code] ASC,
	[Type] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Hdr_ [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Registered Whse_ Activity Hdr_]
(
	[Type] ASC,
	[Location Code] ASC,
	[Assigned User ID] ASC,
	[Completion DateTime] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Hdr_ - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO