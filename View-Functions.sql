create database views;

use views;

# // View Function //


create table emp(
emp_id int,
emp_name varchar(10),
dept_name varchar(10),
salary float
);

insert into emp(emp_id,emp_name,dept_name,salary)values
(1,'Alice','HR',50000),
(2,'Bob','IT',70000),
(3,'Charlie','IT',60000),
(4,'David','HR',55000),
(5,'Eve','Finance',65000);

select * from emp;

# Q. Creating a view to show employee name and salary.
create view Show_name_salary as
select emp_name, salary from emp;

select * from Show_name_salary;

# Q. Create a view to show highest salary of employees.
# (i)..
create view Highest_earner as 
select * from emp 
where salary = (select max(salary) from emp);

select * from Highest_earner;

# (ii)..
create view High_earner as
select * from emp
order by salary desc limit 1;

select * from High_earner;

# Q. Create a view that shows total salary by department.
create view Dept_salary as
select dept_name, sum(salary) as Total_salary from emp
group by dept_name;

select * from Dept_salary;

# Q. Update a view.
create or replace view High_earner as
select * from employee 
where salary > 65000;

select * from High_earner;

# Q. Drop a view.
drop view if exists High_earner;

# Table creation.
create table department(
dept_id int,
dept_name varchar(50)
);

insert into department(dept_id,dept_name)values
(1,'HR'),
(2,'IT'),
(3,'Finance');

select * from department;

create table employee_2(
emp_id int,
emp_name varchar(10),
salary int,
dept_id int
);

insert into employee_2(emp_id,emp_name,salary,dept_id)values
(101,'Amit',50000,1),
(102,'Riya',70000,2),
(103,'Karan',60000,2),
(104,'Neha',55000,3);

select * from employee_2;

# Q. Create a view display employee name and department name.
create view showEmpDept as
select e.emp_name, d.dept_name from employee_2 e
inner join department d
on e.dept_id = d.dept_id;

select * from showEmpDept;

# -- Create table --

create table employee_3(
emp_id int,
emp_name varchar(10),
salary int,
dept_id int
);

insert into employee_3(emp_id,emp_name,salary,dept_id)values
(1,'Amit',50000,1),
(2,'Riya',70000,2),
(3,'Karan',60000,2),
(4,'Neha',55000,3),
(5,'Rohit',80000,1);

select * from employee_3;

# Q. Display employee name and salary status using if(salary > 60000).
create view emp_name_salary as
select emp_name, salary,
if (salary > 60000, "High_salary", "Low_salary") as Salary_status
from employee_3;

select * from emp_name_salary;

# Q. Show employee bonus eligibility (salary > 65000).
create view Bonus_eligibility as
select emp_name, salary,
if (salary > 65000, "eligibile", "Not eligibile") as Bonus
from employee_3;

select * from Bonus_eligibility;

# --/ Ques on ANY /--

# Q. Employees earning more than any IT employee.
create view Earning_comparision as
select * from employee_3
where salary > any(select e.salary from employee_3 e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name = "IT");

select * from Earning_comparision;

# Q. Employee earning more than any HR employee.
create view earning_comparision_HR as
select * from employee_3
where salary > any (select e.salary from employee_3 e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name = "HR");

select * from earning_comparision_HR;


# --/ Ques on ALL /--

# Q. Employees earning more than any ALL IT employee.
create view Earning_comparision_IT as
select * from employee_3
where salary > all(select e.salary from employee_3 e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name = "IT");

select * from Earning_comparision_IT;