
use master;
if exists(select 1 from sys.databases where name='Datawarehouse')
begin
alter database Datawarehouse set single_user with rollback immediate;
drop database Datawarehouse;
end;
go

create database Datawarehouse;
go

use Datawarehouse;
go
create schema bronze;
go

create schema silver;
go
create schema gold;  

-------CREATING TABLES
IF OBJECT_ID ('bronze.crm_cust_info','U')IS NOT NULL
DROP TABLE bronze.crm_cust_info;
create table bronze.crm_cust_info(
cst_id int,
cst_key varchar(15),
cst_first_name varchar(20),
cst_lastname varchar(20),
cst_marital_status varchar(1),
cst_gndr varchar(1),
cst_create_date date);

IF OBJECT_ID ('bronze.crm_prd_info','U')IS NOT NULL
DROP TABLE bronze.crm_prd_info;
create table bronze.crm_prd_info(
prd_id int,
prd_key varchar(15),
prd_nm varchar(15),
prd_cost int,
prd_line varchar(1),
prd_start_dt date,
prd_end_dt date);

IF OBJECT_ID ('bronze.crm_sales_details','U')IS NOT NULL
DROP TABLE bronze.crm_sales_details;
create table bronze.crm_sales_details(
sls_ord_num	varchar(20),
sls_prd_key	varchar(20),
sls_cust_id	int,
sls_order_dt int,	
sls_ship_dt int,	
sls_due_dt int,	
sls_sales int,	
sls_quantity int,	
sls_price int);

IF OBJECT_ID ('bronze.erp_CUST_AZ12','U')IS NOT NULL
DROP TABLE bronze.erp_CUST_AZ12;
create table bronze.erp_CUST_AZ12(
CID	varchar(20),
BDATE date,
GEN varchar(6));

IF OBJECT_ID ('bronze.erp_LOC_A101','U')IS NOT NULL
DROP TABLE bronze.erp_LOC_A101;
create table bronze.erp_LOC_A101(
CID	varchar(20),
CNTRY varchar(20));

IF OBJECT_ID ('bronze.erp_PX_CAT_G1V2','U')IS NOT NULL
DROP TABLE bronze.erp_PX_CAT_G1V2;
create table bronze.erp_PX_CAT_G1V2(
ID varchar(10),
CAT	varchar(10),
SUBCAT varchar(10),
MAINTENANCE varchar(10));


---LOADING DATA DROM CSV FILES TO THE TABLES WE HAVE CREATED ABOVE
truncate table bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
select count(*) from bronze.crm_cust_info;

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

BULK INSERT bronze.erp_LOC_A101
FROM 'C:\Users\iampr\Documents\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);





