#Create database Organization
create database organization;

#create tables employee and department
mysql> create table department(dept_no int primary key,dept_name varchar(20),location varchar(20));
Query OK, 0 rows affected (1.66 sec)

mysql> create table employee(emp_no int primary key,emp_name varchar(20) not null,DOB date,address varchar(30),date_of_join date,mobile_no bigint,dept_no int,foreign key(dept_no) references department(dept_no),salary float);
Query OK, 0 rows affected (1.80 sec)

(i) Add 5 rows in the employee and dept tables.
mysql> insert into department values(101,"Finance","Kozhikode");
Query OK, 1 row affected (0.23 sec)

mysql> insert into department values(102,"Marketing","Palakad");
Query OK, 1 row affected (0.12 sec)

mysql> insert into department values(103,"Sales","Enakulam");
Query OK, 1 row affected (0.07 sec)

mysql> insert into department values(104,"Sales","Alappuzha");
Query OK, 1 row affected (0.14 sec)

mysql> insert into department values(105,"Production","Kollam");
Query OK, 1 row affected (0.13 sec)


mysql> insert into employee values(1,"Riya",'1993-06-26'," Chiramukhathu",'2020-04-06',9794201004,101,10000,'legal');
Query OK, 1 row affected (0.16 sec)

mysql> insert into employee values(2,"Nourin",'1996-12-30',"Chethikalam",'2021-01-02',8903185612,102,15000,'executive');
Query OK, 1 row affected (0.22 sec)

mysql> insert into employee values(3,"Rasika",'1989-10-16'," Kalarikal",'2018-08-10',9562061680,103,24500,'typist');
Query OK, 1 row affected (0.25 sec)

mysql> insert into employee values(4,"John",'1989-12-22',"Polackal",'2016-04-14',8905431098,103,30000,'supervisor');
Query OK, 1 row affected (0.12 sec)

mysql> insert into employee values(5,"Asha",'1990-08-10',"Thadathil",'2018-01-18',9596992130,104,30500,'supervisor');
Query OK, 1 row affected (0.11 sec)

(ii) Display all the records from the above tables
mysql> select * from employee;
+--------+----------+------------+----------------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address        | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+----------------+--------------+------------+---------+--------+-------------+
|      1 | Riya     | 1993-06-26 |  Chiramukhathu | 2020-04-06   | 9794201004 |     101 |  10000 | legal       |
|      2 | Nourin   | 1996-12-30 | Chethikalam    | 2021-01-02   | 8903185612 |     102 |  15000 | executive   |
|      3 | Rasika   | 1989-10-16 |  Kalarikal     | 2018-08-10   | 9562061680 |     103 |  24500 | typist      |
|      4 | John     | 1989-12-22 | Polackal       | 2016-04-14   | 8905431098 |     103 |  30000 | supervisor  |
|      5 | Asha     | 1990-08-10 | Thadathil      | 2018-01-18   | 9596992130 |     104 |  30500 | supervisor  |
+--------+----------+------------+----------------+--------------+------------+---------+--------+-------------+
5 rows in set (0.00 sec)

mysql> select * from department;
+---------+------------+-----------+
| dept_no | dept_name  | location  |
+---------+------------+-----------+
|     101 | Finance    | Kozhikode |
|     102 | Marketing  | Palakad   |
|     103 | Sales      | Enakulam  |
|     104 | Sales      | Alappuzha |
|     105 | Production | Kollam    |
+---------+------------+-----------+
5 rows in set (0.00 sec)

(iii) Display the empno and name of all the employees from department no2.
mysql> select emp_no,emp_name from employee where dept_no=2;
+---------+-------------+
| dept_no | sum(salary) |
+---------+-------------+
|     102 |     Nourin  |
+---------+-------------+
1 row in set (0.00 sec)

(iv) Display empno,name,designation,dept no and salary in the descending order of salary.
mysql> select emp_no,emp_name,designation,dept_no,salary from employee order by salary desc;
+--------+----------+-------------+---------+--------+
| emp_no | emp_name | designation | dept_no | salary |
+--------+----------+-------------+---------+--------+
|      5 | Asha     | supervisor  |     104 |  30500 |
|      4 | John     | supervisor  |     103 |  30000 |
|      3 | Rasika   | typist      |     103 |  24500 |
|      2 | Nourin   | executive   |     102 |  15000 |
|      1 | Riya     | legal       |     101 |  10000 |
+--------+----------+-------------+---------+--------+
5 rows in set (0.00 sec)

(v)	Display the empno and name of all employees whose salary is between 5000 and 20000
mysql> select emp_no,emp_name from employee where salary between 5000 and 20000;
+--------+----------+
| emp_no | emp_name |
+--------+----------+
|      1 | Riya     |
|      2 | Nourin   |
+--------+----------+
2 rows in set (0.06 sec)

(vi) Display all designations without duplicate values.
mysql> select DISTINCT designation from employee;
+-------------+
| designation |
+-------------+
| legal       |
| executive   |
| typist      |
| supervisor  |
+-------------+
4 rows in set (0.11 sec)

(vii) Display the dept name and total salary of employees of each department.
mysql> select department.dept_name,sum(employee.salary) from employee inner join department on employee.dept_no=department.dept_no group by employee.dept_no;
+-----------+----------------------+
| dept_name | sum(employee.salary) |
+-----------+----------------------+
| Finance   |                10000 |
| Marketing |                15000 |
| Sales     |                54500 |
| Sales     |                30500 |
+-----------+----------------------+
4 rows in set (0.07 sec)

(viii)	Change the salary of employees to 25000 whose designation is ‘Typist’
mysql> update employee set salary=25000 where designation='typist';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee where designation='typist';
+--------+----------+------------+------------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address    | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+------------+--------------+------------+---------+--------+-------------+
|      3 | Rasika   | 1989-10-16 |  Kalarikal | 2018-08-10   | 9562061680 |     103 |  25000 | typist      |
+--------+----------+------------+------------+--------------+------------+---------+--------+-------------+
1 row in set (0.06 sec)

(ix) Change the mobile no of employee named ‘Varun’
mysql> update employee set mobile_no=9497602305 where emp_name='John';
Query OK, 1 row affected (0.12 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee where emp_name='John';
+--------+----------+------------+----------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address  | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+----------+--------------+------------+---------+--------+-------------+
|      4 | John     | 1989-12-22 | Polackal | 2016-04-14   | 9497602305 |     103 |  30000 | supervisor  |
+--------+----------+------------+----------+--------------+------------+---------+--------+-------------+
1 row in set (0.06 sec)

(x)	Delete all employees whose salaries are equal to Rs.10000
mysql> delete from employee where salary="10000";
Query OK, 1 row affected (0.34 sec)

mysql> select * from employee;
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address     | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
|      2 | Nourin   | 1996-12-30 | Chethikalam | 2021-01-02   | 8903185612 |     102 |  15000 | executive   |
|      3 | Rasika   | 1989-10-16 |  Kalarikal  | 2018-08-10   | 9562061680 |     103 |  25000 | typist      |
|      4 | John     | 1989-12-22 | Polackal    | 2016-04-14   | 9497602305 |     103 |  30000 | supervisor  |
|      5 | Asha     | 1990-08-10 | Thadathil   | 2018-01-18   | 9596992130 |     104 |  30500 | supervisor  |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
4 rows in set (0.06 sec)

(xi)Select the department that has total salary paid for its employees more than 25000
mysql> select dept_no,sum(salary) from employee group by dept_no having sum(salary)>25000;
+---------+-------------+
| dept_no | sum(salary) |
+---------+-------------+
|     103 |       55000 |
|     104 |       30500 |
+---------+-------------+
2 rows in set (0.35 sec)