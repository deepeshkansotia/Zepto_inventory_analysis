drop table if exists zepto

CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

select * from zepto

--Data Exploration
--1. Counted the total number of records in the dataset
select count(sku_id)
from zepto;

--2. Viewed a sample of the dataset to understand structure and content
select *
from zepto
limit 10;

--3. Checked for null values across all columns
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--4. Identified distinct product categories available in the dataset
select distinct category
from zepto;

--5. Compared in-stock vs out-of-stock product counts
select count(sku_id), outofstock as stock_availability
from zepto
group by outofstock;

--6. Detected products present multiple times, representing different SKUs
select name, count(sku_id)
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--Data Cleaning
--1. Identified and removed rows where MRP or discounted selling price was zero
select sku_id, category, name
from zepto
where mrp=0 or discountedsellingprice=0;
DELETE FROM zepto
WHERE mrp = 0 or discountedsellingprice=0;

--2. Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
update zepto
set mrp=mrp/100,
discountedsellingprice=discountedsellingprice/100;

select * from zepto;

--Business Insights
--1. Found top 10 best-value products based on discount percentage
select category, name,mrp,discountedsellingprice, discountpercent
from zepto
order by discountpercent desc
limit 10;

--2. Identified high-MRP products that are currently out of stock
select name, mrp
from zepto
where outofstock=TRUE
order by mrp desc limit 10;

--3. Estimated potential revenue for each product category
select category, sum(discountedsellingprice*availablequantity) as pot_revenue
from zepto
group by category
order by pot_revenue desc;

--4. Filtered expensive products (MRP > ₹500) with minimal discount
select name, mrp, discountpercent
from zepto
where mrp>500 and discountpercent<10
order by mrp desc, discountpercent desc;

--5. Ranked top 5 categories offering highest average discounts
select category, round(avg(discountpercent),2)
from zepto
group by category
order by avg(discountpercent) desc;

--6. Calculated price per gram to identify value-for-money products
SELECT DISTINCT name,
ROUND(discountedsellingprice / weightingms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;

--7. Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--8. Measured total inventory weight per product category
select category, sum(weightingms) as total_weight_in_grams
from zepto
group by category
order by total_weight_in_grams desc;