# Microsoft Dynamics NAV 2009 R2 Upgrade to on-premise 365 Business Central 

This repository contains steps that proved to make the data upgrade process faster in production. The main goal was to be able to start testing the upgraded database as soon as possible to make a go-live or no-go-live decision before starting a working week. 

If starting fresh with only open balances is an option for you, please do that by all means. Otherwise, I hope you find some useful ideas here.

The main idea of the upgrade performance improvement is moving some long running C/AL functions to T-SQL and disabling table indexes until the last moment - creating in SQL directly first while the system can be used for the final pre-go-live testing (so called 'soft launch'). We also moved the document Dimension tables out of the toolkit radar by moving the data to other tables and doing the final processing in SQL. 

#### Disclaimer

The steps and scripts are provided as is, without guarantees, and should be referred as an example. Please ensure you have a team member that is familiar with the MS SQL Server and T-SQL if you choose to follow the steps. There probably will be some extra steps specific to your company.

## Prerequisites

- Python 3 installed
- NAV 2009 R2 classic client
- NAV 2013 Dev client installed
- NAV 2015 Dev Client and service installed
- Dynamics 365 Business Central (v. 14) Dev, service and clients installed
- SQL Server installed
- SQL Management Studio installed for running the T-SQL scripts

## Preparation Steps

1. Take the production NAV 2009 database offline so that no one could access it. We should be able to take it online and continue working in case upgrade doesn't go as expected.
1. Take the production database backup (or create volumes snapshots).
1. Restore the database (from the snapshots) on the upgrade environment and attach the database.
1. Ensure the log volume is twice as big as the data database file(s).
1. If the database is bigger than 1 TB, ensure there is another log file created to exceed 2TB limitation for logs.
1. Ensure the compatibility level of the NAV 2009 database is `SQL Server 2008 (100)`.
1. Ensure recovery mode is Simple.

## Upgrade 2009 to 2015 - Step 1

1. Using NAV 2009 R2 Classic client and developer license, open the company.
1. Check that all objects are not locked in the environment and force unlock all if any 
1. Export tables filtered with `..2000000000` by `ID` into a TXT file
1. Copy the entire [scripts folder](/upgrade-toolkits/object-text-scripts/src), using CLI, run script to disable indexes [disable_indexes.py](/upgrade-toolkits/object-text-scripts/src/disable_indexes.py) specifying the exported text file as `--original` (`-o`).
1. Upload the result file into the database and compile tables to drop the SQL indexes on the SQL server side. 
1. Export tables filtered with `<50000` from the database into `NAV_2009_Standard_Customized_Tables.txt` (for instance, to be clear) for a step later.
1. Run [upgrade6080-step1.1.sql](/upgrade-toolkits/upgrade6080/src/upgrade6080-step1.1.sql) against the database.
1. Import [Upgrade601800.1.MODIFIED.fob](/upgrade-toolkits/upgrade6080/Upgrade601800.1.MODIFIED.fob) replacing the existing tables (no schema changes, code on all triggers removed).
1. Export permissions
    1. Run Dataport `104001 - Import/Export Roles`
	1. Run Dataport `104002 - Import/Export Permissions`
1. In Object Designer, run table 2000000004 User Role and delete all the records with the filter `<>SUPER` by Role ID.
1. In Object Designer, menu Tools Security->Windows Logins, add your user and role SUPER.
1. Run [upgrade6080-step1.0.sql](/upgrade-toolkits/upgrade6080/src/upgrade6080-step1.0.sql) against the database.
1. Open Form `104001 Upgrade - Old Version`, press Transfer data and Delete Objects.

## Upgrade 2009 to 2015 - Conversion to 2013

1. Open NAV 2009 DB with NAV 2013 Development Environment to convert the database (takes long, with indexes enabled - ages).
1. Make a backup in the fastest way (copy database files).
1. Open DB with NAV 2015 as Administrator.
1. Compile tables 2000000004…2000000130 range with the synchronize schema `Later`.
1. Run [upgrade6080-step1.2.sql](/upgrade-toolkits/upgrade6080/src/upgrade6080-step1.2.sql) against the database.

## Upgrade 2009 to 2015 - Step 2

1. Upload the development licence.
1. Make sure the user that runs the NAV 2015 service `DynamicsNAV80` has the `db_owner` access to the DB.
1. Ensure Microsoft Dynamics NAV Server (NAV 2015) instance points to the database.
1. Ensure the NAV 2015 instance's `SQLCommandTimeout` is set to 23:00:00.
1. Start the NAV 2015 Service.
1. Run the Administration Shell as Administrator and execute command `Sync-NavTenant –ServerInstance DynamicsNAV80 -Mode Sync` to initialize database and synchronize all tables with validation.
1. Import all Microsoft Dynamics NAV 2015 objects file from the Cronus DB with Replace All and Sync Schema `Later`.
1. Run [add_custom_fields_without_code.py](/upgrade-toolkits/object-text-scripts/src/add_custom_fields_without_code.py) to add custom fields without code to NAV 2015 tables (so that we keep the custom and regional data when tables synced) with the following parameters (the date format in objects is dd/mm/yy, might differ for your region):
    1. [NAV_2009_Standard_Tables.txt](/upgrade-toolkits/upgrade6080/src/NAV_2009_Standard_Tables.txt) as `-o` (`--original`)
    1. Exported earlier `NAV_2009_Standard_Customized_Tables.txt` as `-m` (`--modified`)
    1. [NAV_2015_Standard_Tables.txt](/upgrade-toolkits/upgrade6080/src/NAV_2015_Standard_Tables.txt) as `-t` (`--target`)
    1. `NAV_2015_Standard_Customized_Tables.txt` as `-r` (`--result`) 
1. Run the index disabler [disable_indexes.py](/upgrade-toolkits/object-text-scripts/src/disable_indexes.py) specifying the result text file (`NAV_2015_Standard_Customized_Tables.txt`) as `--original` (`-o`).
1. Import the file generated `NAV_2015_Standard_Customized_Tables_Disabled_Indexes.txt`.
1. Export tables filtered with `50000..99000000` into a `CustomTables.txt` and use it as `-o` to run script to remove code [remove_code.py](/upgrade-toolkits/object-text-scripts/src/remove_code.py) to be able to compile them.
1. Import [Upgrade601800.MODIFIED.fob](/upgrade-toolkits/upgrade6080/Upgrade601800.MODIFIED.fob) with Sync Schema `Now - with Validation` and compile the UPG objects.
1. Compile all tables with Synchronize Schema `Later`.
1. Run the Administration Shell as Administrator and execute command `Sync-NavTenant –ServerInstance DynamicsNAV80 -Mode Sync` to initialize database and synchronize all tables with validation.
1. Review the errors if any.
1. Run `Sync-NavTenant –ServerInstance DynamicsNAV80 -Mode Force` (takes long).
1. Start the upgrade process by selecting from the menu: Tools-> Data Upgrade-> Start
1. Run the code moved to SQL [upgrade6080-step2.0.sql](/upgrade-toolkits/upgrade6080/src/upgrade6080-step2.0.sql) against the database.
1. Drop all upgrade objects (filtered with `104000..104999&<>104087&<>104088` to update the users later) with `Force`.
1. Make a backup of the database or snapshot.

## Upgrade 2015 to Business Central

1. Upload the license.
1. Delete all objects except tables (do NOT synchronize schema)
1. Clear Dynamics NAV Server instance and debugger breakpoint records from old database with the script 1. Run script [clear-instances-and-breakpoints.sql](/upgrade-toolkits/upgrade80130/src/clear-instances-and-breakpoints.sql).
1. Open Dynamics NAV Development Environment for Business Central as administrator and convert the 2015 database.
1. Import latest merged and prepared Business Central application objects filtered with `..2000000000` by ID.
1. Import upgrade toolkit objects [Upgrade8001300.AU.MODIFIED.fob](/upgrade-toolkits/upgrade80130/src/Upgrade8001300.AU.MODIFIED.fob) with Synchronization Schema `Later`.
1. Make sure the user that runs the BC service `BC140` has the `db_owner` access to the DB.
1. Ensure Microsoft Dynamics NAV Server `BC140` instance points to the database.
1. Ensure the BC instance's `SQLCommandTimeout` is set to 23:00:00.
1. Start the `BC140` service, make sure it's running after a minute.
1. Export large tables (for instance, filtered by ID with `17|21|32|45|46|110|111|112|113|114|115|121|254|271|339|379|5772|5773|5802|5823|6651|6661|7313|7318|7319|7322|7323|28161|37046301`) into a `Large_Tables_BC.txt` and use it as `-o` to run script [disable_indexes.py](/upgrade-toolkits/object-text-scripts/src/disable_indexes.py) and import the file generated `Large_Tables_BC_Disabled_Indexes.txt`.
1. Following the [List of Tables and Indexes Enabled](/doc/tables-and-enabled-indexes.md), enable ONLY the `SIFT` indexes on the tables in the Development Environment saving with Synchronization Schema `Later` and leaving the rest of the vital indexes to be created later using the script below.
1. Compile all objects in the BC DB with Synchronization Schema `Later`.
1. Run the Business Central Administration Shell as Administrator.
1. Execute command `Sync-NavTenant –ServerInstance BC140 -Mode Sync`, review errors if any. 
1. Execute command `Sync-NavTenant –ServerInstance BC140 -Mode Force` as we should have all fields that we need in BC objects.
1. Run the first importance index creation script [indexes-large-tables-first-importance.sql](/upgrade-toolkits/upgrade80130/src/indexes-large-tables-first-importance.sql) and without waiting for completion, proceed to the next steps while it's running in the background. The vital indexes listed in [List of Tables and Indexes Enabled](/doc/tables-and-enabled-indexes.md). 
1. Then run `Start-NavDataUpgrade -ServerInstance BC140`.
1. Run script [stored-procedure-GetDimensionSetID.sql](/upgrade-toolkits/upgrade80130/src/stored-procedure-GetDimensionSetID.sql).
1. Run script [upgrade-open-document-dimensions.sql](/upgrade-toolkits/upgrade80130/src/upgrade-open-document-dimensions.sql).
1. Run script [upgrade-journal-line-dimensions.sql](/upgrade-toolkits/upgrade80130/src/upgrade-journal-line-dimensions.sql).
1. Run script [upgrade-product-groups-and-open-docs.sql](/upgrade-toolkits/upgrade80130/src/upgrade-product-groups-and-open-docs.sql).
1. Run script to migrate data [migrate-data.sql](/upgrade-toolkits/upgrade80130/src/migrate-data.sql).
1. Restart the instances.
1. Generate symbols. Run using command prompt as administrator the following commands:
`cd "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client"`
`finsql.exe command=generatesymbolreference, database=<BCDatabase>, serverName=<BCDatabaseSQLServerName>`

## Pre-Go-Live Steps 

BC is functional at this point and can be tested at a certain extent. There are no history dimensions processed yet. Make sure users are aware of the situation when the test.

1. Run script [stored-procedure-GetDimensionSetIDByValueIDSet.sql](/upgrade-toolkits/upgrade80130/src/stored-procedure-GetDimensionSetIDByValueIDSet.sql).
1. Run the following scripts concurrently to process `Ledger Entry Dimensions`. This should be not interfere with the systems setup but might decrease performance in general.
    1. [upgrade-dimensions-GLEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-GLEntry.sql).
    1. [upgrade-dimensions-ValueEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-ValueEntry.sql). 
    1. [upgrade-dimensions-ItemLedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-ItemLedgerEntry.sql).
    1. [upgrade-dimensions-CustomerLedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-CustomerLedgerEntry.sql).
    1. [upgrade-dimensions-VendorLedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-VendorLedgerEntry.sql).
    1. [upgrade-dimensions-BankAccountLedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-BankAccountLedgerEntry.sql).
    1. [upgrade-dimensions-PhysInventoryLedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-PhysInventoryLedgerEntry.sql).
    1. [upgrade-dimensions-FALedgerEntry.sql](/upgrade-toolkits/upgrade80130/src/upgrade-dimensions-FALedgerEntry.sql).
1. Run the [indexes-large-tables-second-importance.sql](/upgrade-toolkits/upgrade80130/src/indexes-large-tables-second-importance.sql) script to build secondary importance indexes for Entry tables and leave it running until done. 

### User Groups and Profiles

After having database running, import prepared Permission, Permission Sets, User Group, User Group Permission Set, Profile, Profile Metadata.

## After Go-Live Steps

1. Run script [upgrade-product-groups-historical-data.sql](/upgrade-toolkits/upgrade80130/src/upgrade-product-groups-historical-data.sql).
1. Run script [upgrade-posted-document-dimensions.sql](/upgrade-toolkits/upgrade80130/src/upgrade-posted-document-dimensions.sql).
1. Enable indexes on the tables from the [List of Tables and Indexes Enabled](/doc/tables-and-enabled-indexes.md) gradually (estimate by testing table by table first) by planning and deploying BC table objects with indexes and syncing them.


## Helpful Resources

[Upgrading from Microsoft Dynamics NAV 2009 R2 or Microsoft Dynamics NAV 2009 SP1 to Microsoft Dynamics NAV 2015](https://blogs.msdn.microsoft.com/nav/2015/02/23/upgrading-from-microsoft-dynamics-nav-2009-r2-or-microsoft-dynamics-nav-2009-sp1-to-microsoft-dynamics-nav-2015/https://blogs.msdn.microsoft.com/nav/2015/02/23/upgrading-from-microsoft-dynamics-nav-2009-r2-or-microsoft-dynamics-nav-2009-sp1-to-microsoft-dynamics-nav-2015/)

[Converting a Database to Business Central - Technical Upgrade](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/upgrade/converting-a-database)

[Waldo's blog - What impact does my C/AL have on SQL?](https://dynamicsuser.net/nav/b/waldo/posts/what-impact-does-my-c-al-have-on-sql)
