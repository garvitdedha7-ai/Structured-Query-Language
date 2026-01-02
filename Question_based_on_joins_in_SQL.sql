create database joins;

use joins;

create table student(
student_id int,
student_name varchar(20),
course_id int null
);

insert into student(student_id,student_name,course_id)values
(1,'John',101),
(2,'Emma',102),
(3,'Raj',103),
(4,'Sara',null),
(5,'Alex',101);

select * from student;

create table course(
course_id int,
course_name varchar(20),
instructor_id int
);

insert into course(course_id,course_name,instructor_id)values
(101,'Data science',1),
(102,'Machine learning',2),
(103,'Database systems',3),
(104,'Web development',4);

select * from course;

create table instructors(
instructor_id int not null,
instructor_name varchar(20)
);

insert into instructors(instructor_id,instructor_name)values
(1,'Dr.Smith'),
(2,'Dr.Miller'),
(3,'Dr.Patil'),
(4,'Dr,Brown'),
(5,'Dr.Jones');

select * from instructors;

# Q-1 Get all students with their course names ?
select s.student_name, c.course_name
from student s
inner join course c
on s.course_id = c.course_id;

# Q-2 List students enrolled in "Machine Learning" ?
select s.student_name, c.course_name
from student s
inner join course c
on s.course_id = c.course_id
where course_name = "Machine Learning";

# Q-3 Display student_name,course name, instructor name ?
select s.student_name, c.course_name, i.instructor_name
from student s
inner join course c on s.course_id = c.course_id
inner join instructors i on c.instructor_id = i.instructor_id;

# Q-4 Show instructor and their corresponding students ?
select i.instructor_name,student_name
from student s
inner join course c on s.course_id = c.course_id
inner join instructors i on c.instructor_id = i.instructor_id;

# Q-5 Display courses having at least one student ?
select c.course_name,count(student_id)
from student s
inner join course c on s.course_id = c.course_id
group by course_name
having count(student_id >= 1);

# Q-6 List all students with instructors who names start with 'Dr.P' ?
select s.student_name, i.instructor_name
from student s
inner join course c on s.course_id = c.course_id
inner join instructors i on c.instructor_id = i.instructor_id
where i.instructor_name like "Dr.P%";

# Q-7 Get all students and their course name(including those not enrolled) ?
select s.student_name,c.course_name
from student s 
left join course c
on s.course_id = c.course_id;

# Q-8 List all courses and enrolled students(including courses without students) ?
select  c.course_name,s.student_name
from student s 
right join course c 
on s.course_id = c.course_id;

# Q-9 Find the students who are not enrolled in any course ?
select s.student_name,c.course_name
from student s
left join course c 
on s.course_id = c.course_id
where c.course_name is null;

# Q-10 Display all courses and instructors, even if no instructor is assigned ?
select c.course_name,i.instructor_name
from course c
left join instructors i
on c.instructor_id = i.instructor_id;

# Q-11 Show all instructors with their courses(even if no course) ?
select instructor_name,course_name
from course c
right join instructors i
on c.instructor_id = i.instructor_id;

# Q-12 Display students and instructors (even if no course assigned) ?
select s.student_name,i.instructor_name
from student s 
left join course c on s.course_id = c.course_id
left join instructors i on c.instructor_id = i.instructor_id;

# Q-13 Display all students and courses using right join ?
select student_name,course_name
from course c
right join student s 
on c.course_id=s.course_id;

# Q-14 Show all instructors and courses (ensure all courses are displayed) ?
select i.instructor_name,c.course_name
from course c 
right join instructors i 
on c.instructor_id = i.instructor_id;

# Q-15 Display all courses and corresponding students show null if no student ?
select c.course_name,count(s.student_id)
from student s 
right join course c
on s.course_id=c.course_id
group by course_name;

# Q-16 Find all the instructors with students (with right join) ?
select i.instructor_name,s.student_name
from student s 
right join course c on s.course_id = c.course_id
right join instructors i on c.instructor_id = i.instructor_id;

# Q-17 List all students and instructors(ensure all instructors are shown) ?
select s.student_name,i.instructor_name
from student s 
right join course c on s.course_id = c.course_id
right join instructors i on c.instructor_id = i.instructor_id;