TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\cust_info.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\prd_info.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\sales_details.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_crm\sales_details.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\cust_az12.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\loc_a101.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\HP Laptop 15\Documents\sql projects\datasets\source_erp\px_cat_g1v2.csv' --Update the file path to match the directory structure on your local machine
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
);
