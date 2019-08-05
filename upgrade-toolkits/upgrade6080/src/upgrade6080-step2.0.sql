-- Upgrade toolkit code moved to direct SQL queries

/*
LOCAL UpdateItemTables()
UpdateItem;
UpdateItemNextCountingPeriod; // this is skipped as "Next Counting Period" is blank for all items, refer to the codeunit for more info 

LOCAL UpdateItem()
WITH Item DO
  IF FINDSET(TRUE) THEN
    REPEAT
      "Rescheduling Period" := "Time Bucket";
      "Lot Accumulation Period" := "Time Bucket";
      IF TempItemEmptyBUoM.GET("No.") THEN
        "Base Unit of Measure" := TempItemEmptyBUoM."Base Unit of Measure";
      MODIFY;
    UNTIL NEXT = 0;
*/

-- 10 sec
UPDATE i
SET [Rescheduling Period] = [Time Bucket],
	[Lot Accumulation Period] = [Time Bucket],
	[Base Unit of Measure] = ISNULL(ti.[Base Unit of Measure], i.[Base Unit of Measure])
FROM [Cronus$Item] i 
LEFT JOIN [Cronus$Temp Item Empty BUoM] ti with(nolock)
	ON ti.No_ = i.No_
WHERE (ti.No_ IS NOT NULL AND ti.[Base Unit of Measure] <> i.[Base Unit of Measure]) OR i.[Time Bucket] <> ''

IF EXISTS(SELECT TOP 1 NULL FROM [Cronus$Item] i WITH(NOLOCK) WHERE [Next Counting Period] <> '')
	RAISERROR('Next Counting Period field has data, the UpdateItemNextCountingPeriod upgrade toolkit function needs to be processed',16,1)
GO

/*
LOCAL UpdateDtldCustLedgEntry()
DetailedCustLedgEntry.SETFILTER("Entry Type",'<>%1&<>%2',
  DetailedCustLedgEntry."Entry Type"::Application,DetailedCustLedgEntry."Entry Type"::"Appln. Rounding");
DetailedCustLedgEntry.MODIFYALL("Ledger Entry Amount",TRUE);

OptionString: ',Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount,Payment Tolerance,Payment Discount Tolerance,Payment Tolerance (VAT Excl.),Payment Tolerance (VAT Adjustment),Payment Discount Tolerance (VAT Excl.),Payment Discount Tolerance (VAT Adjustment)'
*/
-- 2 min
UPDATE [Cronus$Detailed Cust_ Ledg_ Entry]
SET [Ledger Entry Amount] = 1
WHERE [Entry Type] NOT IN (2 /* Application */, 10 /* Appln. Rounding */)
GO

/*
LOCAL UpdateDtldVendLedgEntry()
DetailedVendLedgEntry.SETFILTER("Entry Type",'<>%1&<>%2',
  DetailedVendLedgEntry."Entry Type"::Application,DetailedVendLedgEntry."Entry Type"::"Appln. Rounding");
DetailedVendLedgEntry.MODIFYALL("Ledger Entry Amount",TRUE);
*/
-- 10 sec
UPDATE [Cronus$Detailed Vendor Ledg_ Entry]
SET [Ledger Entry Amount] = 1
WHERE [Entry Type] NOT IN (2 /* Application */, 10 /* Appln. Rounding */)
GO

/*
LOCAL UpdateTempItemLedgerEntry()
WITH TempItemLedgerEntry DO BEGIN
  IF FINDSET(TRUE) THEN
    REPEAT
      ItemLedgerEntry.GET("Entry No.");
      UpdateOrderTypeFields(
        "Order Type",
        "Order No.",
        "Order Line No.",
        ItemLedgerEntry."Order Type",
        ItemLedgerEntry."Order No.",
        ItemLedgerEntry."Order Line No.",
        TABLECAPTION,GETPOSITION(TRUE));
      ItemLedgerEntry.MODIFY;
    UNTIL NEXT = 0;
  DELETEALL;
END;

LOCAL UpdateOrderTypeFields(OrdType : Option;OrderNo : Code[20];OrderLineNo : Integer;VAR ActOrdType : Option;VAR ActOrderNo : Code[20];VAR ActOrderLineNo : Integer;TextTableCaption : Text[30];RecordKey : Text[250])
IF NOT (OrdType IN [OrderType::Production,OrderType::Transfer,OrderType::Service]) THEN
  ERROR(Text007Err,
    OrderType::Production,OrderType::Transfer,OrderType::Service,
    TextTableCaption,RecordKey);
ActOrdType := OrdType;
ActOrderNo := OrderNo;
ActOrderLineNo := OrderLineNo;

Order Type OptionString: ',Production,Transfer,Service,Assembly'
*/

-- 20 sec
IF EXISTS(SELECT TOP 1 NULL FROM [Cronus$Temp Item Ledger Entry] WHERE [Order Type] NOT IN (1,2,3) /* Production,Transfer,Service */ )
	RAISERROR('Table Temp Item Ledger Entry has non-upgradable Order Type.',16,1)

UPDATE ile
SET [Order Type] = tile.[Order Type],
	[Order No_] = tile.[Order No_],
	[Order Line No_] = tile.[Order Line No_]
FROM [Cronus$Item Ledger Entry] ile
INNER JOIN [Cronus$Temp Item Ledger Entry] tile 
	ON tile.[Entry No_] = ile.[Entry No_]
GO

/*
LOCAL UpdateValueEntry()
WITH TempValueEntry DO BEGIN
  IF FINDSET(TRUE) THEN
    REPEAT
      ValueEntry.GET("Entry No.");
      UpdateOrderTypeFields(
        "Order Type",
        "Order No.",
        "Order Line No.",
        ValueEntry."Order Type",
        ValueEntry."Order No.",
        ValueEntry."Order Line No.",
        ValueEntry.TABLECAPTION,
        ValueEntry.GETPOSITION(TRUE));
      ValueEntry.MODIFY;
    UNTIL NEXT = 0;
  DELETEALL;
END;

Order Type OptionString: ',Production,Transfer,Service,Assembly'
*/
-- 0 sec - no data
IF EXISTS(SELECT TOP 1 NULL FROM [Cronus$Temp Value Entry] WHERE [Order Type] NOT IN (1,2,3) /* Production,Transfer,Service */ )
	RAISERROR('Table Temp Value Entry has non-upgradable Order Type.',16,1)

UPDATE ve
SET [Order Type] = tve.[Order Type],
	[Order No_] = tve.[Order No_],
	[Order Line No_] = tve.[Order Line No_]
FROM [Cronus$Value Entry] ve
INNER JOIN [Cronus$Temp Value Entry] tve 
	ON tve.[Entry No_] = ve.[Entry No_]
GO

/*
LOCAL UpdateItemLedgerEntry()
WITH ItemLedgerEntry DO BEGIN
  SETRANGE("Entry Type","Entry Type"::"Positive Adjmt.");
  SETRANGE("Source Type","Source Type"::Customer);
  SETRANGE("Document Type","Document Type"::"Service Shipment");
  SETRANGE(Correction,FALSE);
  IF NOT ISEMPTY THEN BEGIN
    MODIFYALL(Correction,TRUE);
    SETRANGE(Correction,TRUE);
    MODIFYALL("Entry Type","Entry Type"::"Negative Adjmt.");
  END;

  SETRANGE("Entry Type","Entry Type"::"Negative Adjmt.");
  IF FINDSET THEN
    REPEAT
      ValueEntry.SETCURRENTKEY("Item Ledger Entry No.");
      ValueEntry.SETRANGE("Item Ledger Entry No.","Entry No.");
      ValueEntry.SETRANGE("Item Ledger Entry Type","Entry Type"::"Positive Adjmt.");
      IF NOT ValueEntry.ISEMPTY THEN
        ValueEntry.MODIFYALL(ValueEntry."Item Ledger Entry Type","Entry Type"::"Negative Adjmt.");
    UNTIL NEXT = 0;
END;

Entry Type OptionString: 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output'
Source Type OptionString: ' ,Customer,Vendor,Item'
Document Type OptionString: ' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly'
*/

-- 2 min
UPDATE [Cronus$Item Ledger Entry]
SET Correction = 1, 
	[Entry Type] = 3 /* Negative Adjmt. */
WHERE [Entry Type] = 2 /* Positive Adjmt. */ AND [Source Type] = 1 /* Customer */ 
	AND [Document Type] = 11 /* Service Shipment */ AND Correction = 0

-- 2 min
UPDATE ve
SET [Entry Type] = 3 /* Negative Adjmt. */
FROM [Cronus$Item Ledger Entry] ile
INNER JOIN [Cronus$Value Entry] ve 
	ON ve.[Item Ledger Entry No_] = ile.[Entry No_] 
WHERE ile.[Entry Type] = 3 /* Negative Adjmt. */ AND ve.[Entry Type] = 2 /* Positive Adjmt. */
GO

/*
LOCAL UpdateUserID()
WITH TempWindowsLogin DO
  IF FINDSET THEN BEGIN
    LOCKTABLE;
    REPEAT
      User.SETRANGE("User Name","User Name");
      IF NOT User.ISEMPTY THEN
        UpgradeUserMgt.RenameUser("User ID","User Name");
    UNTIL NEXT = 0;

    DELETEALL;
  END;

RenameUser(OldUserName : Code[50];NewUserName : Code[50]) finds all the tables with relation to the User table and updates them.

This step is done in BC. 

*/

/*
LOCAL UpdatePostedSalesInvoices()
SalesInvoicesCustEntry.OPEN;
WITH SalesInvHeader DO
  WHILE SalesInvoicesCustEntry.READ DO
    IF SalesInvoicesCustEntry.Entry_No <> 0 THEN BEGIN
      GET(SalesInvoicesCustEntry.No);
      "Cust. Ledger Entry No." := SalesInvoicesCustEntry.Entry_No;
      MODIFY;
    END;
SalesInvoicesCustEntry.CLOSE;

Document Type: ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund'
*/

-- 7 min
UPDATE sih
SET sih.[Cust_ Ledger Entry No_] = cle.[Entry No_]
FROM [Cronus$Sales Invoice Header] sih
INNER JOIN [Cronus$Cust_ Ledger Entry] cle
	ON cle.[Document No_] = sih.No_ AND cle.[Document Type] = 2 /* Invoice */
GO

/*

LOCAL UpdatePostedSalesCreditMemos()
SalesCreditMemosCustEntry.OPEN;
WITH SalesCrMemoHeader DO
  WHILE SalesCreditMemosCustEntry.READ DO
    IF SalesCreditMemosCustEntry.Entry_No <> 0 THEN BEGIN
      GET(SalesCreditMemosCustEntry.No);
      "Cust. Ledger Entry No." := SalesCreditMemosCustEntry.Entry_No;
      MODIFY;
    END;
SalesCreditMemosCustEntry.CLOSE;

Document Type: ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund'
*/

-- 5 min
UPDATE scmh
SET scmh.[Cust_ Ledger Entry No_] = cle.[Entry No_]
FROM [Cronus$Sales Cr_Memo Header] scmh
INNER JOIN [Cronus$Cust_ Ledger Entry] cle
	ON cle.[Document No_] = scmh.No_ AND cle.[Document Type] =  3 /* Credit Memo */
GO

/*
LOCAL UpdatePostedPurchCreditMemos()
PurchCreditMemosVendEntry.OPEN;
WITH PurchCrMemoHdr DO
  WHILE PurchCreditMemosVendEntry.READ DO
    IF PurchCreditMemosVendEntry.Entry_No <> 0 THEN BEGIN
      GET(PurchCreditMemosVendEntry.No);
      "Vendor Ledger Entry No." := PurchCreditMemosVendEntry.Entry_No;
      MODIFY;
    END;
PurchCreditMemosVendEntry.CLOSE;

Document Type: ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund'
*/

-- 10 sec
UPDATE pcmh
SET [Vendor Ledger Entry No_] = vle.[Entry No_]
FROM [Cronus$Purch_ Cr_ Memo Hdr_] pcmh
INNER JOIN [Cronus$Vendor Ledger Entry] vle 
	ON vle.[Document No_] = pcmh.No_ AND vle.[Document Type] = 3 /* Credit Memo */
GO

/*
LOCAL UpdatePostedPurchaseInvoices()
PurchInvoicesVendEntry.OPEN;
WITH PurchInvHeader DO
  WHILE PurchInvoicesVendEntry.READ DO
    IF PurchInvoicesVendEntry.Entry_No <> 0 THEN BEGIN
      GET(PurchInvoicesVendEntry.No);
      "Vendor Ledger Entry No." := PurchInvoicesVendEntry.Entry_No;
      MODIFY;
    END;
PurchInvoicesVendEntry.CLOSE;

Document Type: ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund'
*/

-- 10 sec
UPDATE pih
SET [Vendor Ledger Entry No_] = vle.[Entry No_]
FROM [Cronus$Purch_ Inv_ Header] pih
INNER JOIN [Cronus$Vendor Ledger Entry] vle 
	ON vle.[Document No_] = pih.No_ AND vle.[Document Type] = 2 /* Invoice */
GO
