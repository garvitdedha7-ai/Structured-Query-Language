create database school1;
use school1;
CREATE TABLE ass5 (
    EMP_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT,
    HIRE_DATE DATE
);

INSERT INTO ass5 (EMP_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, HIRE_DATE) VALUES
(1, 'JOHN', 'DOE', 'IT', 60000, '2019-01-10'),
(2, 'JANE', 'SMITH', 'HR', 55000, '2018-03-05'),
(3, 'EMILY', 'JONES', 'IT', 62000, '2020-07-23'),
(4, 'MICHAEL', 'BROWN', 'FINANCE', 70000, '2016-05-14'),
(5, 'SARAH', 'DAVIS', 'FINANCE', 69000, '2017-11-18'),
(6, 'DAVID', 'JOHNSON', 'HR', 48000, '2021-09-10');

select * from ass5;
-- 1. Find the average salary of employees in each department. 
select department , avg(salary)
from ass5
group by department;

-- 2. Find the total number of employees hired after 2019.
select count(*) as no_of_employees
from ass5
where hire_date >01-01-2019;

-- 3. List the departments and the total salary of all employees in each department, ordered by the total salary.
select department, sum(salary)
from ass5
group by department
order by sum(salary) desc;

-- 4. Find the highest salary in the Finance department.
select department, max(salary)
from ass5
where department = "finance";

-- 5. Get the top 3 highest-paid employees.
select first_name, max(salary)
from ass5 
group by FIRST_NAME
limit 3;

-- 6. Find the department with the minimum average salary.  
select department, avg(salary)
from ass5
group by department
order by avg(salary) desc
limit 1;

-- 7. Display the total number of employees in each department, ordered by the number of employees. 
SELECT department, COUNT(*) AS total_employees
FROM ass5
GROUP BY department
ORDER BY total_employees DESC;

-- 8. Find the average salary of employees who were hired before 2020.  
SELECT AVG(salary) AS avg_salary_before_2020
FROM ass5
WHERE hire_date < '2020-01-01';

-- 9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first. 
SELECT EMP_id, hire_date
FROM ass5
WHERE department = 'IT'
ORDER BY hire_date DESC;

-- 10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. 
SELECT EMP_id, salary
FROM ass5
WHERE hire_date > '2019-12-31'
ORDER BY salary DESC;

-- 11. get the employee with the lowest salary in the HR department.
SELECT first_name, salary, department
FROM ass5
WHERE department = 'HR'
ORDER BY salary ASC
LIMIT 1;

-- 12. find the total salary paid to employees in each department,but limit the result to the top 2 highest-paying departments.
SELECT department, SUM(salary) AS total_salary
FROM ass5
GROUP BY department
ORDER BY total_salary DESC
LIMIT 2;

-- 13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees.  
SELECT EMP_id, salary, hire_date
FROM ass5
WHERE hire_date > '2018-12-31'
ORDER BY salary DESC
LIMIT 4;

-- 14. Find the highest salary in the IT department, but limit the results to the top 1 result.   
SELECT EMP_id, salary
FROM ass5
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 1;

-- 15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.
SELECT department, AVG(salary) AS average_salary
FROM ass5
GROUP BY department
HAVING AVG(salary)> 60000;
