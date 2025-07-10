Enter password: *************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use shop;
Database changed
mysql> show tables;
+----------------+
| Tables_in_shop |
+----------------+
| customer       |
+----------------+
1 row in set (0.03 sec)

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| customer_id | varchar(7)  | NO   | PRI | NULL    |       |
| name        | varchar(12) | NO   |     | NULL    |       |
| email       | varchar(20) | NO   |     | NULL    |       |
| address     | varchar(50) | NO   |     | NULL    |       |
| ciy         | varchar(20) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into customer values('C101','Aarav','aarav01@gmail.com', '123 MG Road', 'Mumbai','9876543210'),('C102','Ishita','ishita@gmail.com', '22 Palm Street', 'Delhi','9812345678'),('C103','Rohan','rohan_das@gmail.com', '56 Park Avenue', 'Kolkata','9123456789'),('C104','Meera','meera.rk@gmail.com','Flat 12A, Tower 9', 'Pune','9988776655'),('C105','Yash','yash005@gmail.com', '78 Link Road', 'Chennai','9090909090');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+--------+---------------------+-------------------+---------+------------+
| customer_id | name   | email               | address           | ciy     | phone_no   |
+-------------+--------+---------------------+-------------------+---------+------------+
| C101        | Aarav  | aarav01@gmail.com   | 123 MG Road       | Mumbai  | 9876543210 |
| C102        | Ishita | ishita@gmail.com    | 22 Palm Street    | Delhi   | 9812345678 |
| C103        | Rohan  | rohan_das@gmail.com | 56 Park Avenue    | Kolkata | 9123456789 |
| C104        | Meera  | meera.rk@gmail.com  | Flat 12A, Tower 9 | Pune    | 9988776655 |
| C105        | Yash   | yash005@gmail.com   | 78 Link Road      | Chennai | 9090909090 |
+-------------+--------+---------------------+-------------------+---------+------------+
5 rows in set (0.00 sec)

mysql> create table product (product_id varchar(7) not null primary key, product_name varchar(20) not null, category varchar(20) not null, sub_category varchar(20) not null, original_price int not null, selling_price int not null, stock int not null);
Query OK, 0 rows affected (0.03 sec)

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(7)  | NO   | PRI | NULL    |       |
| product_name   | varchar(20) | NO   |     | NULL    |       |
| category       | varchar(20) | NO   |     | NULL    |       |
| sub_category   | varchar(20) | NO   |     | NULL    |       |
| original_price | int         | NO   |     | NULL    |       |
| selling_price  | int         | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> insert into product values ('P101', 'iPhone 14', 'Electronics', 'Mobile', 70000, 75000, 15), ('P102', 'Nike Shoes', 'Footwear', 'Running', 5000, 5499, 30), ('P103', 'Teddy Bear', 'Toys', 'Stuffed', 800, 950, 50), ('P104', 'T-shirt', 'Clothing', 'Men', 400, 499, 40), ('P105', 'Hair Dryer', 'Beauty', 'Hair Care', 1500, 1799, 20);
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from product;
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| product_id | product_name | category    | sub_category | original_price | selling_price | stock |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| P101       | iPhone 14    | Electronics | Mobile       |          70000 |         75000 |    15 |
| P102       | Nike Shoes   | Footwear    | Running      |           5000 |          5499 |    30 |
| P103       | Teddy Bear   | Toys        | Stuffed      |            800 |           950 |    50 |
| P104       | T-shirt      | Clothing    | Men          |            400 |           499 |    40 |
| P105       | Hair Dryer   | Beauty      | Hair Care    |           1500 |          1799 |    20 |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> create table orders (order_id varchar(7) not null primary key, customer)id varchar(7) not null, product_id varchar(7) not null, quantity int not null, total_price int not null, order_date date not null, order_status varchar(15) not null, payment_mode varchar(15) not null, foreign key (customer_id) references customer(customer_id), foreign key (product_id) references (product_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')id varchar(7) not null, product_id varchar(7) not null, quantity int not null, ' at line 1
mysql> create table orders (order_id varchar(7) not null primary key, customer_id varchar(7) not null, product_id varchar(7) not null, quantity int not null, total_price int not null, order_date date not null, order_status varchar(15) not null, payment_mode varchar(15) not null, foreign key (customer_id) references customer(customer_id), foreign key (product_id) references (product_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(product_id))' at line 1
mysql> create table orders (order_id varchar(7) not null primary key, customer_id varchar(7) not null, product_id varchar(7) not null, quantity int not null, total_price int not null, order_date date not null, order_status varchar(15) not null, payment_mode varchar(15) not null, foreign key (customer_id) references customer(customer_id), foreign key (product_id) references product(product_id));
Query OK, 0 rows affected (0.04 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| order_id     | varchar(7)  | NO   | PRI | NULL    |       |
| customer_id  | varchar(7)  | NO   | MUL | NULL    |       |
| product_id   | varchar(7)  | NO   | MUL | NULL    |       |
| quantity     | int         | NO   |     | NULL    |       |
| total_price  | int         | NO   |     | NULL    |       |
| order_date   | date        | NO   |     | NULL    |       |
| order_status | varchar(15) | NO   |     | NULL    |       |
| payment_mode | varchar(15) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> insert into orders values ('O101', 'C101', 'P101', 1, 75000, '2025-07-10', 'Delivered', 'Online'), ('O102', 'C102', 'P102', 2, 10998, '2025-07-09', 'Shipped', 'Cash'), ('O103', 'C103', 'P103', 3, 2850, '2025-07-08', 'Pending', 'UPI'), ('O104', 'C104', 'P104', 2, 998, '2025-07-07', 'Delivered', 'Card'), ('O105', 'C105', 'P105', 1, 1799, '2025-07-06', 'Cancelled', 'Online');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+-------------+------------+----------+-------------+------------+--------------+--------------+
| order_id | customer_id | product_id | quantity | total_price | order_date | order_status | payment_mode |
+----------+-------------+------------+----------+-------------+------------+--------------+--------------+
| O101     | C101        | P101       |        1 |       75000 | 2025-07-10 | Delivered    | Online       |
| O102     | C102        | P102       |        2 |       10998 | 2025-07-09 | Shipped      | Cash         |
| O103     | C103        | P103       |        3 |        2850 | 2025-07-08 | Pending      | UPI          |
| O104     | C104        | P104       |        2 |         998 | 2025-07-07 | Delivered    | Card         |
| O105     | C105        | P105       |        1 |        1799 | 2025-07-06 | Cancelled    | Online       |
+----------+-------------+------------+----------+-------------+------------+--------------+--------------+
5 rows in set (0.00 sec)

mysql>















