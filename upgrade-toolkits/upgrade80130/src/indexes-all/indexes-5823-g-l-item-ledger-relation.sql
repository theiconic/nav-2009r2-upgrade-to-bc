
-- Secondary importance >>
PRINT '**************************** Purch_ Rcpt_ Line ****************************'
GO

PRINT 'G_L - Item Ledger Relation [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$G_L - Item Ledger Relation]
(
	[Value Entry No_] ASC,
	[G_L Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L - Item Ledger Relation [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$G_L - Item Ledger Relation]
(
	[G_L Register No_] ASC,
	[G_L Entry No_] ASC,
	[Value Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L - Item Ledger Relation [tms] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE NONCLUSTERED INDEX [tms_g_l_item_ledger_relation] ON [dbo].[Cronus$G_L - Item Ledger Relation]
(
	[timestamp] ASC
)WITH (ONLINE=ON)
GO

PRINT 'G_L - Item Ledger Relation - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO