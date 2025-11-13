#Syntax for creating Database
CREATE DATABASE database_name;

#Syntax for dropping Database
DROP DATABASE database_name;

#Syntax for using Database
USE database_name;

# Suntax for creating a table
create table student2(
	id int not null unique,
    name varchar(20) not null,
    age int not null check(age>=18),
    gender varchar(1) not null,
    phone varchar(10) not null unique,
    city varchar(15) not null default 'Agra');

# Suntax for adding value in a table
insert into student2(id ,name ,age,gender ,phone ,city ) values
(1,"Raj",25,"M",222222,"Delhi"); 
select * from student2;
insert into student2(id ,name ,age,gender ,phone ,city ) values
(2,"Ria",20,"F",222223,"Delhi");
insert into student2(id ,name ,age,gender ,phone ,city ) values
(3,"Rajat",20,"M",222224,"Delhi");
insert into student2(id ,name ,age,gender ,phone ) values
(4,"Suraj",22,"M",222225);
insert into student2(id ,name ,age,gender ,phone ) values
(5,"Soni",18,"F",222226);