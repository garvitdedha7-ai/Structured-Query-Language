SELECT * FROM groupbyhaving.sales_data;

# 1. Find total sales amount for each region.
select region, sum(quantity*price)
from sales_data
group by region;

# 2. Find total quantity sold by each salesperson.
select salesperson, sum(quantity)
from sales_data
group by salesperson;

# 3. Show categories where total quantity sold is more than 30.
select category, sum(quantity)
from sales_data
group by category
having sum(quantity)>30;

# 4. Find total revenue by each category.
select category, sum(quantity*price)
from sales_data
group by category;

# 5. Find salesperson who sold total quantity more than 20.
select salesperson, sum(quantity)
from sales_data
group by salesperson
having sum(quantity)>20;

# 6.  Find region-wise average sale price
select region, avg(price)
from sales_data
group by region;

# 7. Find total revenue for each salesperson and show only those having revenue above >300000.
select salesperson, sum(quantity*price)
from sales_data
group by salesperson
having sum(quantity*price)>₹300000;

# 8.find how many products each category has.
select category,count(category)
from sales_data
group by category;

# 9.find total sales per month.
 

-- 10. Maximum sale price in each region
SELECT region, MAX(price)
FROM sales_data
GROUP BY region;

-- 11. Average quantity sold per category where avg > 10
SELECT category, AVG(quantity)
FROM sales_data
GROUP BY category
HAVING AVG(quantity) > 10;

-- 12. Total revenue by region and category
SELECT region, category, SUM(quantity * price)
FROM sales_data
GROUP BY region, category;

-- 13. Number of sales by salesperson in each region
SELECT salesperson, region, COUNT(*)
FROM sales_data
GROUP BY salesperson, region;

-- 14. Regions where total quantity sold > 20
SELECT region
FROM sales_data
GROUP BY region
HAVING SUM(quantity) > 20;

-- 15. Salespersons who sold in more than one region
SELECT salesperson
FROM sales_data
GROUP BY salesperson
HAVING COUNT(DISTINCT region) > 1;

-- 16. Categories with revenue between 50000 and 20000
SELECT category, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY category
HAVING revenue BETWEEN 50000 AND 20000;

-- 17. Top 1 category with highest sales
SELECT category, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY category
ORDER BY revenue DESC
LIMIT 1;

-- 18. Average sale value per transaction by salesperson
SELECT salesperson, AVG(quantity * price)
FROM sales_data
GROUP BY salesperson;

-- 19. Category with minimum average price greater than 20000
SELECT category, MIN(price)
FROM sales_data
GROUP BY category
HAVING AVG(price) > ₹20000;

-- 20. Region and salesperson combinations with revenue > 200000
SELECT region, salesperson, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY region, salesperson
HAVING revenue > ₹200000;