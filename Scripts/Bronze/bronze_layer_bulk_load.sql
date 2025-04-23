/*
====================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
====================================================================
Script Purpose:
	This Stored procedure loads data into 'Bronze' schema from external CSV files.
	It performs the following actions:
	1- Truncate the Bronze tables before loading data.
	2- Uses the 'BULK INSERT' command to load data from CSV files to Bronze tables.

Parameters:
	None.
	This stored procedure does not accept any parameters or return any values.

Usage Example:
	EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '======================';
		PRINT 'Loading Bronze Layer';
		PRINT '======================';

		PRINT '--------------------';
		PRINT 'Loading CRM Tables';
		PRINT '--------------------';

		SET @start_time = GETDATE();
		PRINT '->Truncate Table: crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '->Bulk Load: crm_cust_info';
		BULK INSERT bronze.crm_cust_info
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\cust_info.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '->Truncate Table: crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '->Bulk Load: crm_prd_info';
		BULK INSERT bronze.crm_prd_info
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\prd_info.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'


		SET @start_time = GETDATE();
		PRINT '->Truncate Table: crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '->Bulk Load: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\sales_details.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'

		PRINT '--------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------';

		SET @start_time = GETDATE();
		PRINT '->Truncate Table: erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '->Bulk Load: erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\cust_az12.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '->Truncate Table: erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '->Bulk Load: erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\loc_a101.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '->Truncate Table: erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '->Bulk Load: erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
				FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\px_cat_g1v2.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '---------------------------------------------------------------'

		SET @batch_end_time = GETDATE();
		PRINT '----------------------------------------------------------------'
		PRINT 'Loading Bronze Layer Completed';
		PRINT 'Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' second';
		PRINT '----------------------------------------------------------------'	
	END TRY

	BEGIN CATCH
		PRINT'===============================================';
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT'Error Message' + ERROR_MESSAGE();
		PRINT'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT'===============================================';
	END CATCH
END
