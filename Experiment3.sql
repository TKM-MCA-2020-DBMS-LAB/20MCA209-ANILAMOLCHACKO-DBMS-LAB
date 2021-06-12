
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| organization       |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (1.65 sec)

mysql> use organization;
Database changed
mysql> show tables;
+------------------------+
| Tables_in_organization |
+------------------------+
| department             |
| employee               |
+------------------------+
2 rows in set (0.25 sec)


mysql> select * from employee;
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address     | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
|      1 | Riya     | 1991-05-16 | Kizhakedam  | 2020-08-10   | 9243106140 |     101 |  10000 | executive   |
|      2 | Nourin   | 1996-12-30 | Chethikalam | 2021-01-02   | 8903185612 |     102 |  15000 | manager     |
|      3 | Rasika   | 1989-10-16 |  Kalarikal  | 2018-08-10   | 9562061680 |     103 |  25000 | typist      |
|      4 | Varun    | 1989-12-22 | Polackal    | 2016-04-14   | 9497602305 |     103 |  30000 | supervisor  |
|      5 | Asha     | 1990-08-10 | Thadathil   | 2018-01-18   | 9596992130 |     104 |  30500 | supervisor  |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
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
5 rows in set (0.18 sec)

#1  View
mysql> create view manager as select emp_no,emp_name,dept_name,salary,location from employee,department;
Query OK, 0 rows affected (0.27 sec)
mysql> select distinct e.emp_name from employee e, manager m where e.salary>m.salary;
+----------+
| emp_name |
+----------+
| Asha     |
| Varun    |
| Rasika   |
| Nourin   |
+----------+
4 rows in set (0.11 sec)

#2 Update view
mysql> update manager set salary=1.1* salary where location="Palakad";
Query OK, 5 rows affected (0.15 sec)
Rows matched: 5  Changed: 5  Warnings: 0
mysql> select * from manager;

#3 Procedure
mysql> create table deptsalary as select dept_no, 0 as totalsalary from department;
Query OK, 5 rows affected (1.25 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> delimiter //
mysql> create procedure updatesalary(IN Param1 int)
    -> begin
    -> update deptsalary
    -> set totalsalary=(select sum(salary)from employee where dept_no=Param1)
    -> where dept_no=param1;
    -> end; //
Query OK, 0 rows affected (0.15 sec)

mysql> delimiter ;
mysql> call updatesalary(101);
Query OK, 1 row affected (0.55 sec)

mysql> call updatesalary(102);
Query OK, 1 row affected (0.16 sec)

mysql> call updatesalary(103);
Query OK, 1 row affected (0.09 sec)

mysql> call updatesalary(104);
Query OK, 1 row affected (0.11 sec)

mysql> select * from deptsalary;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
|     101 |       11000 |
|     102 |       16500 |
|     103 |       60500 |
|     104 |       33550 |
|     105 |           0 |
+---------+-------------+
5 rows in set (0.00 sec)

mysql> show procedure status;
mysql> drop procedure updatesalary;
Query OK, 0 rows affected (0.38 sec)

#4 Stored Procedures
mysql> delimiter //
mysql> create procedure getdetails()
    -> begin
    -> select * from employee;
    -> end //
Query OK, 0 rows affected (0.16 sec)

mysql> delimiter ;
mysql> call getdetails();
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address     | date_of_join | mobile_no  | dept_no | salary | designation |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
|      1 | Riya     | 1991-05-16 | Kizhakedam  | 2020-08-10   | 9243106140 |     101 |  11000 | executive   |
|      2 | Nourin   | 1996-12-30 | Chethikalam | 2021-01-02   | 8903185612 |     102 |  16500 | manager     |
|      3 | Rasika   | 1989-10-16 |  Kalarikal  | 2018-08-10   | 9562061680 |     103 |  27500 | typist      |
|      4 | Varun    | 1989-12-22 | Polackal    | 2016-04-14   | 9497602305 |     103 |  33000 | supervisor  |
|      5 | Asha     | 1990-08-10 | Thadathil   | 2018-01-18   | 9596992130 |     104 |  33550 | supervisor  |
+--------+----------+------------+-------------+--------------+------------+---------+--------+-------------+
5 rows in set (0.07 sec)

Query OK, 0 rows affected (0.23 sec)