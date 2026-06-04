create database store;

use store;

# Q1. Create a trigger that updates an inventory table whenever a new sale is recorded in the sales table.
# Specifically, when a new sale is inserted into the sale table, the trigger should decrease the quantity of the corresponding product in the inventory table.

create table inventory(product_id int primary key, product_name varchar(100), quantity int);
create table sales(sale_id int auto_increment primary key, product_id int, amount decimal(10,2), sale_date date, quantity_sold int);

# Insert sample data into the inventory table:
insert into inventory (product_id, product_name, quantity) values
(1,"Product A",100),
(2,"Product B",150),
(3,"Product C",200);

select * from inventory;

# Create the trigger.
delimiter //
create trigger after_sales_insert
after insert on sales
for each row
begin
update inventory
set quantity = quantity - new.quantity_sold
where product_id = new.product_id;
end //
delimiter ;

insert into sales(product_id, amount, sale_date, quantity_sold) values
(1,50.00,"2024-07-01",10);

select * from inventory;

select * from sales;

# Q2. Create trigger on the employee table to automatically log the deleted employee's emp_id, name, department, and the exact time of deletion into a deleted_employees_log table.
create table employee(emp_id int primary key, name varchar(100), department varchar(100));
create table deleted_employees_log(log_id int auto_increment primary key, emp_id int, name varchar(100), department varchar(50), deleted_at datetime);
insert into employee(emp_id, name, department) values
(1,"Alice","HR"),
(2,"Bob","IT"),
(3,"Charlie","Finance");

select * from employee;

delimiter //
create trigger after_employee_delete
after delete on employee
for each row
begin
insert into deleted_employees_log(emp_id, name, department, deleted_at)
values(old.emp_id, old.name, old.department, now());
end //
delimiter ;

delete from employee where emp_id = 2;

select * from deleted_employees_log;

# Create table
create table employees(emp_id int primary key, name varchar(20), salary decimal(10,2));
create table employee_log(log_id int auto_increment primary key, emp_id int, action varchar(20), log_time timestamp default current_timestamp);
 
insert into employees(emp_id, name, salary) values
(1,"Alice",50000.00),
(2,"Bob",60000.00),
(3,"Charlie",70000.00),
(4,"Riya",65000.00);

select * from employees;

# Q3. Trigger to log insert activity.
delimiter //
create trigger after_employee_inserted
after insert on employees
for each row
begin
insert into employee_log(emp_id, action)
values (new.emp_id, "Inserted");
end //
delimiter ;

insert into employees(emp_id, name, salary)
values (5,"Sia",35000.00);

select * from employees;

select * from employee_log;

# Q4. Trigger to log salary changes.
create table salary_log(log_id int auto_increment primary key, emp_id int, old_salary decimal(10,2), new_salary decimal(10,2), log_time timestamp default current_timestamp);

delimiter //
create trigger after_salary_update
after update on employees
for each row
begin 
insert into salary_log(emp_id, old_salary, new_salary)
values(old.emp_id, old.salary, new.salary);
end //
delimiter ;

update employees
set salary = 40000.00
where emp_id = 2;

select * from employees;

select * from salary_log;

# Q5. Trigger to convert employee name to uppercase.
delimiter //
create trigger Conv_name
before insert on employees
for each row
begin
set new.name = upper(new.name);
end //
delimiter ;

insert into employees(emp_id, name, salary) 
value (6, 'Rahul sharma', 90000);

select * from employees;

# Q6. Trigger to prevent Negative Salary.
delimiter //
create trigger trg_before_insert_salary
before insert on employees
for each row
begin
if new.salary < 0 then 
signal sqlstate '45000'
set message_text = "Salary cannot be negative";
end if;
end //
delimiter ;

insert into employees(emp_id, name, salary) values (7,"vikas",-10000);

# Q7. Trigger to restrict salary reduction.
delimiter //
create trigger salary_reduction
before update on employees
for each row
begin
if new.salary < old.salary then 
signal sqlstate "45000"
set message_text = "Salary reduction not allowed";
end if;
end //
delimiter ;

update employees
set salary = 45000
where emp_id = 1;

# Q8. Trigger to log name changes.
delimiter //
create trigger log_name_changes
after update on employees
for each row
begin
if new.new_name <> old.name then
insert into log_name_change(emp_id, old_name, new_name)
values (new.emp_id, old.name, new.name);
end if;
end //
delimiter ;

# Q9. Set Default Salary.
delimiter //
create trigger set_default_salary
before insert on employees
for each row
begin
if new.salary is null then 
set new.salary = 50000;
end if ;
end //
delimiter ;

insert into employees (emp_id, name) values (7, "Adesh");

select * from employees;

# Q10. Create a trigger to Automatically Increase Salary by 10%.
delimiter //
create trigger Increase_salary
before insert on employees
for each row
begin 
set new.salary = new.salary + (new.salary * 0.10);
end //
delimiter ;

insert into employees(emp_id, name, salary) values(8,"Vikas",10000);

select * from employees;

# Q11. Create a Trigger to Store Old and New Salary Change.
create table employees_log(log_id int auto_increment primary key, emp_id int, action varchar(50), log_time timestamp default current_timestamp);

delimiter //
create trigger log_salary
after update on employees
for each row
begin
insert into employees_log(emp_id, action)
values(new.emp_id, concat_ws(" ","Salary Changed from",old.salary,"to",new.salary));
end //
delimiter ;

update employees
set salary = 70000
where emp_id = 3;

select * from employees;

select * from employees_log;

# Q12. Create a Trigger to count total employees.
create table employee_count_tracker(total_count int);
insert into employee_count_tracker(total_count) value (0);

# when we inserted a new emp then count + 1
delimiter //
create trigger insert_emp_after
after insert on employees
for each row
begin
update employee_count_tracker
set total_count = total_count + 1;
end //
delimiter ;

# when we deleted emp then count - 1
delimiter //
create trigger delete_emp_after
after delete on employees
for each row
begin
update employee_count_tracker
set total_count = total_count - 1;
end //
delimiter ;

insert into employees(emp_id, name, salary) values (9,"AKS",25000),(10,"VK",45000);

select * from employees;

select * from employee_count_tracker;

# Q13. Write a BEFORE UPDATE trigger on the products table to prevent the price from being updated to zero or a negative value. If a user tries to set a negative price, automatically reset it to the OLD.price.
create table product(p_id int primary key, name varchar(20), price decimal(10,2));
insert into product(p_id, name, price) values 
(1,"Laptop",20000),
(2,"Mobile",10000),
(3,"Tablet",15000);

select * from product;

delimiter //
create trigger prevent_negative_price
before update on product
for each row
begin
if new.price <= 0 then
set new.price = old.price;
end if ;
end //
delimiter ;

update product
set price = -10000
where p_id = 3;

select * from product;

# Q14. Write a BEFORE INSERT trigger on the users table. If the incoming email field is NULL, automatically generate an email using the format firstname.lastname@company.com and set it to the NEW.email field before saving.
create table users(id int primary key, first_name varchar(20), last_name varchar(20), email varchar(30));
insert into users(id, first_name, last_name, email) values
(1,"Rahul","Sharma","rahul.sharma.@company.com");

select * from users;

delimiter //
create trigger auto_gen_email
before insert on users
for each row
begin
if new.email is null then
set new.email = concat_ws(".",lower(new.first_name),lower(new.last_name),"@company.com");
end if ;
end //
delimiter ;

insert into users(id, first_name, last_name) values
(2,"Adesh","Singh");

select * from users;

# Q15. Write a BEFORE DELETE trigger on the system_users table to protect critical data. If the user's role is 'Admin', prevent the deletion process and signal an error message.
create table system_users(id int primary key, name varchar(20), role varchar(20));
insert into system_users(id, name, role) values
(1, "Adesh", "Admin"),
(2, "Abhishek", "Staff"),
(3, "Vikas", "Staff");

select * from system_users;

delimiter //
create trigger prevent_admin_deletion
before delete on system_users
for each row
begin
if old.role = "Admin" then
signal sqlstate "45000"
set message_text = "Security Alert : You can not delete an Admin user";
end if;
end //
delimiter ;

delete from system_users
where id = 1;