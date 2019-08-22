-- CREATE TABLE CUSTOMERS ORDERS

mysql> DROP TABLE IF EXISTS customers, orders;
Query OK, 0 rows affected, 2 warnings (0.00 sec)

mysql> 
mysql> CREATE TABLE customers (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   first_name VARCHAR(100),
    ->   last_name VARCHAR(100),
    ->   email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.33 sec)

mysql> 
mysql> CREATE TABLE orders (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   order_date DATE,
    ->   amount DECIMAL(8, 2),
    ->   customer_id INT,
    ->   FOREIGN KEY (customer_id) REFERENCES customers(id)
    ->   ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.49 sec)

mysql> 
mysql> INSERT INTO customers (first_name, last_name, email)
    -> VALUES  ('Boy', 'George', 'george@gmail.com'),
    ->         ('George', 'Michael', 'gm@gmail.com'),
    ->         ('David', 'Bowie', 'david@gmail.com'),
    ->         ('Blue', 'Steele', 'blue@gmail.com'),
    ->         ('Bette', 'Davis', 'bette@aol.com');
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO orders (order_date, amount, customer_id)
    -> VALUES  ('2016/02/10', 99.99, 1),
    ->         ('2017/11/11', 35.50, 1),
    ->         ('2014/12/12', 800.67, 2),
    ->         ('2015/01/03', 12.50, 2),
    ->         ('1999/04/11', 450.25, 5);
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> show tables;
+---------------------+
| Tables_in_book_shop |
+---------------------+
| books               |
| comments            |
| comments2           |
| customers           |
| inventory           |
| items               |
| orders              |
| people              |
| thingies            |
+---------------------+
9 rows in set (0.00 sec)

mysql> select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT first_name, last_name, order_date, amount,email FROM customers, orders WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+------------------+
| first_name | last_name | order_date | amount | email            |
+------------+-----------+------------+--------+------------------+
| Boy        | George    | 2016-02-10 |  99.99 | george@gmail.com |
| Boy        | George    | 2017-11-11 |  35.50 | george@gmail.com |
| George     | Michael   | 2014-12-12 | 800.67 | gm@gmail.com     |
| George     | Michael   | 2015-01-03 |  12.50 | gm@gmail.com     |
| Bette      | Davis     | 1999-04-11 | 450.25 | bette@aol.com    |
+------------+-----------+------------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT first_name, last_name, order_date, amount,email,id FROM customers, orders WHERE customers.id = orders.customer_id;
ERROR 1052 (23000): Column 'id' in field list is ambiguous
mysql> SELECT first_name, last_name, order_date, amount,email FROM customers, orders WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+------------------+
| first_name | last_name | order_date | amount | email            |
+------------+-----------+------------+--------+------------------+
| Boy        | George    | 2016-02-10 |  99.99 | george@gmail.com |
| Boy        | George    | 2017-11-11 |  35.50 | george@gmail.com |
| George     | Michael   | 2014-12-12 | 800.67 | gm@gmail.com     |
| George     | Michael   | 2015-01-03 |  12.50 | gm@gmail.com     |
| Bette      | Davis     | 1999-04-11 | 450.25 | bette@aol.com    |
+------------+-----------+------------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT first_name, last_name, order_date, amount,email,customer_id FROM customers, orders WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+------------------+-------------+
| first_name | last_name | order_date | amount | email            | customer_id |
+------------+-----------+------------+--------+------------------+-------------+
| Boy        | George    | 2016-02-10 |  99.99 | george@gmail.com |           1 |
| Boy        | George    | 2017-11-11 |  35.50 | george@gmail.com |           1 |
| George     | Michael   | 2014-12-12 | 800.67 | gm@gmail.com     |           2 |
| George     | Michael   | 2015-01-03 |  12.50 | gm@gmail.com     |           2 |
| Bette      | Davis     | 1999-04-11 | 450.25 | bette@aol.com    |           5 |
+------------+-----------+------------+--------+------------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT first_name, last_name, order_date, amount 
    -> FROM customers
    -> LEFT JOIN orders
    -> ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| David      | Bowie     | NULL       |   NULL |
| Blue       | Steele    | NULL       |   NULL |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+
7 rows in set (0.00 sec)

mysql> SELECT 
    ->   first_name,
    ->   last_name,
    ->   IFNULL(SUM(amount), 0) AS total_spent
    -> FROM customers
    -> LEFT JOIN orders
    -> ON customers.id = orders.customer_id
    -> GROUP BY customers.id
    -> ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
| David      | Bowie     |        0.00 |
| Blue       | Steele    |        0.00 |
+------------+-----------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT 
    ->   first_name,
    ->   last_name,
    ->   IFNULL(SUM(amount), 0) AS total_spent
    -> FROM customers
    -> LEFT JOIN orders
    -> ON customers.id = orders.customer_id
    -> GROUP BY customers.id
    -> ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
| David      | Bowie     |        0.00 |
| Blue       | Steele    |        0.00 |
+------------+-----------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT                                                                                                                                   ->   first_name,
    ->   last_name,
    ->   amount
    -> FROM customers
    -> LEFT JOIN orders
    -> ON customers.id = orders.customer_id
    -> GROUP BY customers.id
    -> ORDER BY total_spent DESC;
ERROR 1054 (42S22): Unknown column 'total_spent' in 'order clause'
mysql> SELECT 
    ->   first_name,
    ->   last_name,
    ->   SUM(amount) as total_spent
    -> FROM customers
    -> LEFT JOIN orders
    -> ON customers.id = orders.customer_id
    -> GROUP BY customers.id
    -> ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
| David      | Bowie     |        NULL |
| Blue       | Steele    |        NULL |
+------------+-----------+-------------+

