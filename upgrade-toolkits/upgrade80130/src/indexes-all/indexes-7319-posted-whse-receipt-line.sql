
PRINT 'Posted Whse_ Receipt Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Posted Whse_ Receipt Line]
(
	[Posted Source No_] ASC,
	[Posting Date] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Posted Whse_ Receipt Line]
(
	[Source Type] ASC,
	[Source Subtype] ASC,
	[Source No_] ASC,
	[Source Line No_] ASC,
	[Posted Source Document] ASC,
	[Posted Source No_] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Receipt Line]
(
	[Item No_] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Posted Whse_ Receipt Line]
(
	[Posted Source Document] ASC,
	[Posted Source No_] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


