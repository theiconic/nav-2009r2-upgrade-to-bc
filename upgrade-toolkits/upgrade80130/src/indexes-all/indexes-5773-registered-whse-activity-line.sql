
PRINT 'Registered Whse_ Activity Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[No_] ASC,
	[Line No_] ASC,
	[Activity Type] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Source No_] ASC,
	[Item No_] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Activity Type] ASC,
	[Picking Trolley] ASC,
	[Picking Priority] ASC,
	[Zone Code] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Source No_] ASC,
	[Source Document] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Sorting Code] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Activity Type] ASC,
	[No_] ASC,
	[Sorting Sequence No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Whse_ Document Type] ASC,
	[Whse_ Document No_] ASC,
	[Whse_ Document Line No_] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Source Type] ASC,
	[Source Subtype] ASC,
	[Source No_] ASC,
	[Source Line No_] ASC,
	[Source Subline No_] ASC,
	[Whse_ Document No_] ASC,
	[Serial No_] ASC,
	[Lot No_] ASC,
	[Action Type] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Activity Type] ASC,
	[Source Type] ASC,
	[Source No_] ASC,
	[Source Document] ASC,
	[Item No_] ASC,
	[Action Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Item No_] ASC,
	[Sorting Code] ASC,
	[Consolidated] ASC,
	[Activity Type] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Registered Whse_ Activity Line [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Registered Whse_ Activity Line]
(
	[Item No_] ASC,
	[Bin Code] ASC,
	[Location Code] ASC,
	[Action Type] ASC,
	[Activity Type] ASC,
	[Registering Date] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Registered Whse_ Activity Line - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

