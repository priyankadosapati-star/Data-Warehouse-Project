
IF OBJECT_ID ('silver.crm_cust_info','U')IS NOT NULL
DROP TABLE silver.crm_cust_info;
create table silver.crm_cust_info(
cst_id int,
cst_key varchar(15),
cst_first_name varchar(20),
cst_lastname varchar(20),
cst_marital_status varchar(10),
cst_gndr varchar(10),
cst_create_date date,
dwh_date_time datetime2 default getdate());

IF OBJECT_ID ('silver.crm_prd_info','U')IS NOT NULL
DROP TABLE silver.crm_prd_info;
create table silver.crm_prd_info(
prd_id int,
prd_key varchar(30),
prd_nm varchar(100),
prd_cost int,
prd_line varchar(30),
prd_start_dt date,
prd_end_dt date,
dwh_date_time datetime2 default getdate());

IF OBJECT_ID ('silver.crm_sales_details','U')IS NOT NULL
DROP TABLE silver.crm_sales_details;
create table silver.crm_sales_details(
sls_ord_num	varchar(20),
sls_prd_key	varchar(20),
sls_cust_id	int,
sls_order_dt int,	
sls_ship_dt int,	
sls_due_dt int,	
sls_sales int,	
sls_quantity int,	
sls_price int,
dwh_date_time datetime2 default getdate());

IF OBJECT_ID ('silver.erp_CUST_AZ12','U')IS NOT NULL
DROP TABLE silver.erp_CUST_AZ12;
create table silver.erp_CUST_AZ12(
CID	varchar(20),
BDATE date,
GEN varchar(6),
dwh_date_time datetime2 default getdate());

IF OBJECT_ID ('silver.erp_LOC_A101','U')IS NOT NULL
DROP TABLE silver.erp_LOC_A101;
create table silver.erp_LOC_A101(
CID	varchar(255),
CNTRY varchar(255),
dwh_date_time datetime2 default getdate());

IF OBJECT_ID ('silver.erp_PX_CAT_G1V2','U')IS NOT NULL
DROP TABLE silver.erp_PX_CAT_G1V2;
create table silver.erp_PX_CAT_G1V2(
ID varchar(10),
CAT	varchar(30),
SUBCAT varchar(30),
MAINTENANCE varchar(10),
dwh_date_time datetime2 default getdate());



