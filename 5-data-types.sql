--DATE AND TIME

mysql> -- DATE
mysql> USE new_testing_db;
ERROR 1049 (42000): Unknown database 'new_testing_db'
mysql> 
mysql> DROP TABLE IF EXISTS people;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> CREATE TABLE people(
    ->   name VARCHAR(100),
    ->   birthdate DATE,
    ->   birthtime TIME,
    ->   birthdt DATETIME
    -> );
Query OK, 0 rows affected (0.38 sec)

mysql> 
mysql> show tables;
+---------------------+
| Tables_in_book_shop |
+---------------------+
| books               |
| people              |
+---------------------+
2 rows in set (0.00 sec)

mysql> select * from people;
Empty set (0.00 sec)

mysql> describe people;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| name      | varchar(100) | YES  |     | NULL    |       |
| birthdate | date         | YES  |     | NULL    |       |
| birthtime | time         | YES  |     | NULL    |       |
| birthdt   | datetime     | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO people 
    ->   (name, birthdate, birthtime, birthdt)
    -> VALUES
    ->   ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
Query OK, 1 row affected (0.05 sec)

mysql> 
mysql> INSERT INTO people
    ->   (name, birthdate, birthtime, birthdt)
    -> VALUES
    ->   ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
Query OK, 1 row affected (0.06 sec)

mysql> 
mysql> INSERT INTO people
    ->   (name, birthdate, birthtime, birthdt)
    -> VALUES
    ->   ('Microwave', CURDATE(), CURTIME(), NOW());
Query OK, 1 row affected (0.13 sec)

mysql> 
mysql> select * from people;
+-----------+------------+-----------+---------------------+
| name      | birthdate  | birthtime | birthdt             |
+-----------+------------+-----------+---------------------+
| Padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry     | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
| Microwave | 2019-08-21 | 23:27:06  | 2019-08-21 23:27:06 |
+-----------+------------+-----------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT name, birthdate, DAY(birthdate) FROM people;
+-----------+------------+----------------+
| name      | birthdate  | DAY(birthdate) |
+-----------+------------+----------------+
| Padma     | 1983-11-11 |             11 |
| Larry     | 1943-12-25 |             25 |
| Microwave | 2019-08-21 |             21 |
+-----------+------------+----------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT name, birthdate, DAYNAME(birthdate) FROM people;
+-----------+------------+--------------------+
| name      | birthdate  | DAYNAME(birthdate) |
+-----------+------------+--------------------+
| Padma     | 1983-11-11 | Friday             |
| Larry     | 1943-12-25 | Saturday           |
| Microwave | 2019-08-21 | Wednesday          |
+-----------+------------+--------------------+
3 rows in set (0.01 sec)

mysql> SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
+-----------+------------+----------------------+
| name      | birthdate  | DAYOFWEEK(birthdate) |
+-----------+------------+----------------------+
| Padma     | 1983-11-11 |                    6 |
| Larry     | 1943-12-25 |                    7 |
| Microwave | 2019-08-21 |                    4 |
+-----------+------------+----------------------+
3 rows in set (0.00 sec)

mysql> SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
+-----------+------------+----------------------+
| name      | birthdate  | DAYOFYEAR(birthdate) |
+-----------+------------+----------------------+
| Padma     | 1983-11-11 |                  315 |
| Larry     | 1943-12-25 |                  359 |
| Microwave | 2019-08-21 |                  233 |
+-----------+------------+----------------------+
3 rows in set (0.00 sec)

mysql> SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
+-----------+---------------------+--------------------+
| name      | birthdt             | MONTHNAME(birthdt) |
+-----------+---------------------+--------------------+
| Padma     | 1983-11-11 10:07:35 | November           |
| Larry     | 1943-12-25 04:10:42 | December           |
| Microwave | 2019-08-21 23:27:06 | August             |
+-----------+---------------------+--------------------+
3 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W%M%Y');
+----------------------------------------------+
| DATE_FORMAT('2009-10-04 22:23:00', '%W%M%Y') |
+----------------------------------------------+
| SundayOctober2009                            |
+----------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT DATE_FORMAT(birthdt, '%W%M%Y') FROM people;
+--------------------------------+
| DATE_FORMAT(birthdt, '%W%M%Y') |
+--------------------------------+
| FridayNovember1983             |
| SaturdayDecember1943           |
| WednesdayAugust2019            |
+--------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(birthdt, 'was born on a %W') FROM people;
+------------------------------------------+
| DATE_FORMAT(birthdt, 'was born on a %W') |
+------------------------------------------+
| was born on a Friday                     |
| was born on a Saturday                   |
| was born on a Wednesday                  |
+------------------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
+-------------------------------------------+
| DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') |
+-------------------------------------------+
| 11/11/1983 at 10:07                       |
| 12/25/1943 at 04:10                       |
| 08/21/2019 at 11:27                       |
+-------------------------------------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- How many days ago when peopel were born
mysql> SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
+-----------+------------+----------------------------+
| name      | birthdate  | DATEDIFF(NOW(), birthdate) |
+-----------+------------+----------------------------+
| Padma     | 1983-11-11 |                      13067 |
| Larry     | 1943-12-25 |                      27633 |
| Microwave | 2019-08-21 |                          0 |
+-----------+------------+----------------------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
+---------------------+-------------------------------------+
| birthdt             | DATE_ADD(birthdt, INTERVAL 1 MONTH) |
+---------------------+-------------------------------------+
| 1983-11-11 10:07:35 | 1983-12-11 10:07:35                 |
| 1943-12-25 04:10:42 | 1944-01-25 04:10:42                 |
| 2019-08-21 23:27:06 | 2019-09-21 23:27:06                 |
+---------------------+-------------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
+---------------------+------------------------------------------------+
| birthdt             | birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR |
+---------------------+------------------------------------------------+
| 1983-11-11 10:07:35 | 1985-02-11 20:07:35                            |
| 1943-12-25 04:10:42 | 1945-03-25 14:10:42                            |
| 2019-08-21 23:27:06 | 2020-11-22 09:27:06                            |
+---------------------+------------------------------------------------+
3 rows in set (0.00 sec)

--NUMBERS

mysql> USE new_testing_db;
ERROR 1049 (42000): Unknown database 'new_testing_db'
mysql> 
mysql> DROP TABLE IF EXISTS items;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> -- DECIMAL
mysql> 
mysql> CREATE TABLE items (
    ->   price DECIMAL(5,2)
    -> );
Query OK, 0 rows affected (0.32 sec)

mysql> 
mysql> INSERT INTO items (price) VALUES (7);
Query OK, 1 row affected (0.09 sec)

mysql> INSERT INTO items (price) VALUES (7987654);
ERROR 1264 (22003): Out of range value for column 'price' at row 1
mysql> INSERT INTO items (price) VALUES (34.88);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO items (price) VALUES (298.9999);

Query OK, 1 row affected, 1 warning (0.13 sec)

mysql> INSERT INTO items (price) VALUES (1.9999);
Query OK, 1 row affected, 1 warning (0.04 sec)

mysql> 
mysql> SELECT * FROM items;
+--------+
| price  |
+--------+
|   7.00 |
|  34.88 |
| 299.00 |
|   2.00 |
+--------+
4 rows in set (0.01 sec)

mysql> 
mysql> -- FLOAT and DOUBLE
mysql> 
mysql> DROP TABLE IF EXISTS thingies;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> CREATE TABLE thingies (
    ->   price FLOAT
    -> );
Query OK, 0 rows affected (0.32 sec)

mysql> 
mysql> -- These values are fine
mysql> INSERT INTO thingies (price) VALUES (88.45);
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO thingies (price) VALUES (8877.45);
Query OK, 1 row affected (0.05 sec)

mysql> 
mysql> -- But, with this value, 8877670000 will be stored instead of it.
mysql> -- FLOAT has precision issues with much more than ~ 7 digits
mysql> -- DOUBLE has precision issues with much more than ~ 15 digits
mysql> INSERT INTO thingies (price) VALUES (8877665544.45);
Query OK, 1 row affected (0.05 sec)

mysql> 
mysql> SELECT * FROM thingies;
+------------+
| price      |
+------------+
|      88.45 |
|    8877.45 |
| 8877670000 |
+------------+
3 rows in set (0.00 sec)


