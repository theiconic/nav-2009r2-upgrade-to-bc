# List of Tables and Indexes Enabled

To improve performance of the database conversion and the upgrade in the whole, the below is a list of large tables and indexes that have to be in the table objects from the Go Live date, the rest are set to not to be maintained in SQL. The SIFT indexes have to be enabled in the Development Environment, the non-SIFT are being added directly in SQL. Primary Keys (PK) are left enabled, of course. If there are no indexes listed below for a table, all indexes (except PKs) need to be disabled.

Tables not listed here are left without changes.

To build all disabled indexes on the tables below, it took approximately 16 hours.

Table filter: 

`17|21|32|45|46|110|111|112|113|114|115|121|254|271|339|379|5772|5773|5802|5823|6651|6661|7313|7318|7319|7322|7323|28161|37046301`

* 17 - G/L Entry
    * `SIFT` G/L Account No.,Global Dimension 1 Code,Global Dimension 2 Code,Posting Date
    * Document No.,Posting Date
    * Transaction No.
    * `SIFT` Posting Date,G/L Account No.,Dimension Set ID
    * Source Code,Document No.,Posting Date
    * Source Code,Posting Date,Document No.
* 21 - Cust. Ledger Entry
    * `SIFT` Customer No.,Posting Date,Currency Code
    * Document No.
    * Transaction No.
    * External Document No. 
* 32 - Item Ledger Entry	
    * `SIFT` Item No.
    * Item No.,Posting Date
    * Document No.,Document Type,Document Line No.	
    * External Document No.,Item No.
    * `SIFT` Source Type,Source No.,Item No.,Variant Code,Posting Date
    * `SIFT` Item No.,Open,Variant Code,Positive,Location Code,Posting Date
    * `SIFT` Item No.,Entry Type,Posting Date,Global Dimension 1 Code
* 45 - G/L Register	
* 46 - Item Register	
* 110 - Sales Shipment Header	
    * Order No.	
    * Posting Date	
    * Sell-to Customer No.
    * Bill-to Customer No
* 111 - Sales Shipment Line		
    * Order No.,Order Line No.,Posting Date,Document No.
    * Location Code,Posting Date,Type,Quantity,Document No.
* 112 - Sales Invoice Header	
    * Order No.
    * Posting Date
    * Sell-to Customer No.
    * Bill-to Customer No
* 113 - Sales Invoice Line	
    * Order No.,Order Line No.,Posting Date,Document No.
    * Type,No.,Location Code,Posting Date,Quantity,Document No.
    * Shipment No.,Shipment Line No.,Document No.
* 114 - Sales Cr.Memo Header	
    * Return Order No.
    * Posting Date
    * Sell-to Customer No.
    * Bill-to Customer No
* 115 - Sales Cr.Memo Line	
    * Order No.,Order Line No.,Posting Date,Document No.
    * Return Receipt No.,Return Receipt Line No.,Document No.
* 121 - Purch. Rcpt. Line			
* 254 - VAT Entry	
    * `SIFT` Type,Closed,VAT Bus. Posting Group,VAT Prod. Posting Group,Posting Date
    * Document No.,Posting Date		
    * Transaction No.    
* 271 - Bank Account Ledger Entry		
    * `SIFT` Bank Account No.,Posting Date
    * Document No.,Posting Date
    * Bank Account No.,Open
    * Transaction No.
* 339 - Item Application Entry	
    * Inbound Item Entry No.,Outbound Item Entry No.,Cost Application
    * Item Ledger Entry No.,Output Completely Invd. Date
* 379 - Detailed Cust. Ledg. Entry	
    * Cust. Ledger Entry No.,Posting Date
    * Document No.,Document Type,Posting Date
    * Transaction No.,Customer No.,Entry Type
    * Applied Cust. Ledger Entry No.,Entry Type
    * `SIFT` Customer No.,Entry Type,Posting Date,Initial Document Type
* 5772 - Registered Whse. Activity Hdr.	
* 5773 - Registered Whse. Activity Line	
* 5802 - Value Entry	
    * `SIFT` Item Ledger Entry No.,Entry Type
    * `SIFT` Item No.,Posting Date,Item Ledger Entry Type,Entry Type,Variance Type,Item Charge No.,Location Code,Variant Code   
    * Document No.
    * `SIFT` Source Type,Source No.,Item No.,Posting Date,Entry Type,Adjustment,Item Ledger Entry Type    		
* 5823 - G/L - Item Ledger Relation		
* 6651 - Return Shipment Line	
* 6661 - Return Receipt Line	
* 7313 - Warehouse Register
* 7318 - Posted Whse. Receipt Header
* 7319 - Posted Whse. Receipt Line	
    * Posted Source No.,Posting Date,No.
    * Source Type,Source Subtype,Source No.,Source Line No.,Posted Source Document,Posted Source No.,No.
* 7322 - Posted Whse. Shipment Header	
* 7323 - Posted Whse. Shipment Line
    * Posted Source No.,Posting Date,No.
    * Source Type,Source Subtype,Source No.,Source Line No.,No.
