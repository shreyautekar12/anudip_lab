Enter password: *************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

-- creates a new database to store all your tables 
mysql> create database student_management_system;  
Query OK, 1 row affected (0.02 sec)

-- selects that database to start working in it
mysql> use student_management_system;
Database changed

-- creates the 'students' table with student ID, first name,last name and DOB 
mysql> create table students (stud_id varchar(10) primary key not null, first_name varchar(10) not null, last_name varchar(10) not null, DOB date not null);
Query OK, 1 row affected, 1 warning (0.02 sec)

-- creates the 'enrollment' table to store which student enrolled in which course and when  
mysql> create table enrollment (en_id varchar(10) not null, stud_id varchar(10) primary key not null, course_id varchar(10) not null, en_date date not null, foreign key (stud_id) references students(stud_id));
Query OK, 1 row affected, 1 warning (0.02 sec)

-- displays all the tables in the database
mysql> show tables;
+-------------------------------------+
| Tables_in_student_management_system |
+-------------------------------------+
| enrollment                          |
| students                            |
+-------------------------------------+
2 rows in set (0.01 sec)

-- displays the structure of 'students' table (column names, data types, etc.)  
mysql> desc students;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| stud_id    | varchar(10) | NO   | PRI | NULL    |       |
| first_name | varchar(10) | NO   |     | NULL    |       |
| last_name  | varchar(10) | NO   |     | NULL    |       |
| DOB        | date        | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- inserts 5 student records into 'students' table  
mysql> insert into students values ('s101', 'Shreya', 'Utekar', '2004-04-12'), ('s102', 'Maharaja', 'Sunder', '2004-10-17'), ('s103', 'Khushboo', 'Yadav', '2001-07-15'), ('s104', 'Mehak', 'Rajbhar', '2004-03-29'), ('s105', 'Naveen', 'Jaiswal', '2002-06-10');
Query OK, 5 rows affected, 4 warnings (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 4

-- shows all records from the 'students' table  
mysql> select * from students;
+---------+------------+-----------+------------+
| stud_id | first_name | last_name | DOB        |
+---------+------------+-----------+------------+
| s101    | Shreya     | Utekar    | 2004-04-12 |
| s102    | Maharaja   | Sunder    | 2004-10-17 |
| s103    | Khushboo   | Yadav     | 2001-07-15 |
| s104    | Mehak      | Rajbhar   | 2004-03-29 |
| s105    | Naveen     | Jaiswal   | 2002-06-10 |
+---------+------------+-----------+------------+
5 rows in set (0.00 sec)

-- displays the structure of 'enrollment' table  
mysql> desc enrollment;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| en_id     | varchar(10) | NO   | PRI | NULL    |       |
| stud_id   | varchar(10) | NO   | MUL | NULL    |       |
| course_id | varchar(10) | NO   |     | NULL    |       |
| en_date   | date        | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- inserts 5 enrollment records into 'enrollment' table  
mysql> insert into enrollment values('e101','s101','wdr101','2025-01-18'),('e102','s102','cs102','2025-04-05'),('e103','s103','ai103','2025-03-12'),('e104','s104','ds104','2025-06-22'),('e105','s105','j105','2025-05-28');
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

-- shows all records from the 'enrollment' table  
mysql> select * from enrollment;
+-------+---------+-----------+------------+
| en_id | stud_id | course_id | en_date    |
+-------+---------+-----------+------------+
| e101  | s101    | wdr101    | 2025-01-18 |
| e102  | s102    | cs102     | 2025-04-05 |
| e103  | s103    | ai103     | 2025-03-12 |
| e104  | s104    | ds104     | 2025-06-22 |
| e105  | s105    | j105      | 2025-05-28 |
+-------+---------+-----------+------------+
5 rows in set (0.00 sec)

-- INNER JOIN: returns only students who are enrolled (match found in both tables)  
mysql> select students.stud_id, students.first_name, students.last_name, enrollment.en_id, enrollment.course_id from students inner join enrollment on students.stud_id=enrollment.stud_id;
+---------+------------+-----------+-------+-----------+
| stud_id | first_name | last_name | en_id | course_id |
+---------+------------+-----------+-------+-----------+
| s101    | Shreya     | Utekar    | e101  | wdr101    |
| s102    | Maharaja   | Sunder    | e102  | cs102     |
| s103    | Khushboo   | Yadav     | e103  | ai103     |
| s104    | Mehak      | Rajbhar   | e104  | ds104     |
| s105    | Naveen     | Jaiswal   | e105  | j105      |
+---------+------------+-----------+-------+-----------+
5 rows in set (0.00 sec)

-- LEFT JOIN: returns all students, even if they didn’t enroll (missing enrollments will show null)  
mysql> mysql> select students.stud_id, students.first_name, students.last_name, enrollment.course_id from students left join enrollment on students.stud_id=enrollment.stud_id;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| s101    | Shreya     | Utekar    | wdr101    |
| s102    | Maharaja   | Sunder    | cs102     |
| s103    | Khushboo   | Yadav     | ai103     |
| s104    | Mehak      | Rajbhar   | ds104     |
| s105    | Naveen     | Jaiswal   | j105      |
+---------+------------+-----------+-----------+
5 rows in set (0.01 sec)

-- RIGHT JOIN: returns all enrollments, even if there’s no matching student data  
mysql> select students.stud_id, students.first_name, students.last_name, enrollment.course_id from students right join enrollment on students.stud_id=enrollment.stud_id;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| s101    | Shreya     | Utekar    | wdr101    |
| s102    | Maharaja   | Sunder    | cs102     |
| s103    | Khushboo   | Yadav     | ai103     |
| s104    | Mehak      | Rajbhar   | ds104     |
| s105    | Naveen     | Jaiswal   | j105      |
+---------+------------+-----------+-----------+
5 rows in set (0.00 sec)

-- FULL OUTER JOIN (simulated using union): shows all students and all enrollments, matched where possible  
mysql> select students.stud_id, students.first_name, students.last_name, enrollment.course_id, enrollment.en_date from students left join enrollment on students.stud_id=enrollment.stud_id union select students.stud_id,students.first_name, students.last_name, enrollment.course_id, enrollment.en_date from students right join enrollment on students.stud_id=enrollment.stud_id;
+---------+------------+-----------+-----------+------------+
| stud_id | first_name | last_name | course_id | en_date    |
+---------+------------+-----------+-----------+------------+
| s101    | Shreya     | Utekar    | wdr101    | 2025-01-18 |
| s102    | Maharaja   | Sunder    | cs102     | 2025-04-05 |
| s103    | Khushboo   | Yadav     | ai103     | 2025-03-12 |
| s104    | Mehak      | Rajbhar   | ds104     | 2025-06-22 |
| s105    | Naveen     | Jaiswal   | j105      | 2025-05-28 |
+---------+------------+-----------+-----------+------------+
5 rows in set (0.01 sec)

-- CROSS JOIN: returns every combination of student and enrollment (total chaos)  
mysql> select students.stud_id, students.first_name, students.last_name, enrollment.course_id from students cross join enrollment;
+---------+------------+-----------+-----------+
| stud_id | first_name | last_name | course_id |
+---------+------------+-----------+-----------+
| s105    | Naveen     | Jaiswal   | wdr101    |
| s104    | Mehak      | Rajbhar   | wdr101    |
| s103    | Khushboo   | Yadav     | wdr101    |
| s102    | Maharaja   | Sunder    | wdr101    |
| s101    | Shreya     | Utekar    | wdr101    |
| s105    | Naveen     | Jaiswal   | cs102     |
| s104    | Mehak      | Rajbhar   | cs102     |
| s103    | Khushboo   | Yadav     | cs102     |
| s102    | Maharaja   | Sunder    | cs102     |
| s101    | Shreya     | Utekar    | cs102     |
| s105    | Naveen     | Jaiswal   | ai103     |
| s104    | Mehak      | Rajbhar   | ai103     |
| s103    | Khushboo   | Yadav     | ai103     |
| s102    | Maharaja   | Sunder    | ai103     |
| s101    | Shreya     | Utekar    | ai103     |
| s105    | Naveen     | Jaiswal   | ds104     |
| s104    | Mehak      | Rajbhar   | ds104     |
| s103    | Khushboo   | Yadav     | ds104     |
| s102    | Maharaja   | Sunder    | ds104     |
| s101    | Shreya     | Utekar    | ds104     |
| s105    | Naveen     | Jaiswal   | j105      |
| s104    | Mehak      | Rajbhar   | j105      |
| s103    | Khushboo   | Yadav     | j105      |
| s102    | Maharaja   | Sunder    | j105      |
| s101    | Shreya     | Utekar    | j105      |
+---------+------------+-----------+-----------+
25 rows in set (0.00 sec)