#create database organization;
use organization;
create table department(dept_no int primary key,dept_name varchar(20),location varchar(20));
create table employee(emp_no int primary key,emp_name varchar(20) not null,DOB date,address varchar(30),date_of_join date,mobile_no bigint,dept_no int,foreign key(dept_no) references department(dept_no),salary float);

insert into department values(101,"Finance","Kozhikode");
insert into department values(102,"Marketing","Palakad");
insert into department values(103,"Sales","Enakulam");
select * from department;

insert into employee values(1,"Riya",'1993-06-26'," Chiramukhathu",'2020-04-06',9794201004,101,10000);
insert into employee values(2,"Nourin",'1996-12-30',"Chethikalam",'2021-01-02',8903185612,102,15000);
insert into employee values(3,"Rasika",'1989-10-16'," Kalarikal",'2018-08-10',9562061680,103,24500);
select * from employee;

show tables;
DESC employee;
alter table employee add column designation varchar(20);
alter table department drop column location;
drop table department,employee;
drop database Organization;
