SET ANSI_PADDING ON
GO

PRINT '**************************** G_L Entry ****************************'
GO

/* Enabled in BC objects 
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
*/

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

/* Enabled in BC objects 
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
*/

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

PRINT '**************************** Cust. Ledger Entry ****************************'
GO

/* Enabled in BC objects 
PRINT 'Cust. Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Posting Date] ASC,
	[Currency Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Cust. Ledger Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Transaction No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[External Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Item Ledger Entry ****************************'
GO

PRINT 'Item Ledger Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Document Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [22] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$22] ON [dbo].[Cronus$Item Ledger Entry]
(
	[External Document No_] ASC,
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

/* Enabled in BC objects 
PRINT 'Item Ledger Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Source Type] ASC,
	[Source No_] ASC,
	[Item No_] ASC,
	[Variant Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [23] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$23] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Global Dimension 1 Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

*/

PRINT 'Item Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Shipment Header ****************************'
GO

PRINT 'Sales Shipment Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Shipment Line ****************************'
GO

PRINT 'Sales Shipment Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Location Code] ASC,
	[Posting Date] ASC,
	[Type] ASC,
	[Quantity] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Invoice Header ****************************'
GO

PRINT 'Sales Invoice Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Invoice Line ****************************'
GO

PRINT 'Sales Invoice Line [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Type] ASC,
	[No_] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Quantity] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Shipment No_] ASC,
	[Shipment Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Cr.Memo Header ****************************'
GO

PRINT 'Sales Cr_Memo Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Return Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Cr.Memo Header ****************************'
GO

PRINT 'Sales Cr.Memo Line [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr.Memo Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Return Receipt No_] ASC,
	[Return Receipt Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr.Memo Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** VAT Entry ****************************'
GO

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

/* Enabled in BC objects 
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
*/

PRINT 'VAT Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Bank Account Ledger Entry ****************************'
GO

/* Enabled in BC objects 
PRINT 'Bank Account Ledger Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

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

PRINT '**************************** Item Application Entry ****************************'
GO

PRINT 'Item Application Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Item Application Entry]
(
	[Inbound Item Entry No_] ASC,
	[Outbound Item Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Item Application Entry]
(
	[Item Ledger Entry No_] ASC,
	[Output Completely Invd_ Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Detailed Cust. Ledg. Entry ****************************'
GO

PRINT 'Detailed Cust. Ledg. Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Cust_ Ledger Entry No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Transaction No_] ASC,
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Applied Cust_ Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

/* Enabled in BC objects 
PRINT 'Detailed Cust. Ledg. Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Initial Document Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Detailed Cust. Ledg. Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Value Entry  ****************************'
GO

/* Enabled in BC objects 
PRINT 'Value Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Value Entry]
(
	[Item Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Item Ledger Entry Type] ASC,
	[Entry Type] ASC,
	[Variance Type] ASC,
	[Item Charge No_] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Value Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Value Entry]
(
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** GST Sales Entry ****************************'
GO

PRINT 'GST Sales Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$GST Sales Entry]
(
	[Document No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'GST Sales Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '****************************  Warehouse Register ****************************'
GO

PRINT 'Warehouse Register [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [$1] ON [dbo].[Cronus$Warehouse Register]
(
	[Source Code] ASC,
	[No_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

PRINT 'Warehouse Register - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '****************************  Posted Whse. Receipt Header ****************************'
GO

PRINT 'Posted Whse_ Receipt Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[Location Code] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[Whse_ Receipt No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[PO No_] ASC,
	[Vendor Shipment No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Posted Whse_ Receipt Header - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '****************************  Posted Whse. Receipt Line ****************************'
GO

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

PRINT '****************************  Posted Whse. Shipment Line  ****************************'
GO

PRINT 'Posted Whse_ Shipment Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Posted Source No_] ASC,
	[Posting Date] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Source Type] ASC,
	[Source Subtype] ASC,
	[Source No_] ASC,
	[Source Line No_] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '****************************  Registered Whse_ Activity Line  ****************************'
GO

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

PRINT '****************************  Registered Whse_ Activity Hdr_  ****************************'
GO


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