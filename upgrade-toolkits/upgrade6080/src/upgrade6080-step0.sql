-- Code below corresponds mainly to DeleteCommetceGatewayData method 
-- and the code moved here from the upgrade toolkit

-- The below can be run on Live database online, check the messages printed
PRINT 'Commerce Gateway (BizTalk) clean-up (10 - 30 mins)'

PRINT 'Sales Shipment Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Sales Shipment Header" 
SET "Date Sent"='1753-01-01 00:00:00',
	"BizTalk Shipment Notification"=0,
    "BizTalk Document Sent"=0,
	"Time Sent"='1753-01-01 00:00:00',
	"Customer Order No_"=''
WHERE "Date Sent"<>'1753-01-01 00:00:00' OR 
	"BizTalk Shipment Notification"<>0 OR
	"BizTalk Document Sent"<>0 OR 
	"Time Sent"<>'1753-01-01 00:00:00' OR 
	"Customer Order No_"<>''
GO

PRINT 'Sales Invoice Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Sales Invoice Header" 
SET "Service Mgt_ Document"=0,
    "Time Sent"='1753-01-01 00:00:00', 
    "Customer Order No_"='',
    "Date Sent"='1753-01-01 00:00:00',
    "BizTalk Sales Invoice"=0,
    "BizTalk Document Sent"=0
WHERE "Service Mgt_ Document" <> 0 OR 
	"Time Sent"<>'1753-01-01 00:00:00' OR
    "Customer Order No_"<>'' OR
    "Date Sent"<>'1753-01-01 00:00:00' OR
    "BizTalk Sales Invoice"<>0 OR
    "BizTalk Document Sent"<>0
GO 

PRINT 'Sales Cr_Memo Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Sales Cr_Memo Header" 
SET "Time Sent"='1753-01-01 00:00:00',
    "BizTalk Document Sent"=0,
	"Service Mgt_ Document"=0,
	"Date Sent"='1753-01-01 00:00:00',
	"BizTalk Sales Credit Memo"=0
WHERE "Time Sent"<>'1753-01-01 00:00:00' OR
    "BizTalk Document Sent"<>0 OR
	"Service Mgt_ Document"<>0 OR
	"Date Sent"<>'1753-01-01 00:00:00' OR
	"BizTalk Sales Credit Memo"<>0
GO 

PRINT 'Purch_ Rcpt_ Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Purch_ Rcpt_ Header" 
SET "Time Received"='1753-01-01 00:00:00',
	"Date Received"='1753-01-01 00:00:00',
	"BizTalk Purchase Receipt"=0
 WHERE "Time Received"<>'1753-01-01 00:00:00' OR
	"Date Received"<>'1753-01-01 00:00:00' OR
	"BizTalk Purchase Receipt"<>0   
GO

PRINT 'Purch_ Inv_ Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Purch_ Inv_ Header" 
SET "Date Received"='1753-01-01 00:00:00',
	"BizTalk Purchase Invoice"=0,
	"Time Received"='1753-01-01 00:00:00'
WHERE "Date Received"<>'1753-01-01 00:00:00' OR
	"BizTalk Purchase Invoice"<>0 OR
	"Time Received"<>'1753-01-01 00:00:00'
GO 

PRINT 'Purch_ Cr_ Memo Hdr_'
UPDATE "DynamicsNAV"."dbo"."Cronus$Purch_ Cr_ Memo Hdr_" 
SET "Time Received"='1753-01-01 00:00:00',
	"Date Received"='1753-01-01 00:00:00',
	"BizTalk Purchase Credit Memo"=0
WHERE "Time Received"<>'1753-01-01 00:00:00' OR
	"Date Received"<>'1753-01-01 00:00:00' OR
	"BizTalk Purchase Credit Memo"<>0
GO

PRINT 'Sales and Purchase Header'
UPDATE "DynamicsNAV"."dbo"."Cronus$Sales Header" 
SET "Time Received"='1753-01-01 00:00:00',
	"Date Received"='1753-01-01 00:00:00',
	[Date Sent]='1753-01-01 00:00:00',
	[Time Sent]='1753-01-01 00:00:00',
	[Customer Order No_]='',
	[Customer Quote No_]='',
	[BizTalk Document Sent]=0,
	[BizTalk Request for Sales Qte_]=0,
	[BizTalk Sales Order]=0,
	[BizTalk Sales Order Cnfmn_]=0,
	[BizTalk Sales Quote]=0
GO

UPDATE "DynamicsNAV"."dbo"."Cronus$Purchase Header" 
SET "Time Received"='1753-01-01 00:00:00',
	"Date Received"='1753-01-01 00:00:00',
	[Date Sent]='1753-01-01 00:00:00',
	[Time Sent]='1753-01-01 00:00:00',
	[Vendor Quote No_]='',
	[BizTalk Document Sent]=0,
	[BizTalk Purch_ Order Cnfmn_]=0,
	[BizTalk Purchase Credit Memo]=0,
	[BizTalk Purchase Invoice]=0,
	[BizTalk Purchase Order]=0,
	[BizTalk Purchase Quote]=0,
	[BizTalk Purchase Receipt]=0,
	[BizTalk Request for Purch_ Qte]=0
GO	

PRINT 'Value Entry check for Product Order No'
-- estimation: 4 minutes
IF EXISTS(SELECT TOP 1 NULL 
			FROM "DynamicsNAV"."dbo"."Cronus$Value Entry" WITH (nolock)   
			WHERE "Prod_ Order No_"<>'') 
	PRINT '!!! UpdateValueEntry2 from the toolkit needs to be uncommented'

PRINT 'Item Ledger Entry check for Product Order No. and Service Order No.'
--UpdateItemLedgerEntry,CheckItemLedgEntry
-- NewOrderType option string " ,Production,Transfer,Service"
IF EXISTS(SELECT TOP 1 NULL 
		FROM "DynamicsNAV"."dbo"."Cronus$Item Ledger Entry" with(nolock)
		WHERE "Service Order No_" <> '' OR "Prod_ Order No_" <> '')
	PRINT '!!! UpdateItemLedgerEntry,CheckItemLedgEntry from the toolkit needs to be uncommented'
GO
