create database dept;
use dept;

create table employees(
id int,
name varchar(20),
department varchar(20),
salary int);

insert into employees values
(1,"Alice","HR",50000),
(2,"Bob","HR",60000),
(3,"Charlie","IT",70000),
(4,"David","IT",80000),
(5,"Eve","HR",55000);

select * from employees;

#Ques:1 Create A Procedure to display all employee detail.
delimiter //
create procedure ShowAllEmployee()
begin 
select * from employees;
end //
delimiter ;
call ShowAllEmployee;

#Ques:2 Create a Stored Procedure to fetch all employee from a specific department.
delimiter //
create procedure GetEmployeeByDept(in dept_name varchar(50))
begin
select * from employees where department=dept_name;
end //
delimiter ;
call GetEmployeeByDept("IT");

#Ques:3 Create A stored procedure to insert a new employee.
delimiter //
create procedure AddEmployee(
in id int,
in name varchar(10),
in department varchar(10),
in salary int)
begin 
insert into employees(id,name,department,salary)values(id,name,department,salary);
end //
delimiter ;
call AddEmployee(6,"Neha","Finance",60000);

select * from employees;

#Ques:4 create a stored procedure to return the total salary of all employees.
delimiter //
create procedure Totalsalaryemployee()
begin
select sum(salary) as total_salary from employees;
end //
delimiter ;
call TotalSalaryEmployee();

#Ques:5 create a stored procedure to increase salary by a given percentage for a department.
delimiter //
create procedure IncreasesalaryByDept(
in dept_name varchar(50),
in percent_increase int)
begin
update employees set salary=salary+(salary*percent_increase/100) where department=dept_name;
end //
delimiter ;
call IncreasesalaryBydept("Finance",10);
set SQL_Safe_updates=0;

select * from employees;

#Ques:6 create a stored procedure to delete an employee by ID.
delimiter //
create procedure DeleteEmployee(in emp_id int)
begin 
delete from employees where id=emp_id;
end //
delimiter ;
call DeleteEmployee(6);

select*from employees;

#Ques:7 create a procedure to update employee name.
delimiter //
create procedure UpdateEmployee(in emp_id int,in emp_name varchar(50))
begin
update employees set name=emp_name where id=emp_id;
end //
delimiter ;
call UpdateEmployee(1,"Salman");
select* from employees;

#Ques:8 create a procedure to get highest salary employee.
delimiter //
create procedure HighestSalary()
begin
select max(salary) from employees;
end //
delimiter ;
call HighestSalary();

#Ques:9 create a procedure to return average salary.
delimiter //
create procedure ReturnAvgSalary()
begin
select avg(salary) from employees;
end //
delimiter ;
call ReturnAvgSalary();

#Ques:10 create a procedure to return average salary department wise.
delimiter //
create procedure AvgSalaryBydept()
begin
select department,avg(salary) as Average_Salary from employees dept_avg_salary group by department;
end //
delimiter ;
call AvgSalaryBydept();

#Ques:11 create a procedure to count total employee.
delimiter //
create procedure CountEmployee()
begin
select count(*) from employees;
end //
delimiter ;
call CountEmployee();

#Ques:12 create a procedure to get employee above a salary.
delimiter //
create procedure Above_salary(in emp_salary int)
begin
select * from employees where salary>emp_salary;
end //
delimiter ;
call Above_salary(60000);

#Ques:13 create a procedure to add 2 numbers.
delimiter //
create procedure Add_number(in x int,in y int)
begin
select x+y as Result;
end //
delimiter Add_number;
call Add_number(10,10);



