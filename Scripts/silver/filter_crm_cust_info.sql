
insert into silver.crm_cust_info(
cst_id,
cst_key,
cst_first_name,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date)

select 
cst_id,
cst_key,
trim(cst_first_name) as cst_first_name,
trim(cst_lastname) as cst_lastname,
case 
 when upper(trim(cst_marital_status)) = 'S' then 'Single'
 when upper(trim(cst_marital_status))='M' then 'Married'
 else 'n/a'
 end cst_marital_status,
case 
 when upper(trim(cst_gndr)) = 'M' then 'Male'
 when upper(trim(cst_gndr))='F' then 'Female'
 else 'n/a'
 end cst_gndr,
cst_create_date
--removing duplicates and null
from (select
*,
row_number() over(partition by cst_id order by cst_create_date desc) flag
from bronze.crm_cust_info
where cst_id is not null
)t
where flag=1



