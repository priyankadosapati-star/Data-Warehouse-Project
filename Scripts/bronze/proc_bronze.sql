
---LOADING DATA DROM CSV FILES TO THE TABLES WE HAVE CREATED ABOVE(stored procedure)
create or alter procedure bronze.load_bronze as
begin
declare @starttime datetime,@endtime datetime;
begin try
set @starttime=getdate();
	truncate table bronze.crm_cust_info;
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	set @endtime=getdate();
	print 'load duration' + cast(datediff(second, @starttime,@endtime) as nvarchar) + 'seconds'

	truncate table bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);

	truncate table bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);

	truncate table bronze.erp_CUST_AZ12;
	BULK INSERT bronze.erp_CUST_AZ12
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);

	truncate table bronze.erp_LOC_A101
	BULK INSERT bronze.erp_LOC_A101
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	rowterminator='\n',
	TABLOCK
	);

	BULK INSERT bronze.erp_PX_CAT_G1V2
	FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	end try
	begin catch
	print 'error message'+ error_message();
	print 'errror message' + cast(error_number() as varchar);
 	end catch
end

--executing that procedure
exec bronze.load_bronze;





