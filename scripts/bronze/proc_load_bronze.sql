/*
=========================================================
Create a stored procedure for re running the table import
=========================================================
*/

create or alter procedure bronze.load_bronze as
begin
	declare @start_time DATETIME, @end_time DATETIME;
	begin try
	print '=======================================';
	print 'loading bronze layer';
	print '=======================================';

	print '=======================================';
	print 'Loading CRM tables';
	print '=======================================';

	SET @start_time = GETDATE();
	truncate table bronze.crm_cust_info;

	bulk insert bronze.crm_cust_info
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';

	SET @start_time = GETDATE();
	truncate table bronze.crm_prd_info;

	bulk insert bronze.crm_prd_info
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

	SET @start_time = GETDATE();
	truncate table bronze.crm_sales_details;

	bulk insert bronze.crm_sales_details
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

	


	print '=======================================';
	print 'Loading ERP tables';
	print '=======================================';
	SET @start_time = GETDATE();
	truncate table bronze.erp_cust_az12;

	bulk insert bronze.erp_cust_az12
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';


	SET @start_time = GETDATE();
	truncate table bronze.erp_loc_a101;

	bulk insert bronze.erp_loc_a101
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

	bulk insert bronze.erp_px_cat_g1v2
	from 'D:\Data Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration:' + cast(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

	end try
	begin catch
		print '======================================';
		print 'Error occured';
		print '======================================';
	end catch
end
