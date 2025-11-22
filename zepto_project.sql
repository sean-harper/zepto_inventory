-- Zepto's inventory SQL project --

drop table if exists zepto;

create table zepto(
sku_id serial Primary key,
category varchar(120),
name varchar(120),
mrp numeric(8,2),
discount_percent numeric(5,2),
available_quantity integer,
discount_selling_price numeric(8,2),
weight_gms integer,
out_of_stock Boolean,
quantity integer
);

-- Counted the total number of records in the dataset--
select count(*)
from zepto;

--Checked for null values across all columns--
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discount_percent IS NULL
OR
discount_selling_price IS NULL
OR
weight_gms IS NULL
OR
available_quantity IS NULL
OR
out_of_stock IS NULL
OR
quantity IS NULL;

--Identified distinct product categories available in the dataset--
SELECT DISTINCT(category)
from zepto;

--Compared in-stock vs out-of-stock product counts--
Select out_of_stock, count(*)
from zepto
group by 1;

--Detected products present multiple times, representing different SKUs--
SELECT name, count(sku_id)
from zepto
group by 1
order by 2 desc;

-- remove MRP or discounted selling price was zero--
SELECT *
FROM zepto
limit 2
where mrp=0 or discount_selling_price=0;
DELETE from zepto
where mrp=0;

--Converted mrp and discountedSellingPrice from paise to rupees--
UPDATE zepto
SET mrp = mrp / 100.0, discount_selling_price = discount_selling_price / 100.0;

--Found top 10 best-value products based on discount percentage--
select name,mrp, discount_percent
from zepto
order by 2 desc
limit 10;

--Identified high-MRP products that are currently out of stock--
select name, mrp
from zepto
where out_of_stock =  true
order by 2 desc;

--Estimated potential revenue for each product category--
SELECT category, sum(discount_selling_price*available_quantity) as potential_revenue
from zepto
group by 1
order by 2 desc;

--Filtered expensive products (MRP > ₹500) with minimal discount--
select name, mrp, discount_percent
from zepto
where mrp> 500 and discount_percent <10
order by 2 desc, 3 desc;

--Ranked top 5 categories offering highest average discounts--
SELECT category, round(avg(discount_percent),2) as average_discount
from zepto
group by 1
order by 2 desc
limit 5;

--Calculated price per gram to identify value-for-money products--
SELECT name, round((weight_gms/discount_selling_price),2) as price_per_gram
FROM zepto
WHERE weight_gms >= 100
order by 2 ;

--Grouped products based on weight into Low, Medium, and Bulk categories--
select name, weight_gms,
CASE when weight_gms <=500 then 'Low' 
when weight_gms > 500 and weight_gms <= 1000 then 'Medium'
else 'Bulk' end as weight_category
from zepto;

--Measured total inventory weight per product category--
SELECT category, SUM(weight_gms * available_quantity)  as total_weight
FROM zepto
group by 1
order by 2 desc;

