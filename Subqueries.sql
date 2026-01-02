create database subqueries;

use subqueries;

create table sq(
emp_id int,
emp_name varchar(10),
dept_id int not null,
salary float,
age int
);

insert into sq(emp_id,emp_name,dept_id,salary,age)values
(1,'John',101,50000,28),
(2,'Emma',101,65000,32),
(3,'Raj',102,45000,26),
(4,'Meera',103,70000,38),
(5,'Ravi',102,48000,30),
(6,'Naina',103,52000,29),
(7,'Alex',101,58000,31);

select * from sq;

create table dept(
dept_id int not null,
dept_name varchar(10)
);

insert into dept(dept_id,dept_name)values
(101,'Sales'),
(102,'Marketing'),
(103,'Finance');

select * from dept;

# Q-1 Show employee whose is above average salary ?
select emp_name,salary from sq
where salary > (select avg(salary) from sq);

# Q-2 Find employees who work in the sales department ?
select emp_name from sq
where dept_id = (select dept_id from dept where dept_name = 'sales');

# Q-3 Find the highest paid employee ?
select emp_name,salary from sq
where salary = (select max(salary) from sq);

# Q-4 Find employees older than the youngest employee ?
select emp_name from sq
where age > (select min(age)from sq);

# Q-5 List employees who earn more than john ?
select emp_name,salary from sq
where salary > (select(salary) from sq where emp_name = 'John');

# Q-6 Find employees in departments where the average salary is above 50000 ?
select emp_name,salary from sq
where dept_id in (
select dept_id from sq
group by dept_id
having avg(salary)> 50000);

# Q-7 Find the employees whose salary is second highest ?
select emp_name from sq
where salary = (select max(salary) from sq
where salary < (select max(salary) from sq));

# Q-8 Find the employees in the same department as emma ?
select * from sq
where dept_id = (select dept_id from sq
where emp_name = 'emma');

# Q-9 List departments have more than 2 employee ?
select dept_id
from(
select dept_id, count(*) as emp_count
from sq 
group by dept_id) d
where d.emp_count > 2;

# Q-10 Find employees who earn more than every employee in marketing ?
select * from sq
where salary > (select max(salary) from sq
where dept_id = (select dept_id from dept
where dept_name = "Marketing"));

# Q-11 Find employees who earn the minimum salary in thier department ?
select emp_name,dept_id,salary
from sq s
where salary = (select min(salary) from sq
where dept_id=s.dept_id);

# Q-12 Find employees whose salary is above the department average ?
select emp_name,salary,dept_id
from sq s
where salary > (select avg(salary) from sq
where dept_id = s.dept_id);

# Q-13 List employees who are younger than emma ?
select emp_name from sq
where age > (select min(age)from sq
where emp_name = 'emma');

# Q-14 Find the employee who do not work in any department present in the department table ?
select emp_name,dept_id
from sq
where dept_id not in (select dept_id from dept);

# Q-15 Find the top 2 highest salary using a subquery ?
select emp_name,salary
from sq
where salary in (select salary from (
select distinct salary
		from sq
        order by salary 
        limit 2) as t
        );
         
# Q-16 Display employees who salary is below department average ?
select emp_name,salary
from sq s
where salary < (select avg(salary) from sq
where dept_id = s.dept_id);

# Q-17 Find employees who age is greater than the average age ?
select emp_name,age from sq
where age > (select avg(age) from sq);

# Q-18 Find employees who belong to departments starting with 'M' ?
select emp_name,dept_id from sq
where dept_id = (select dept_id from dept
where dept_name like 'M%');

# Q-19 Find employees who do not have the same salary as anyone else ?
select * from sq
where salary in(select salary from sq);