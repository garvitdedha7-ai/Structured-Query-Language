CREATE TABLE employees2 (
emp  INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(30),
salary INT,
experience INT,
gender VARCHAR(10));

INSERT INTO employees2 (emp , name , department ,salary ,experience , gender ) VALUES
(1, 'Alice', 'HR', 40000, 3, 'Female'),
(2, 'Bob', 'Finance', 60000, 6, 'Male'),
(3, 'Charlie', 'IT', 55000, 4, 'Male'),
(4, 'David', 'IT', 80000, 10, 'Male'),
(5, 'Eva', 'Finance', 45000, 2, 'Female'),
(6, 'Frank', 'HR', 50000, 7, 'Male'),
(7, 'Grace', 'IT', 30000, 1, 'Female'),
(8, 'Helen', 'Finance', 70000, 9, 'Female'),
(9, 'lan', 'HR', 65000, 8, 'Male'),
(10, 'Julia', 'IT', 48000, 3, 'Female');

select name,salary,
	case
		when salary>70000 then'high'
		when salary between 40000 and 70000 then 'medium'
	else'low'
		end as salary_level
from employees2;

select name ,experience,
	case
     when experience>=8 then " 10000"
     when experience>=5 then " 7000"
	  else " 3000"
     end as bonus_status
from employees2;

select name,gender,
	case
    when gender = "female" then concat("ms ",name)
    when gender = "male" then concat("mr ",name)
    end as gender
    from employees2;
    
    select name,experience,salary,
		case
        when experience>=8 and salary>="60000" then "A"
        when experience between 5 and 8 then"B"
        else "C"
        end as performance 
        from employees2;
        
        select name,department,
			case
            when department= "IT" then "D01"
            when department= "FINANCE" then "D02"
		       else  "D03"
             end as department_status
            from employees2;
            
            select name,department,
				case
                when department="IT" or department= "FINANCE" then "technical"
                else " non technical"
                end as department_type
                from employees2;
                
                SELECT name, department, experience,
CASE
   WHEN department = 'IT' THEN
     CASE
        WHEN experience > 5 THEN 'Experienced IT Staff'
        ELSE 'New IT Staff'
     END
   ELSE 'Other Department'
END AS remarks
FROM employees2;

select name,experience,salary,
		case
        when salary>(select avg(salary)from employees2 )then"salary above  average"
        else"below average"
        end as salary_level
        from employees2;
select * from employees2;

SELECT 
    name, 
    salary,
    CASE
        WHEN salary - 50000 > 0 THEN CONCAT('Above 50k by ', salary - 50000)
        WHEN salary - 50000 < 0 THEN CONCAT('Below 50k by ', 50000 - salary)
        ELSE 'Exactly 50k'
    END AS salary_gap
FROM employees2;
