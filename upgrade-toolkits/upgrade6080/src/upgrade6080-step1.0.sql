-- Code below corresponds mainly to DeleteCommetceGatewayData method 
-- and the code moved here from the toolkit

-- Data processing with the database at the transaction freeze stage (10 minutes approx.)

--UpdateItemLedgerEntry 
-- OrderType " ,Production,Transfer,Service"
INSERT INTO "DynamicsNAV"."dbo"."Cronus$Temp Item Ledger Entry"
	([Entry No_],[Order Type],[Order No_],[Order Line No_])
SELECT [Entry No_],2 /* Transfer */,[Transfer Order No_],0
FROM "DynamicsNAV"."dbo"."Cronus$Item Ledger Entry" with(nolock)
WHERE "Transfer Order No_"<>''
GO

UPDATE ile
SET [Transfer Order No_] = ''
FROM DynamicsNAV.dbo.[Cronus$Item Ledger Entry] ile
INNER JOIN DynamicsNAV.dbo.[Cronus$Temp Item Ledger Entry] tile
	ON tile.[Entry No_] = ile.[Entry No_]
GO

--ProcessEmptyBUoMItems
DECLARE @BaseUoM nvarchar(20) = ISNULL((SELECT TOP 1 [Base Unit of Measure]
										FROM dbo.[Cronus$Item] i
										WHERE i.[Base Unit of Measure] <> ''),'')
INSERT INTO DynamicsNAV.dbo.[Cronus$Temp Item Empty BUoM]
	(No_,[Description],[Base Unit of Measure])
SELECT No_, Description, @BaseUoM
FROM DynamicsNAV.dbo.[Cronus$Item] i with(nolock)
WHERE i.[Base Unit of Measure] = '';
GO

-- UpdateValueEntry (takes 5-10 mins)
WITH source_cte (DocumentNo, ItemNo, ItemChargeNo, ILEType, OldSourceCode, NewSourceCode)
AS (
	--"Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output," - ILEType
	--" ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)" - l.Type

	--SourceCodeFromSalesShptLine
	SELECT sh.No_ as DocumentNo, 
		shl.No_ as ItemNo, 
		NULL as ItemChargeNo, 
		1 /* Sale */ as ILEType,
		sh.[Sell-to Customer No_] as OldSourceCode,
		sh.[Bill-to Customer No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Sales Shipment Header] sh with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Sales Shipment Line] shl with(nolock)
		ON shl.[Document No_] = sh.No_ AND shl.Type = 2 /* Item */
	WHERE sh.[Sell-to Customer No_] <> sh.[Bill-to Customer No_]
	UNION
	--SourceCodeFromSalesInvoiceLine
	SELECT h.No_ as DocumentNo, 
		CASE WHEN l.Type = 2 THEN l.No_ ELSE NULL END as ItemNo, 
		CASE WHEN l.Type = 5 THEN l.No_ ELSE NULL END as ItemChargeNo, 
		1 /* Sale */ as ILEType,
		h.[Sell-to Customer No_] as OldSourceCode,
		h.[Bill-to Customer No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Sales Invoice Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Sales Invoice Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type IN (2,5) /* Item, Charge */
	WHERE h.[Sell-to Customer No_] <> h.[Bill-to Customer No_]
	UNION
	--SourceCodeFromSalesCrMemoLine
	SELECT h.No_ as DocumentNo, 
		CASE WHEN l.Type = 2 THEN l.No_ ELSE NULL END as ItemNo, 
		CASE WHEN l.Type = 5 THEN l.No_ ELSE NULL END as ItemChargeNo, 
		1 /* Sale */ as ILEType,
		h.[Sell-to Customer No_] as OldSourceCode,
		h.[Bill-to Customer No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Sales Cr_Memo Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Sales Cr_Memo Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type IN (2,5) /* Item, Charge */
	WHERE h.[Sell-to Customer No_] <> h.[Bill-to Customer No_]
	UNION
	--SourceCodeFromPurchRcptLine
	SELECT h.No_ as DocumentNo, 
		CASE WHEN l.Type = 2 THEN l.No_ ELSE NULL END as ItemNo, 
		CASE WHEN l.Type = 5 THEN l.No_ ELSE NULL END as ItemChargeNo, 
		0 /* Purchase */ as ILEType,
		h.[Buy-from Vendor No_] as OldSourceCode,
		h.[Pay-to Vendor No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Purch_ Rcpt_ Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Purch_ Rcpt_ Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type = 2 /* Item */
	WHERE h.[Buy-from Vendor No_] <> h.[Pay-to Vendor No_]
	UNION
	--SourceCodeFromPurchInvLine
	SELECT h.No_ as DocumentNo, 
		CASE WHEN l.Type = 2 THEN l.No_ ELSE NULL END as ItemNo, 
		CASE WHEN l.Type = 5 THEN l.No_ ELSE NULL END as ItemChargeNo, 
		0 /* Purchase */ as ILEType,
		h.[Buy-from Vendor No_] as OldSourceCode,
		h.[Pay-to Vendor No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Purch_ Inv_ Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Purch_ Inv_ Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type IN (2,5) /* Item, Charge */
	WHERE h.[Buy-from Vendor No_] <> h.[Pay-to Vendor No_]
	UNION
	--SourceCodeFromPurchCrMemoLine
	SELECT h.No_ as DocumentNo, 
		CASE WHEN l.Type = 2 THEN l.No_ ELSE NULL END as ItemNo, 
		CASE WHEN l.Type = 5 THEN l.No_ ELSE NULL END as ItemChargeNo, 
		0 /* Purchase */ as ILEType,
		h.[Buy-from Vendor No_] as OldSourceCode,
		h.[Pay-to Vendor No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Purch_ Cr_ Memo Hdr_] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Purch_ Cr_ Memo Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type IN (2,5) /* Item, Charge */
	WHERE h.[Buy-from Vendor No_] <> h.[Pay-to Vendor No_]
	UNION
	--SourceCodeFromReturnShptLine
	SELECT h.No_ as DocumentNo, 
		l.No_ as ItemNo, 
		NULL as ItemChargeNo,  
		0 /* Purchase */ as ILEType,
		h.[Buy-from Vendor No_] as OldSourceCode,
		h.[Pay-to Vendor No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Return Shipment Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Return Shipment Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type = 2 /* Item */
	WHERE h.[Buy-from Vendor No_] <> h.[Pay-to Vendor No_]
	UNION
	--SourceCodeFromReturnRcptLine
	SELECT h.No_ as DocumentNo, 
		l.No_ as ItemNo, 
		NULL as ItemChargeNo, 
		1 /* Sale */ as ILEType,
		h.[Sell-to Customer No_] as OldSourceCode,
		h.[Bill-to Customer No_] as NewSourceCode
	FROM DynamicsNAV.dbo.[Cronus$Return Receipt Header] h with(nolock)
	INNER JOIN DynamicsNAV.dbo.[Cronus$Return Receipt Line] l with(nolock)
		ON l.[Document No_] = h.No_ AND l.Type = 2 /* Item */
	WHERE h.[Sell-to Customer No_] <> h.[Bill-to Customer No_]

) 
UPDATE ve
SET "Source No_" = NewSourceCode
FROM "DynamicsNAV"."dbo"."Cronus$Value Entry" ve
INNER JOIN Source_CTE s 
	ON s.DocumentNo = ve."Document No_"
		AND s.ILEType = ve."Item Ledger Entry Type" 
		AND s.OldSourceCode = ve."Source No_"
		AND (ItemNo IS NULL OR ItemNo = ve."Item No_")
		AND (ItemChargeNo IS NULL OR ItemChargeNo = ve."Item Charge No_");

GO 


