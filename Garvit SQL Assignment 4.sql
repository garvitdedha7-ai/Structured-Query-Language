create database companyy;

use companyy;

create table employees(
id INT Primary Key,
name varchar(100),
position varchar(100),
salary DECIMAL(10,2),
date_of_joining DATE);

INSERT INTO employees (id, name, position, salary, date_of_joining ) VALUES
(1, "John Doe", "Manager", 55000.00, "2020-01-15"),
(2, "Jane Smith", "Developer", 48000.00, "2019-07-10"),
(3, "Alice Johnson", "Designer",45000.00, "2021-03-22"),
(4, "Bob Brown", "Developer", 50000.00, "2018-11-01");

select * from employees;

# Q1. Write a query to retrieve all employees who are Developers.
select * from employees
where position = "Developer";

# Q2. Write a query to update the salary of Alice Johnson to 46000.00.alter
set sql_safe_updates=0;
UPDATE Employees
SET Salary = 46000.00
WHERE Name = 'Alice Johnson';

# Q3. Write a query to delete the employee record for Bob Brown.
DELETE FROM Employees
WHERE Name = 'Bob Brown';

# Q4. Write a query to find the employees who have a salary greater than 48000.
select * from employees
where salary>48000;

# Q5. Write a query to add a new column email to the employees table.
alter table employees add email varchar(20);

# Q6. Write a query to update the email for John Doe to john.doe@company.com.
UPDATE Employees
SET email = "john.doe@company.com"
WHERE Name = "John Doe";

# Q7. Write a query to retrieve only the name and salary of all employees.
SELECT Name, Salary
FROM Employees;

# Q8. Write a query to count the number of employees who joined after January 1, 2020.
SELECT COUNT(*) AS employee_count
FROM employees
WHERE date_of_joining > '2020-01-01';

# Q9. Write a query to order the employees by salary in descending order.
SELECT * FROM employees
ORDER BY salary DESC;

# Q10. Write a query to drop the email column from the employees table.
ALTER TABLE employees
DROP COLUMN email;

# Q11. Write a query to find the employee with the highest salary. 
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);