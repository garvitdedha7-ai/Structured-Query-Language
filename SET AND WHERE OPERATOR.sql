use industry;

CREATE TABLE studio (
    id INT,
    name VARCHAR(50),
    percentage INT,
    age INT,
    gender CHAR(1),
    phone VARCHAR(10),
    city VARCHAR(50)
);

INSERT INTO studio (id, name, percentage, age, gender, phone, city) VALUES
(1, 'Ram Kumar', 45, 19, 'M', '4022144', 'Agra'),
(2, 'Sarita Kumari', 55, 22, 'F', '4034211', 'Delhi'),
(3, 'Salman Khan', 64, 20, 'M', '4034211', 'Agra'),
(4, 'Juhi Chawla', 47, 21, 'F', '4098921', 'Bhopal'),
(5, 'Anil Kapoor', 48, 21, 'M', '4098921', 'Agra'),
(6, 'John Abraham', 64, 21, 'M', '4033776', 'Delhi'),
(7, 'Shahid Kapoor', 52, 20, 'M', '4022784', 'Agra');

select * from studio;
set  sql_safe_updates=0;

 update studio
 set phone='4022144' where id=1;
 
 update studio
 set percentage=70,age=27 where id=3;
 
 update studio
 set age=18 
 where id in (2,3);
 
update studio
 set age=18;
 
 select * from studio
 where percentage>30 and percentage<70;
 
 select * from studio
 where percentage>=30 and percentage<=70;
 
 select * from studio
 where percentage>=30 or percentage<=60;
 
 select * from studio
 where city in('delhi'and'agra'); 