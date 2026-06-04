create database function_creation;

use function_creation;

# // Function Creation //

# 1.Function to calculate square of a number.
create function Square_num(a int)
returns int
deterministic
return a*a;

Select square_num(6);

# 2.Function to add two numbers
create function Sum_nums(a int, b int)
returns int
deterministic
return a+b;

select Sum_nums(5,5);

# 3.Create Even/Odd Checker
create function check_even_odd(n int)
returns varchar(50)
deterministic
return if(n%2 = 0, "Even","Odd");

select check_even_odd(10);

# 4.Function to calculate simple interest.
create function simple_interest(PA float, R float, tp float)
returns float
deterministic
return (PA * R * tp) / 100; # PRT

select simple_interest(1000, 18, 1);

# 5.Function to get full name.
create function full_name(first_name varchar(50), last_name varchar(50))
returns varchar(100)
deterministic
return concat(first_name, last_name);

select full_name("Adesh"," Kumar Singh");

# Function using Table data.
# -- Simple table --
create table employee(id int, name varchar(50), salary int);
insert into employee(id, name, salary) values(1,"Amit",50000),(2,"Riya",60000);

select * from employee;
# 6.Function to get salary.
create function get_salary(emp_id int)
returns int
deterministic
return (select salary
from employee
where id = emp_id);

select get_salary(2);

# 7.Function to count vowels in a string.
create function count_vowels(str varchar(255))
returns int
deterministic
return char_length(str) - char_length(replace(replace(replace(replace(replace(lower(str), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''));

select count_vowels("adesh kumar singh");

# 8.Function to generate User ID.
create function user_id_gen(first_name varchar(20), roll_year int)
returns varchar(30)
deterministic
return concat(first_name,roll_year);

select user_id_gen("adesh",2026) as User_ID;

# 9.Function to convert temperature.
create function C_into_F(celsius decimal(10,2))
returns decimal(10,2)
deterministic
return (celsius * 9/5) + 32;

select C_into_F(16) as Fahrenheit_Temp;

# 10.Function to calculate Speed.
create function speed_cal(distance decimal(10,2), time decimal(10,2))
returns decimal(10,2)
deterministic
return if(time = 0, 0, distance/time);

select speed_cal(100, 2) as Speed;

# 11.Function to get factorial.
delimiter //
create function get_factorial(n int)
returns bigint
deterministic
begin
declare result bigint default 1;
declare i int default 1;

if n < 0 then
return null;
end if;

while i <= n do
set result = result * i;
set i = i + 1;
end while;

return result;
end //
delimiter ;

select get_factorial(20) as Factorial_of_5;