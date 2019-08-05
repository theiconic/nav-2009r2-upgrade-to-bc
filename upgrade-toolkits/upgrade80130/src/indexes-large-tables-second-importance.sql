/* Example timeframes
**************************** G_L Entry ****************************
G_L Entry [12] - Apr 30 2019 10:40PM
G_L Entry [13] - Apr 30 2019 11:09PM
G_L Entry [15] - Apr 30 2019 11:38PM
G_L Entry [16] - May  1 2019 12:09AM
G_L Entry [9] - May  1 2019 12:24AM
G_L Entry [10] - May  1 2019 12:50AM
G_L Entry - Done - May  1 2019  1:01AM
**************************** Cust. Ledger Entry ****************************
Cust. Ledger Entry [5] - May  1 2019  1:01AM
Cust. Ledger Entry [6] - May  1 2019  1:02AM
Cust. Ledger Entry [8] - May  1 2019  1:04AM
Cust. Ledger Entry [9] - May  1 2019  1:07AM
Cust. Ledger Entry [16] - May  1 2019  1:08AM
Cust. Ledger Entry [17] - May  1 2019  1:09AM
Cust. Ledger Entry [18] - May  1 2019  1:10AM
Cust. Ledger Entry [19] - May  1 2019  1:11AM
Cust. Ledger Entry [20] - May  1 2019  1:12AM
Cust. Ledger Entry [21] - May  1 2019  1:13AM
Cust. Ledger Entry [22] - May  1 2019  1:15AM
Cust. Ledger Entry - Done - May  1 2019  1:18AM
**************************** Item Ledger Entry ****************************
Item Ledger Entry [1] - May  1 2019  1:18AM
Item Ledger Entry [11] - May  1 2019  1:19AM
Item Ledger Entry [12] - May  1 2019  1:23AM
Item Ledger Entry [13] - May  1 2019  1:24AM
Item Ledger Entry [20] - May  1 2019  1:25AM
Item Ledger Entry [21] - May  1 2019  1:25AM
Item Ledger Entry [3] - May  1 2019  1:29AM
Item Ledger Entry [7] - May  1 2019  1:30AM
Item Ledger Entry - Done - May  1 2019  1:33AM
**************************** VAT Entry ****************************
VAT Entry [13] - May  1 2019  1:33AM
VAT Entry [10] - May  1 2019  1:39AM
VAT Entry [11] - May  1 2019  1:42AM
VAT Entry [12] - May  1 2019  1:43AM
VAT Entry [14] - May  1 2019  1:44AM
VAT Entry [15] - May  1 2019  1:45AM
VAT Entry [2] - May  1 2019  1:46AM
VAT Entry [3] - May  1 2019  1:50AM
VAT Entry [6] - May  1 2019  1:55AM
VAT Entry [8] - May  1 2019  1:59AM
VAT Entry [9] - May  1 2019  2:02AM
VAT Entry - Done - May  1 2019  2:07AM
**************************** Bank Account Ledger Entry ****************************
Bank Account Ledger Entry [10] - May  1 2019  2:07AM
Bank Account Ledger Entry [11] - May  1 2019  2:08AM
Bank Account Ledger Entry [7] - May  1 2019  2:10AM
Bank Account Ledger Entry [8] - May  1 2019  2:11AM
Bank Account Ledger Entry [9] - May  1 2019  2:13AM
Bank Account Ledger Entry - Done May  1 2019  2:15AM
**************************** Item Application Entry ****************************
Item Application Entry [1] - May  1 2019  2:15AM
Item Application Entry [2] - May  1 2019  2:15AM
Item Application Entry [3] - May  1 2019  2:16AM
Item Application Entry - Done - May  1 2019  2:18AM
**************************** Detailed Cust. Ledg. Entry ****************************
Detailed Cust. Ledg. Entry [2] - May  1 2019  2:18AM
Detailed Cust. Ledg. Entry [4] - May  1 2019  2:19AM
Detailed Cust. Ledg. Entry [5] - May  1 2019  2:26AM
Detailed Cust. Ledg. Entry [9] - May  1 2019  2:28AM
Detailed Cust. Ledg. Entry - Done - May  1 2019  2:35AM
**************************** Value Entry ****************************
Value Entry [10] - May  1 2019  2:35AM
Value Entry [12] - May  1 2019  2:42AM
Value Entry [13] - May  1 2019  2:49AM
Value Entry [15] - May  1 2019  2:58AM
Value Entry [16] - May  1 2019  3:04AM
Value Entry [6] - May  1 2019  3:06AM
Value Entry [8] - May  1 2019  3:08AM
Value Entry [9] - May  1 2019  3:17AM
Value Entry - Done May  1 2019  3:21AM
**************************** GST Sales Entry ****************************
GST Sales Entry [2] - May  1 2019  3:21AM
GST Sales Entry - Done May  1 2019  3:22AM

*/

SET ANSI_PADDING ON
GO

PRINT '**************************** G_L Entry ****************************'
GO

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

PRINT '**************************** Cust. Ledger Entry ****************************'
GO
PRINT 'Cust. Ledger Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Open] ASC,
	[Positive] ASC,
	[Due Date] ASC,
	[Currency Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Open] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Salesperson Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Closed by Entry No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [16] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$16] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Applies-to ID] ASC,
	[Open] ASC,
	[Positive] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [17] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$17] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Document Date] ASC,
	[BAS Adjustment] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [18] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$18] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer No_] ASC,
	[Positive] ASC,
	[Applies-to Doc_ Type] ASC,
	[Applies-to Doc_ No_] ASC,
	[Due Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [19] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$19] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document No_] ASC,
	[Document Type] ASC,
	[Customer No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [20] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$20] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [21] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$21] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Document Type] ASC,
	[Customer No_] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry [22] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$22] ON [dbo].[Cronus$Cust_ Ledger Entry]
(
	[Customer Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Cust. Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Item Ledger Entry ****************************'
GO

PRINT 'Item Ledger Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Order Type] ASC,
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Entry Type] ASC,
	[Prod_ Order Comp_ Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Applied Entry to Adjust] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Positive] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [20] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$20] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [21] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$21] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Location Code] ASC,
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Entry Type] ASC,
	[Variant Code] ASC,
	[Drop Shipment] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

/*  Enabled in BC objects
PRINT 'Item Ledger Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Item No_] ASC,
	[Open] ASC,
	[Variant Code] ASC,
	[Positive] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Item Ledger Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Item Ledger Entry]
(
	[Country_Region Code] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Ledger Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** VAT Entry ****************************'
GO

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

PRINT '**************************** Bank Account Ledger Entry ****************************'
GO

PRINT 'Bank Account Ledger Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[External Document No_] ASC,
	[Bank Account No_] ASC,
	[Posting Date] ASC,
	[Amount] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Open] ASC,
	[Reversed] ASC,
	[Statement Status] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Document Type] ASC,
	[Document No_] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Document No_] ASC,
	[Posting Date] ASC,
	[Open] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Bank Account Ledger Entry]
(
	[Bank Account No_] ASC,
	[Statement No_] ASC,
	[Statement Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Bank Account Ledger Entry - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Item Application Entry ****************************'
GO

PRINT 'Item Application Entry [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Item Application Entry]
(
	[Inbound Item Entry No_] ASC,
	[Item Ledger Entry No_] ASC,
	[Outbound Item Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Item Application Entry]
(
	[Outbound Item Entry No_] ASC,
	[Item Ledger Entry No_] ASC,
	[Cost Application] ASC,
	[Transferred-from Entry No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Item Application Entry]
(
	[Transferred-from Entry No_] ASC,
	[Cost Application] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Item Application Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Detailed Cust. Ledg. Entry ****************************'
GO

PRINT 'Detailed Cust. Ledg. Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Cust_ Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Initial Document Type] ASC,
	[Entry Type] ASC,
	[Customer No_] ASC,
	[Currency Code] ASC,
	[Initial Entry Global Dim_ 1] ASC,
	[Initial Entry Global Dim_ 2] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Customer No_] ASC,
	[Currency Code] ASC,
	[Initial Entry Global Dim_ 1] ASC,
	[Initial Entry Global Dim_ 2] ASC,
	[Initial Entry Due Date] ASC,
	[Posting Date] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Detailed Cust_ Ledg_ Entry]
(
	[Application No_] ASC,
	[Customer No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Detailed Cust. Ledg. Entry - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Value Entry ****************************'
GO

PRINT 'Value Entry [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Value Entry]
(
	[Order Type] ASC,
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Value Entry]
(
	[Job No_] ASC,
	[Job Task No_] ASC,
	[Document No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Value Entry]
(
	[Item Ledger Entry Type] ASC,
	[Posting Date] ASC,
	[Item No_] ASC,
	[Inventory Posting Group] ASC,
	[Dimension Set ID] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [15] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$15] ON [dbo].[Cronus$Value Entry]
(
	[Location Code] ASC,
	[Inventory Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [16] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$16] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Posting Date] ASC,
	[Item Charge No_] ASC,
	[Global Dimension 1 Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Value Entry]
(
	[Item No_] ASC,
	[Valuation Date] ASC,
	[Location Code] ASC,
	[Variant Code] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

/* Enabled in BC objects 
PRINT 'Value Entry [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Value Entry]
(
	[Source Type] ASC,
	[Source No_] ASC,
	[Item No_] ASC,
	[Posting Date] ASC,
	[Entry Type] ASC,
	[Adjustment] ASC,
	[Item Ledger Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
*/

PRINT 'Value Entry [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Value Entry]
(
	[Item Charge No_] ASC,
	[Inventory Posting Group] ASC,
	[Item No_] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Value Entry [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Value Entry]
(
	[Capacity Ledger Entry No_] ASC,
	[Entry Type] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Value Entry - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** GST Sales Entry ****************************'
GO

PRINT 'GST Sales Entry [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$GST Sales Entry]
(
	[GST Entry No_] ASC,
	[Document No_] ASC,
	[Document Type] ASC,
	[VAT Prod_ Posting Group] ASC,
	[Entry No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'GST Sales Entry - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

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

PRINT '**************************** Sales Shipment Header ****************************'
GO

PRINT 'Sales Shipment Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Shipment Header]
(
	[EDI Shipment] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Salesperson Code] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Sales Shipment Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Shipment Line ****************************'
GO

PRINT 'Sales Shipment Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Shipment Line]
(
	[Item Shpt_ Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Invoice Header ****************************'
GO

PRINT 'Sales Invoice Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Prepayment Order No_] ASC,
	[Prepayment Invoice] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Tax Document Marked] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Document Exchange Status] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Sales Invoice Header]
(
	[EDI Invoice] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Pre-Assigned No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Printed Tax Document] ASC,
	[Bill-to Customer No_] ASC,
	[Currency Code] ASC,
	[Payment Discount _] ASC,
	[Posted Tax Document] ASC,
	[Tax Document Marked] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Tax Document Type] ASC,
	[Bill-to Customer No_] ASC,
	[Currency Code] ASC,
	[Payment Discount _] ASC,
	[Printed Tax Document] ASC,
	[Posted Tax Document] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Invoice Line ****************************'
GO

PRINT 'Sales Invoice Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Type] ASC,
	[No_] ASC,
	[Location Code] ASC,
	[Shipment Date] ASC,
	[Quantity] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Document No_] ASC,
	[WHT Business Posting Group] ASC,
	[WHT Product Posting Group] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Order ItemID] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Job Contract Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Cr_Memo Header ****************************'
GO

PRINT 'Sales Cr_Memo Header [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Prepayment Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Pre-Assigned No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[EDI Cr_ Memo] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Document Exchange Status] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Sales Cr_Memo Line ****************************'
GO
PRINT 'Sales Cr_Memo Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Job Contract Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Document No_] ASC,
	[WHT Business Posting Group] ASC,
	[WHT Product Posting Group] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

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

PRINT '**************************** Return Shipment Line ****************************'
GO

PRINT 'Return Shipment Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Return Shipment Line]
(
	[Return Order No_] ASC,
	[Return Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Return Shipment Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Return Shipment Line]
(
	[Pay-to Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Return Shipment Line]
(
	[Buy-from Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Return Shipment Line]
(
	[Location Code] ASC,
	[Type] ASC,
	[No_] ASC,
	[Original Sales Order No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

PRINT '**************************** Return Receipt Line ****************************'
GO

PRINT 'Return Receipt Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Return Receipt Line]
(
	[Return Order No_] ASC,
	[Return Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Return Receipt Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Return Receipt Line]
(
	[Item Rcpt_ Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Return Receipt Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Return Receipt Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Return Receipt Line]
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
PRINT 'Return Receipt Line - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


