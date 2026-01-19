create database college;
use college;

create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(50)
);
-- drop table student;

insert into student values 
(101,"anil",78,"c","pune"),
(102,"bhumika",93,"a","mumbai"),
(103,"chetan",85,"b","mumbai"),
(104,"dhruv",96,"a","delhi"),
(105,"emanuel",12,"f","delhi"),
(106,"farah",82,"b","delhi");

create table course (
id int primary key,
name varchar (50)
);
insert into course 
values (101,"science"),
(102,"english"),
(104,"math"),
(107,"CS");
--
--
-- subquery
--
--
SELECT name,marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);

SELECT name, rollno
FROM student
WHERE rollno % 2 =0 ; -- even roll no
 

select max(marks)
from (SELECT marks ,city FROM student WHERE city = "delhi") as temp;

--
-- views virtual tables
--
-- 
create view teacherLookup as
select rollno, name, marks
from student;
select * from teacherLookup;

--
--
-- join 
--
--
-- 1. inner join

select * 
from student as s
inner join course as c
on s.rollno=c.id;

-- 2. left join
select *
from student as s
left join course as c
on s.rollno=c.id;

-- 3. right join
select *
from student as s
right join course as c
on s.rollno=c.id;

-- 3. full join
select *
from student as s
left join course as c
on s.rollno=c.id
union
select *
from student as s
right join course as c
on s.rollno=c.id;

-- left exclusive join
select *
from student as s
left join course as c
on s.rollno=c.id
where c.id is null;

-- right exclusive join
select *
from student as s
right join course as c
on s.rollno=c.id
where s.rollno is null;

-- full exclusive join
select *
from student as s
right join course as c
on s.rollno=c.id
where s.rollno is null
union                            -- union
select *
from student as s
left join course as c
on s.rollno=c.id
where c.id is null;

-- * self join ( joining table with itself )
create table employees(
id int primary key,
name varchar(50),
manager_id int
);

insert into employees
values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"tom",103);

-- * self join ( joining table with itself )
select  b.name, a.name as manager_name
from employees as a
join employees as b
on a.id=b.manager_id;

--
--
-- basics
--
--
select name, marks from student where marks>80;

select * from student
where marks between 80 and 90;

select * from student limit 3;
select * from student
where marks between 80 and 90 limit 1;

select * from student
where city not in  ("delhi","mumbai");

select * from student
where marks> 90
order by marks desc
limit 3;

select avg (marks)
from student;

select city, count(name)
from student
group by city;


select city ,avg(marks) 
from student
group by city
order by city asc;

-- having clause
select city ,count(name)
from student
group by city
having max(marks)>80;

-- update

UPDATE student
SET grade = 'O'
WHERE marks > 90
  AND grade = 'a';
-- set sql_safe_updates = 0; -- to turnn off safe mode
-- set sql_safe_updates = 1; -- to turnn on safe mode

-- delete
delete from student 
where marks<35;

select * from student;



-- alter table
-- 1. ADD

-- Alter table student
-- ADD COLUMN age int not null default 19;
-- drop column age;
-- rename to student;
-- change column ages age int ; -- old_name new_name new_D_type new_constraint
-- modify age int not null;

-- -- exercise
-- modify age varchar(2);
-- change age stu_age int ;
-- drop column stu_age;
-- -- truncate table student;


-- alter Table student 
-- -- change column name full_name varchar(50);
-- -- drop age;
-- select * from student;
-- delete from student where marks<80;








-- create table customers
-- (
-- 	customer_id INT PRIMARY KEY,
--     customer VARCHAR(100),
--     mode VARCHAR(50),
--     city VARCHAR(100)
-- );

-- INSERT INTO customers (customer_id, customer, mode, city) VALUES
-- (101, 'Olivia Barrett', 'Netbanking', 'Portland'),
-- (102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
-- (103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
-- (104, 'Liam Donovan', 'Netbanking', 'Denver'),
-- (105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
-- (106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
-- (107, 'Ava Patel', 'Debit Card', 'Phoenix'),
-- (108, 'Lucas Carter', 'Netbanking', 'Boston'),
-- (109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
-- (110, 'Jackson Brooks', 'Credit Card', 'Boston');


-- -- find total payment made by each payment method
-- select mode , count(customer)
-- from customers
-- group by mode;


-- --
-- --
-- --
-- --
-- -- foreign key
-- create table dept (
-- id int primary key,
-- name varchar (50)
-- );

-- create table teachers(
-- id int primary key,
-- name varchar (50),
-- dept_id int,
-- foreign key (dept_id) references dept(id)
-- on update cascade
-- on delete cascade                          -- cascading
-- );
-- insert into dept 
-- values(101,"science"),
-- (102,"math"),
-- (103,"eng");


-- -- select * from teachers;
-- insert into teachers 
-- values(101,"ram",102),
-- (102,"shyam",103),
-- (103,"tom",101);

-- update  dept 
-- set id= 104
-- where id=103;





