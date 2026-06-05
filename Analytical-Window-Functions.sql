create database company;

use company;

create table sales(id int, employee varchar(20), department varchar(20), sales_amount int, sales_date date);

insert into sales(id, employee, department, sales_amount, sales_date) values
(1, "Alice", "A", 1000, "2024-01-01"),
(2,"Bob", "B", 1500, "2024-01-02"),
(3, "Alice", "A", 2000, "2024-01-03"),
(4, "Bob", "B", 1800, "2024-01-04"),
(5, "Alice", "A", 1200, "2024-01-05"),
(6, "Bob", "B", 1600, "2024-01-06");

select * from sales;

# Q1. Total sales per employee (Running Total).
select id, employee, department, sales_amount as current_sales, sales_date,
sum(sales_amount) over(partition by employee order by sales_date, id) as running_Total
from sales;

# Q2. Row number per employee.
select id, employee, department, sales_amount, sales_date,
row_number() over(partition by employee order by sales_date, id) as row_num
from sales;

# Q3. Rank of sales per department.
select id, employee, department, sales_amount, sales_date,
rank() over(partition by department order by sales_amount desc) as sales_rank
from sales;

# Q4. Lead (next sale) per employee.
select employee, sales_amount as current_sale_amount, sales_date as current_sale_date,
lead(sales_amount) over(partition by employee order by sales_date, id) as next_sale_amount,
lead(sales_date) over(partition by employee order by sales_date,id) as next_sale_date
from sales;

# Q5. Lag (previous sale) per employee.
select employee, sales_amount as current_sale_amount, sales_date as current_sale_date,
lag(sales_amount) over(partition by employee order by sales_date, id) as next_sale_amount,
lag(sales_date) over(partition by employee order by sales_date, id) as next_sale_date
from sales;

# Q6. Average sales per employee.
select employee, sales_amount, sales_date,
avg(sales_amount) over(partition by employee) as Average_sale
from sales;

# Q7. First and last sales per employee.
select employee, sales_amount, sales_date,
first_value(sales_amount) over(partition by employee order by sales_date, id) as first_sale_amount,
first_value(sales_date) over(partition by employee order by sales_date, id) as first_sale_date,
last_value(sales_amount) over(partition by employee order by sales_date, id rows between unbounded preceding and unbounded following) as last_sale_amount,
last_value(sales_date) over(partition by employee order by sales_date, id rows between unbounded preceding and unbounded following) as last_sale_date
from sales; 

# Q8. Dense rank (no gaps).
select id, employee, department, sales_amount, sales_date,
dense_rank() over(partition by department order by sales_amount desc) as sales_dense_rank
from sales;

# Q9. Cumulative average per employee.
select id, employee, department, sales_amount, sales_date,
avg(sales_amount) over(partition by employee order by sales_date, id) as cumu_avg
from sales;

# Q10. Find the highest sale per employee.
select employee, department, sales_amount, sales_date,
max(sales_amount) over(partition by employee) highest_sale
from sales;

# Q11. Sales difference from previous record.
select id, employee, department, sales_amount, sales_date,
sales_amount - lag(sales_amount) over(partition by employee order by sales_date, id) as sales_difference
from sales;

# Q12. Cumulative count of sales per employee.
select id, employee, department, sales_amount, sales_date,
count(sales_amount) over(partition by employee order by sales_date, id) as cumu_count
from sales;

# Q13. Show if sale is above average per employee.
select id, employee, department, sales_amount, sales_date,
avg(sales_amount) over(partition by employee) as avg_sale,
case
when sales_amount > avg(sales_amount) over(partition by employee) then "Yes (Above Avg)"
when sales_amount = avg(sales_amount) over(partition by employee) then "On Avg"
else "No (Below Avg)"
end as is_above_avg
from sales;

# Q14. Find the second highest sale per employee.
with RankedSales as (select id, employee, department, sales_amount, sales_date,
dense_rank() over(partition by employee order by sales_amount desc) as rnk
from sales)
select id, employee, department, sales_amount as second_highest_sale, sales_date
from RankedSales
where rnk = 2;