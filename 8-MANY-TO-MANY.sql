--MANY TO MANY RELATIONSHIPS
> DROP TABLE IF EXISTS reviews, reviewers, series;
Query OK, 0 rows affected, 3 warnings (0.01 sec)

mysql> 
mysql> CREATE TABLE reviewers (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   first_name VARCHAR(100),
    ->   last_name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.54 sec)

mysql> 
mysql> CREATE TABLE series (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   title VARCHAR(200),
    ->   released_year YEAR(4),
    ->   genre VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.34 sec)

mysql> 
mysql> CREATE TABLE reviews (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   rating DECIMAL(2,1),
    ->   series_id INT,
    ->   reviewer_id INT,
    ->   FOREIGN KEY (series_id) REFERENCES series(id),
    ->   FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
    -> );
Query OK, 0 rows affected (0.49 sec)

mysql> 
mysql> INSERT INTO series (title, released_year, genre) VALUES
    ->     ('Archer', 2009, 'Animation'),
    ->     ('Arrested Development', 2003, 'Comedy'),
    ->     ("Bob's Burgers", 2011, 'Animation'),
    ->     ('Bojack Horseman', 2014, 'Animation'),
    ->     ("Breaking Bad", 2008, 'Drama'),
    ->     ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ->     ("Fargo", 2014, 'Drama'),
    ->     ('Freaks and Geeks', 1999, 'Comedy'),
    ->     ('General Hospital', 1963, 'Drama'),
    ->     ('Halt and Catch Fire', 2014, 'Drama'),
    ->     ('Malcolm In The Middle', 2000, 'Comedy'),
    ->     ('Pushing Daisies', 2007, 'Comedy'),
    ->     ('Seinfeld', 1989, 'Comedy'),
    ->     ('Stranger Things', 2016, 'Drama');
Query OK, 14 rows affected (0.08 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql>  
mysql>  
mysql> INSERT INTO reviewers (first_name, last_name) VALUES
    ->     ('Thomas', 'Stoneman'),
    ->     ('Wyatt', 'Skaggs'),
    ->     ('Kimbra', 'Masters'),
    ->     ('Domingo', 'Cortes'),
    ->     ('Colt', 'Steele'),
    ->     ('Pinkie', 'Petit'),
    ->     ('Marlon', 'Crafford');
Query OK, 7 rows affected (0.08 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    ->     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    ->     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    ->     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    ->     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    ->     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    ->     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    ->     (7,2,9.1),(7,5,9.7),
    ->     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    ->     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    ->     (10,5,9.9),
    ->     (13,3,8.0),(13,4,7.2),
    ->     (14,2,8.5),(14,3,8.9),(14,4,8.9);
Query OK, 47 rows affected (0.13 sec)
Records: 47  Duplicates: 0  Warnings: 0

mysql> SELECT series.id, title, rating
    -> FROM series
    -> INNER JOIN reviews
    -> ON series.id = reviews.series_id;
+----+----------------------+--------+
| id | title                | rating |
+----+----------------------+--------+
|  1 | Archer               |    8.0 |
|  1 | Archer               |    7.5 |
|  1 | Archer               |    8.5 |
|  1 | Archer               |    7.7 |
|  1 | Archer               |    8.9 |
|  2 | Arrested Development |    8.1 |
|  2 | Arrested Development |    6.0 |
|  2 | Arrested Development |    8.0 |
|  2 | Arrested Development |    8.4 |
|  2 | Arrested Development |    9.9 |
|  3 | Bob's Burgers        |    7.0 |
|  3 | Bob's Burgers        |    7.5 |
|  3 | Bob's Burgers        |    8.0 |
|  3 | Bob's Burgers        |    7.1 |
|  3 | Bob's Burgers        |    8.0 |
|  4 | Bojack Horseman      |    7.5 |
|  4 | Bojack Horseman      |    7.8 |
|  4 | Bojack Horseman      |    8.3 |
|  4 | Bojack Horseman      |    7.6 |
|  4 | Bojack Horseman      |    8.5 |
|  5 | Breaking Bad         |    9.5 |
|  5 | Breaking Bad         |    9.0 |
|  5 | Breaking Bad         |    9.1 |
|  5 | Breaking Bad         |    9.3 |
|  5 | Breaking Bad         |    9.9 |
|  6 | Curb Your Enthusiasm |    6.5 |
|  6 | Curb Your Enthusiasm |    7.8 |
|  6 | Curb Your Enthusiasm |    8.8 |
|  6 | Curb Your Enthusiasm |    8.4 |
|  6 | Curb Your Enthusiasm |    9.1 |
|  7 | Fargo                |    9.1 |
|  7 | Fargo                |    9.7 |
|  8 | Freaks and Geeks     |    8.5 |
|  8 | Freaks and Geeks     |    7.8 |
|  8 | Freaks and Geeks     |    8.8 |
|  8 | Freaks and Geeks     |    9.3 |
|  9 | General Hospital     |    5.5 |
|  9 | General Hospital     |    6.8 |
|  9 | General Hospital     |    5.8 |
|  9 | General Hospital     |    4.3 |
|  9 | General Hospital     |    4.5 |
| 10 | Halt and Catch Fire  |    9.9 |
| 13 | Seinfeld             |    8.0 |
| 13 | Seinfeld             |    7.2 |
| 14 | Stranger Things      |    8.5 |
| 14 | Stranger Things      |    8.9 |
| 14 | Stranger Things      |    8.9 |
+----+----------------------+--------+
47 rows in set (0.00 sec)

mysql> SELECT
    ->   series.id,
    ->   title,
    ->   AVG(rating) AS avg_rating
    -> FROM series
    -> INNER JOIN reviews
    ->   ON series.id = reviews.series_id
    -> GROUP BY series.id
    -> ORDER BY avg_rating;
+----+----------------------+------------+
| id | title                | avg_rating |
+----+----------------------+------------+
|  9 | General Hospital     |    5.38000 |
|  3 | Bob's Burgers        |    7.52000 |
| 13 | Seinfeld             |    7.60000 |
|  4 | Bojack Horseman      |    7.94000 |
|  2 | Arrested Development |    8.08000 |
|  1 | Archer               |    8.12000 |
|  6 | Curb Your Enthusiasm |    8.12000 |
|  8 | Freaks and Geeks     |    8.60000 |
| 14 | Stranger Things      |    8.76667 |
|  5 | Breaking Bad         |    9.36000 |
|  7 | Fargo                |    9.40000 |
| 10 | Halt and Catch Fire  |    9.90000 |
+----+----------------------+------------+
12 rows in set (0.00 sec)

mysql> SELECT   series.id,   title,   AVG(rating) AS avg_rating FROM series INNER JOIN reviews   ON series.id = reviews.series_id GROUP BY series.id ORDER BY avg_rating,id;
+----+----------------------+------------+
| id | title                | avg_rating |
+----+----------------------+------------+
|  9 | General Hospital     |    5.38000 |
|  3 | Bob's Burgers        |    7.52000 |
| 13 | Seinfeld             |    7.60000 |
|  4 | Bojack Horseman      |    7.94000 |
|  2 | Arrested Development |    8.08000 |
|  1 | Archer               |    8.12000 |
|  6 | Curb Your Enthusiasm |    8.12000 |
|  8 | Freaks and Geeks     |    8.60000 |
| 14 | Stranger Things      |    8.76667 |
|  5 | Breaking Bad         |    9.36000 |
|  7 | Fargo                |    9.40000 |
| 10 | Halt and Catch Fire  |    9.90000 |
+----+----------------------+------------+
12 rows in set (0.00 sec)

mysql> SELECT   series.id,   title,   AVG(rating) AS avg_rating FROM series INNER JOIN reviews   ON series.id = reviews.series_id GROUP BY series.id ORDER BY id;
+----+----------------------+------------+
| id | title                | avg_rating |
+----+----------------------+------------+
|  1 | Archer               |    8.12000 |
|  2 | Arrested Development |    8.08000 |
|  3 | Bob's Burgers        |    7.52000 |
|  4 | Bojack Horseman      |    7.94000 |
|  5 | Breaking Bad         |    9.36000 |
|  6 | Curb Your Enthusiasm |    8.12000 |
|  7 | Fargo                |    9.40000 |
|  8 | Freaks and Geeks     |    8.60000 |
|  9 | General Hospital     |    5.38000 |
| 10 | Halt and Catch Fire  |    9.90000 |
| 13 | Seinfeld             |    7.60000 |
| 14 | Stranger Things      |    8.76667 |
+----+----------------------+------------+
12 rows in set (0.00 sec)

mysql> SELECT
    ->   first_name,
    ->   last_name,
    ->   rating
    -> FROM reviewers JOIN reviews
    ->   ON reviewers.id = reviews.reviewer_id;
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
| Wyatt      | Skaggs    |    9.1 |
| Wyatt      | Skaggs    |    7.8 |
| Wyatt      | Skaggs    |    5.5 |
| Wyatt      | Skaggs    |    8.5 |
| Kimbra     | Masters   |    8.5 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    7.1 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    9.0 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    6.8 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    8.9 |
| Domingo    | Cortes    |    7.7 |
| Domingo    | Cortes    |    6.0 |
| Domingo    | Cortes    |    8.0 |
| Domingo    | Cortes    |    8.3 |
| Domingo    | Cortes    |    9.1 |
| Domingo    | Cortes    |    8.8 |
| Domingo    | Cortes    |    8.5 |
| Domingo    | Cortes    |    5.8 |
| Domingo    | Cortes    |    7.2 |
| Domingo    | Cortes    |    8.9 |
| Colt       | Steele    |    8.9 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    8.0 |
| Colt       | Steele    |    8.5 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    9.1 |
| Colt       | Steele    |    9.7 |
| Colt       | Steele    |    9.3 |
| Colt       | Steele    |    4.5 |
| Colt       | Steele    |    9.9 |
| Pinkie     | Petit     |    8.4 |
| Pinkie     | Petit     |    7.5 |
| Pinkie     | Petit     |    8.8 |
| Pinkie     | Petit     |    4.3 |
+------------+-----------+--------+
47 rows in set (0.01 sec)

mysql> SELECT
    ->   title AS 'unreviewed_series'
    -> FROM series
    -> LEFT JOIN reviews
    ->   ON series.id = reviews.series_id
    -> WHERE rating IS NULL;
+-----------------------+
| unreviewed_series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+
2 rows in set (0.00 sec)

mysql> SELECT   title AS 'unreviewed_series' FROM series LEFT JOIN reviews   ON series.id = reviews.series_id;
+-----------------------+
| unreviewed_series     |
+-----------------------+
| Archer                |
| Archer                |
| Archer                |
| Archer                |
| Archer                |
| Arrested Development  |
| Arrested Development  |
| Arrested Development  |
| Arrested Development  |
| Arrested Development  |
| Bob's Burgers         |
| Bob's Burgers         |
| Bob's Burgers         |
| Bob's Burgers         |
| Bob's Burgers         |
| Bojack Horseman       |
| Bojack Horseman       |
| Bojack Horseman       |
| Bojack Horseman       |
| Bojack Horseman       |
| Breaking Bad          |
| Breaking Bad          |
| Breaking Bad          |
| Breaking Bad          |
| Breaking Bad          |
| Curb Your Enthusiasm  |
| Curb Your Enthusiasm  |
| Curb Your Enthusiasm  |
| Curb Your Enthusiasm  |
| Curb Your Enthusiasm  |
| Fargo                 |
| Fargo                 |
| Freaks and Geeks      |
| Freaks and Geeks      |
| Freaks and Geeks      |
| Freaks and Geeks      |
| General Hospital      |
| General Hospital      |
| General Hospital      |
| General Hospital      |
| General Hospital      |
| Halt and Catch Fire   |
| Malcolm In The Middle |
| Pushing Daisies       |
| Seinfeld              |
| Seinfeld              |
| Stranger Things       |
| Stranger Things       |
| Stranger Things       |
+-----------------------+
49 rows in set (0.00 sec)

mysql> SELECT  ratings,  title AS 'unreviewed_series' FROM series LEFT JOIN reviews   ON series.id = reviews.series_id;
ERROR 1054 (42S22): Unknown column 'ratings' in 'field list'
mysql> SELECT  rating,  title AS 'unreviewed_series' FROM series LEFT JOIN reviews   ON series.id = reviews.series_id;
+--------+-----------------------+
| rating | unreviewed_series     |
+--------+-----------------------+
|    8.0 | Archer                |
|    7.5 | Archer                |
|    8.5 | Archer                |
|    7.7 | Archer                |
|    8.9 | Archer                |
|    8.1 | Arrested Development  |
|    6.0 | Arrested Development  |
|    8.0 | Arrested Development  |
|    8.4 | Arrested Development  |
|    9.9 | Arrested Development  |
|    7.0 | Bob's Burgers         |
|    7.5 | Bob's Burgers         |
|    8.0 | Bob's Burgers         |
|    7.1 | Bob's Burgers         |
|    8.0 | Bob's Burgers         |
|    7.5 | Bojack Horseman       |
|    7.8 | Bojack Horseman       |
|    8.3 | Bojack Horseman       |
|    7.6 | Bojack Horseman       |
|    8.5 | Bojack Horseman       |
|    9.5 | Breaking Bad          |
|    9.0 | Breaking Bad          |
|    9.1 | Breaking Bad          |
|    9.3 | Breaking Bad          |
|    9.9 | Breaking Bad          |
|    6.5 | Curb Your Enthusiasm  |
|    7.8 | Curb Your Enthusiasm  |
|    8.8 | Curb Your Enthusiasm  |
|    8.4 | Curb Your Enthusiasm  |
|    9.1 | Curb Your Enthusiasm  |
|    9.1 | Fargo                 |
|    9.7 | Fargo                 |
|    8.5 | Freaks and Geeks      |
|    7.8 | Freaks and Geeks      |
|    8.8 | Freaks and Geeks      |
|    9.3 | Freaks and Geeks      |
|    5.5 | General Hospital      |
|    6.8 | General Hospital      |
|    5.8 | General Hospital      |
|    4.3 | General Hospital      |
|    4.5 | General Hospital      |
|    9.9 | Halt and Catch Fire   |
|   NULL | Malcolm In The Middle |
|   NULL | Pushing Daisies       |
|    8.0 | Seinfeld              |
|    7.2 | Seinfeld              |
|    8.5 | Stranger Things       |
|    8.9 | Stranger Things       |
|    8.9 | Stranger Things       |
+--------+-----------------------+
49 rows in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   genre,
    ->   ROUND(AVG(rating), 2) AS avg_rating
    -> FROM series 
    -> INNER JOIN reviews
    ->   ON series.id = reviews.series_id
    -> GROUP BY genre;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Comedy    |       8.16 |
| Drama     |       8.04 |
+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->   genre,
    ->   ROUND(AVG(rating), 2) AS avg_rating
    -> FROM series 
    -> INNER JOIN reviews
    ->   ON series.id = reviews.series_id
    -> GROUP BY genre;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Comedy    |       8.16 |
| Drama     |       8.04 |
+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->   reviewers.id,
    ->   first_name,
    ->   last_name,
    ->   COUNT(rating) AS COUNT,
    ->   IFNULL(MIN(rating), 0) AS MIN,
    ->   IFNULL(MAX(rating), 0) AS MAX,
    ->   ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
    ->   IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS STATUS
    -> FROM reviewers
    -> LEFT JOIN reviews
    ->   ON reviewers.id = reviews.reviewer_id
    -> GROUP BY reviewers.id;
+----+------------+-----------+-------+-----+-----+------+----------+
| id | first_name | last_name | COUNT | MIN | MAX | AVG  | STATUS   |
+----+------------+-----------+-------+-----+-----+------+----------+
|  1 | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02 | ACTIVE   |
|  2 | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80 | ACTIVE   |
|  3 | Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.99 | ACTIVE   |
|  4 | Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83 | ACTIVE   |
|  5 | Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77 | ACTIVE   |
|  6 | Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25 | ACTIVE   |
|  7 | Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00 | INACTIVE |
+----+------------+-----------+-------+-----+-----+------+----------+
7 rows in set (0.00 sec)

mysql> SELECT
    ->   title,
    ->   rating,
    ->   CONCAT(first_name, ' ', last_name) AS reviewer
    -> FROM reviewers
    -> INNER JOIN reviews
    ->   ON reviewers.id = reviews.reviewer_id
    -> INNER JOIN series
    ->   ON series.id = reviews.series_id;
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Arrested Development |    8.1 | Thomas Stoneman |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bojack Horseman      |    7.5 | Thomas Stoneman |
| Breaking Bad         |    9.5 | Thomas Stoneman |
| Archer               |    7.5 | Wyatt Skaggs    |
| Bojack Horseman      |    7.6 | Wyatt Skaggs    |
| Breaking Bad         |    9.3 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
| Fargo                |    9.1 | Wyatt Skaggs    |
| Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
| General Hospital     |    5.5 | Wyatt Skaggs    |
| Stranger Things      |    8.5 | Wyatt Skaggs    |
| Archer               |    8.5 | Kimbra Masters  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bojack Horseman      |    7.8 | Kimbra Masters  |
| Breaking Bad         |    9.0 | Kimbra Masters  |
| Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
| General Hospital     |    6.8 | Kimbra Masters  |
| Seinfeld             |    8.0 | Kimbra Masters  |
| Stranger Things      |    8.9 | Kimbra Masters  |
| Archer               |    7.7 | Domingo Cortes  |
| Arrested Development |    6.0 | Domingo Cortes  |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bojack Horseman      |    8.3 | Domingo Cortes  |
| Breaking Bad         |    9.1 | Domingo Cortes  |
| Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
| Freaks and Geeks     |    8.5 | Domingo Cortes  |
| General Hospital     |    5.8 | Domingo Cortes  |
| Seinfeld             |    7.2 | Domingo Cortes  |
| Stranger Things      |    8.9 | Domingo Cortes  |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    9.9 | Colt Steele     |
| Bob's Burgers        |    8.0 | Colt Steele     |
| Bojack Horseman      |    8.5 | Colt Steele     |
| Breaking Bad         |    9.9 | Colt Steele     |
| Curb Your Enthusiasm |    9.1 | Colt Steele     |
| Fargo                |    9.7 | Colt Steele     |
| Freaks and Geeks     |    9.3 | Colt Steele     |
| General Hospital     |    4.5 | Colt Steele     |
| Halt and Catch Fire  |    9.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Freaks and Geeks     |    8.8 | Pinkie Petit    |
| General Hospital     |    4.3 | Pinkie Petit    |
+----------------------+--------+-----------------+
47 rows in set (0.00 sec)

mysql> describe photos;
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| id         | int(11)      | NO   | PRI | NULL              | auto_increment |
| image_url  | varchar(255) | NO   |     | NULL              |                |
| user_id    | int(11)      | NO   | MUL | NULL              |                |
| created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+
4 rows in set (0.00 sec)

mysql> describe likes;
+------------+-----------+------+-----+-------------------+-------+
| Field      | Type      | Null | Key | Default           | Extra |
+------------+-----------+------+-----+-------------------+-------+
| user_id    | int(11)   | NO   | PRI | NULL              |       |
| photo_id   | int(11)   | NO   | PRI | NULL              |       |
| created_at | timestamp | NO   |     | CURRENT_TIMESTAMP |       |
+------------+-----------+------+-----+-------------------+-------+
3 rows in set (0.00 sec)

mysql> describe users;
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| id         | int(11)      | NO   | PRI | NULL              | auto_increment |
| username   | varchar(255) | NO   | UNI | NULL              |                |
| created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->   username,
    ->   likes.photo_id,
    ->   COUNT(likes.photo_id) AS 'total_likes'
    -> FROM photos
    -> JOIN users
    ->   ON photos.user_id = users.id 
    -> JOIN likes
    ->   ON photos.id = likes.photo_id
    -> GROUP BY likes.photo_id
    -> ORDER BY total_likes DESC
    -> LIMIT 1;
+---------------+----------+-------------+
| username      | photo_id | total_likes |
+---------------+----------+-------------+
| Zack_Kemmer93 |      145 |          48 |
+---------------+----------+-------------+
1 row in set (0.01 sec)

mysql> SELECT   username,   likes.photo_id,   COUNT(likes.photo_id) AS 'total_likes' FROM photos JOIN users   ON photos.user_id = users.id  JOIN likes   ON photos.id = likes.photo_id GROUP BY likes.photo_id ORDER BY total_likes ASC LIMIT 1;
+---------------+----------+-------------+
| username      | photo_id | total_likes |
+---------------+----------+-------------+
| Kenton_Kirlin |        1 |          25 |
+---------------+----------+-------------+
1 row in set (0.01 sec)

mysql> SELECT   username,   likes.photo_id,   COUNT(likes.photo_id) AS 'total_likes' FROM photos JOIN users   ON photos.user_id = users.id  JOIN likes   ON photos.id = likes.photo_id GROUP BY likes.photo_id ORDER BY total_likes ASC;
+-----------------------+----------+-------------+
| username              | photo_id | total_likes |
+-----------------------+----------+-------------+
| Kenton_Kirlin         |        1 |          25 |
| Delfina_VonRueden68   |      223 |          25 |
| Kathryn80             |      195 |          26 |
| Andre_Purdy85         |        8 |          27 |
| Billy52               |       50 |          27 |
| Mariano_Koch3         |      139 |          27 |
| Clint27               |      238 |          27 |
| Aiyana_Hoeger         |       95 |          28 |
| Keenan.Schamberger60  |      247 |          28 |
| Tabitha_Schamberger11 |       22 |          28 |
| Tomas.Beatty93        |      251 |          28 |
| Elenor88              |      175 |          28 |
| Jordyn.Jacobson2      |      108 |          29 |
| Annalise.McKenzie16   |       51 |          29 |
| Harley_Lind18         |       12 |          29 |
| Kathryn80             |      194 |          29 |
| Harrison.Beatty50     |      129 |          29 |
| Jaime53               |       92 |          29 |
| Harrison.Beatty50     |      130 |          29 |
| Justina.Gaylord27     |       33 |          29 |
| Delfina_VonRueden68   |      215 |          29 |
| Gerard79              |      135 |          29 |
| Harrison.Beatty50     |      131 |          29 |
| Katarina.Dibbert      |      208 |          29 |
| Milford_Gleichner42   |      214 |          29 |
| Cesar93               |      165 |          29 |
| Emilio_Bernier52      |      188 |          30 |
| Harley_Lind18         |       10 |          30 |
| Adelle96              |      184 |          30 |
| Florence99            |      179 |          30 |
| Kathryn80             |      193 |          30 |
| Billy52               |       47 |          30 |
| Frederik_Rice         |      240 |          30 |
| Delfina_VonRueden68   |      216 |          30 |
| Harrison.Beatty50     |      132 |          30 |
| Clint27               |      236 |          30 |
| Gus93                 |       26 |          30 |
| Zack_Kemmer93         |      143 |          30 |
| Emilio_Bernier52      |      187 |          31 |
| Kathryn80             |      191 |          31 |
| Colten.Harris76       |      207 |          31 |
| Dereck65              |       38 |          31 |
| Nicole71              |      246 |          31 |
| Sam52                 |      167 |          31 |
| Andre_Purdy85         |        9 |          31 |
| Clint27               |      228 |          31 |
| Aurelie71             |      156 |          31 |
| Frederik_Rice         |      239 |          31 |
| Dario77               |       83 |          31 |
| Alek_Watsica          |      254 |          31 |
| Annalise.McKenzie16   |       54 |          31 |
| Janet.Armstrong       |      115 |          31 |
| Presley_McClure       |       31 |          31 |
| Yvette.Gottlieb91     |      104 |          31 |
| Cesar93               |      159 |          31 |
| Donald.Fritsch        |      202 |          31 |
| Cesar93               |      160 |          31 |
| Tomas.Beatty93        |      250 |          31 |
| Gus93                 |       27 |          31 |
| Kaley9                |       93 |          31 |
| Eveline95             |       73 |          31 |
| Rick29                |      224 |          31 |
| Kenton_Kirlin         |        5 |          31 |
| Travon.Waters         |       18 |          31 |
| Andre_Purdy85         |        6 |          31 |
| Hailee26              |       60 |          32 |
| Sam52                 |      168 |          32 |
| Clint27               |      229 |          32 |
| Jaime53               |       89 |          32 |
| Josianne.Friesen      |       76 |          32 |
| Alek_Watsica          |      253 |          32 |
| Justina.Gaylord27     |       34 |          32 |
| Justina.Gaylord27     |       35 |          32 |
| Delfina_VonRueden68   |      218 |          32 |
| Zack_Kemmer93         |      142 |          32 |
| Clint27               |      237 |          32 |
| Delfina_VonRueden68   |      219 |          32 |
| Elenor88              |      172 |          32 |
| Irwin.Larson          |       96 |          32 |
| Maya.Farrell          |      114 |          32 |
| Aurelie71             |      151 |          32 |
| Cesar93               |      164 |          32 |
| Nicole71              |      245 |          33 |
| Jordyn.Jacobson2      |      109 |          33 |
| Harley_Lind18         |       11 |          33 |
| Jaime53               |       88 |          33 |
| Josianne.Friesen      |       75 |          33 |
| Malinda_Streich       |      125 |          33 |
| Willie_Leuschke       |      242 |          33 |
| Adelle96              |      185 |          33 |
| Eveline95             |       65 |          33 |
| Seth46                |      122 |          33 |
| Peter.Stehr0          |      148 |          33 |
| Alek_Watsica          |      255 |          33 |
| Cesar93               |      157 |          33 |
| Mariano_Koch3         |      140 |          33 |
| Presley_McClure       |       32 |          33 |
| Rafael.Hickle2        |      111 |          33 |
| Delfina_VonRueden68   |      220 |          33 |
| Eveline95             |       72 |          33 |
| Cesar93               |      163 |          33 |
| Gus93                 |       29 |          33 |
| Zack_Kemmer93         |      146 |          33 |
| Aurelie71             |      152 |          33 |
| Florence99            |      176 |          33 |
| Lennie_Hartmann40     |      105 |          33 |
| Rick29                |      226 |          33 |
| Jaime53               |       86 |          34 |
| Aurelie71             |      154 |          34 |
| Malinda_Streich       |      124 |          34 |
| Dereck65              |       39 |          34 |
| Eveline95             |       64 |          34 |
| Seth46                |      121 |          34 |
| Clint27               |      231 |          34 |
| Harrison.Beatty50     |      128 |          34 |
| Jaime53               |       91 |          34 |
| Josianne.Friesen      |       78 |          34 |
| Josianne.Friesen      |       79 |          34 |
| Mariano_Koch3         |      138 |          34 |
| Aracely.Johnston98    |      209 |          34 |
| Clint27               |      233 |          34 |
| Gerard79              |      134 |          34 |
| Keenan.Schamberger60  |      249 |          34 |
| Yvette.Gottlieb91     |      102 |          34 |
| Donald.Fritsch        |      200 |          34 |
| Eveline95             |       68 |          34 |
| Clint27               |      235 |          34 |
| Delfina_VonRueden68   |      217 |          34 |
| Mariano_Koch3         |      141 |          34 |
| Arely_Bogan63         |       15 |          34 |
| Eveline95             |       70 |          34 |
| Imani_Nicolas17       |      252 |          34 |
| Alexandro35           |       45 |          34 |
| Ressie_Stanton46      |      170 |          34 |
| Alexandro35           |       46 |          34 |
| Aurelie71             |      149 |          34 |
| Elenor88              |      173 |          34 |
| Delfina_VonRueden68   |      221 |          34 |
| Irwin.Larson          |       98 |          34 |
| Kaley9                |       94 |          34 |
| Eveline95             |       74 |          34 |
| Irwin.Larson          |       99 |          34 |
| Travon.Waters         |       20 |          35 |
| Norbert_Carroll35     |       55 |          35 |
| Malinda_Streich       |      126 |          35 |
| Willie_Leuschke       |      243 |          35 |
| Dario77               |       82 |          35 |
| Josianne.Friesen      |       77 |          35 |
| Billy52               |       48 |          35 |
| Mariano_Koch3         |      137 |          35 |
| Clint27               |      232 |          35 |
| Dario77               |       84 |          35 |
| Darwin29              |       80 |          35 |
| Eveline95             |       67 |          35 |
| Clint27               |      234 |          35 |
| Yvette.Gottlieb91     |      103 |          35 |
| Arely_Bogan63         |       14 |          35 |
| Cesar93               |      158 |          35 |
| Gerard79              |      136 |          35 |
| Janet.Armstrong       |      117 |          35 |
| Tabitha_Schamberger11 |       24 |          35 |
| Justina.Gaylord27     |       36 |          35 |
| Maya.Farrell          |      112 |          35 |
| Colten.Harris76       |      204 |          35 |
| Milford_Gleichner42   |      213 |          35 |
| Adelle96              |      181 |          35 |
| Travon.Waters         |       19 |          35 |
| Colten.Harris76       |      206 |          35 |
| Florence99            |      177 |          36 |
| Lennie_Hartmann40     |      106 |          36 |
| Cesar93               |      166 |          36 |
| Travon.Waters         |       21 |          36 |
| Erick5                |      190 |          36 |
| Norbert_Carroll35     |       56 |          36 |
| Jaime53               |       90 |          36 |
| Annalise.McKenzie16   |       53 |          36 |
| Odessa2               |       58 |          36 |
| Yvette.Gottlieb91     |      101 |          36 |
| Janet.Armstrong       |      116 |          36 |
| Tabitha_Schamberger11 |       25 |          36 |
| Kenton_Kirlin         |        2 |          36 |
| Maya.Farrell          |      113 |          36 |
| Ressie_Stanton46      |      171 |          36 |
| Alysa22               |      211 |          36 |
| Gus93                 |       28 |          36 |
| Javonte83             |      257 |          36 |
| Travon.Waters         |       17 |          36 |
| Delfina_VonRueden68   |      222 |          36 |
| Karley_Bosco          |      189 |          36 |
| Emilio_Bernier52      |      186 |          36 |
| Jaime53               |       85 |          36 |
| Florence99            |      178 |          37 |
| Jaime53               |       87 |          37 |
| Dereck65              |       40 |          37 |
| Seth46                |      120 |          37 |
| Clint27               |      230 |          37 |
| Norbert_Carroll35     |       57 |          37 |
| Billy52               |       49 |          37 |
| Donald.Fritsch        |      198 |          37 |
| Frederik_Rice         |      241 |          37 |
| Keenan.Schamberger60  |      248 |          37 |
| Alexandro35           |       42 |          37 |
| Alexandro35           |       43 |          37 |
| Granville_Kutch       |      133 |          37 |
| Arely_Bogan63         |       16 |          37 |
| Eveline95             |       71 |          37 |
| Colten.Harris76       |      203 |          37 |
| Alysa22               |      212 |          37 |
| Rick29                |      225 |          37 |
| Hailee26              |       59 |          37 |
| Adelle96              |      183 |          38 |
| Aurelie71             |      155 |          38 |
| Dario77               |       81 |          38 |
| Eveline95             |       63 |          38 |
| Dereck65              |       41 |          38 |
| Donald.Fritsch        |      197 |          38 |
| Aracely.Johnston98    |      210 |          38 |
| Tabitha_Schamberger11 |       23 |          38 |
| Eveline95             |       69 |          38 |
| Justina.Gaylord27     |       37 |          38 |
| Kenton_Kirlin         |        3 |          38 |
| Aurelie71             |      150 |          38 |
| Cesar93               |      162 |          38 |
| Kenton_Kirlin         |        4 |          38 |
| Jaylan.Lakin          |      196 |          38 |
| Jayson65              |      169 |          38 |
| Andre_Purdy85         |        7 |          38 |
| Rick29                |      227 |          39 |
| Florence99            |      180 |          39 |
| Yazmin_Mills95        |      107 |          39 |
| Yvette.Gottlieb91     |      100 |          39 |
| Eveline95             |       66 |          39 |
| Donald.Fritsch        |      199 |          39 |
| Kelsi26               |      110 |          39 |
| Donald.Fritsch        |      201 |          39 |
| Kenneth64             |       62 |          39 |
| Alexandro35           |       44 |          39 |
| Janet.Armstrong       |      118 |          39 |
| Janet.Armstrong       |      119 |          39 |
| Zack_Kemmer93         |      144 |          39 |
| Colten.Harris76       |      205 |          39 |
| Damon35               |      244 |          40 |
| Harley_Lind18         |       13 |          40 |
| Cesar93               |      161 |          40 |
| Irwin.Larson          |       97 |          40 |
| Aurelie71             |      153 |          40 |
| Delpha.Kihn           |       61 |          41 |
| Kathryn80             |      192 |          41 |
| Annalise.McKenzie16   |       52 |          41 |
| Presley_McClure       |       30 |          41 |
| Javonte83             |      256 |          41 |
| Elenor88              |      174 |          41 |
| Meggie_Doyle          |      147 |          41 |
| Seth46                |      123 |          42 |
| Malinda_Streich       |      127 |          43 |
| Adelle96              |      182 |          43 |
| Zack_Kemmer93         |      145 |          48 |
+-----------------------+----------+-------------+
257 rows in set (0.01 sec)

mysql> SELECT   username,   likes.photo_id,   COUNT(likes.photo_id) AS 'total_likes' FROM photos JOIN users   ON photos.user_id = users.id  JOIN likes   ON photos.id = likes.photo_id GROUP BY likes.photo_id ORDER BY total_likes DESC;
+-----------------------+----------+-------------+
| username              | photo_id | total_likes |
+-----------------------+----------+-------------+
| Zack_Kemmer93         |      145 |          48 |
| Malinda_Streich       |      127 |          43 |
| Adelle96              |      182 |          43 |
| Seth46                |      123 |          42 |
| Delpha.Kihn           |       61 |          41 |
| Kathryn80             |      192 |          41 |
| Annalise.McKenzie16   |       52 |          41 |
| Presley_McClure       |       30 |          41 |
| Javonte83             |      256 |          41 |
| Elenor88              |      174 |          41 |
| Meggie_Doyle          |      147 |          41 |
| Damon35               |      244 |          40 |
| Harley_Lind18         |       13 |          40 |
| Cesar93               |      161 |          40 |
| Irwin.Larson          |       97 |          40 |
| Aurelie71             |      153 |          40 |
| Rick29                |      227 |          39 |
| Florence99            |      180 |          39 |
| Yazmin_Mills95        |      107 |          39 |
| Yvette.Gottlieb91     |      100 |          39 |
| Eveline95             |       66 |          39 |
| Donald.Fritsch        |      199 |          39 |
| Kelsi26               |      110 |          39 |
| Donald.Fritsch        |      201 |          39 |
| Kenneth64             |       62 |          39 |
| Alexandro35           |       44 |          39 |
| Janet.Armstrong       |      118 |          39 |
| Janet.Armstrong       |      119 |          39 |
| Zack_Kemmer93         |      144 |          39 |
| Colten.Harris76       |      205 |          39 |
| Adelle96              |      183 |          38 |
| Aurelie71             |      155 |          38 |
| Dario77               |       81 |          38 |
| Eveline95             |       63 |          38 |
| Dereck65              |       41 |          38 |
| Donald.Fritsch        |      197 |          38 |
| Aracely.Johnston98    |      210 |          38 |
| Tabitha_Schamberger11 |       23 |          38 |
| Eveline95             |       69 |          38 |
| Justina.Gaylord27     |       37 |          38 |
| Kenton_Kirlin         |        3 |          38 |
| Aurelie71             |      150 |          38 |
| Cesar93               |      162 |          38 |
| Kenton_Kirlin         |        4 |          38 |
| Jaylan.Lakin          |      196 |          38 |
| Jayson65              |      169 |          38 |
| Andre_Purdy85         |        7 |          38 |
| Florence99            |      178 |          37 |
| Jaime53               |       87 |          37 |
| Dereck65              |       40 |          37 |
| Seth46                |      120 |          37 |
| Clint27               |      230 |          37 |
| Norbert_Carroll35     |       57 |          37 |
| Billy52               |       49 |          37 |
| Donald.Fritsch        |      198 |          37 |
| Frederik_Rice         |      241 |          37 |
| Keenan.Schamberger60  |      248 |          37 |
| Alexandro35           |       42 |          37 |
| Alexandro35           |       43 |          37 |
| Granville_Kutch       |      133 |          37 |
| Arely_Bogan63         |       16 |          37 |
| Eveline95             |       71 |          37 |
| Colten.Harris76       |      203 |          37 |
| Alysa22               |      212 |          37 |
| Rick29                |      225 |          37 |
| Hailee26              |       59 |          37 |
| Florence99            |      177 |          36 |
| Lennie_Hartmann40     |      106 |          36 |
| Cesar93               |      166 |          36 |
| Travon.Waters         |       21 |          36 |
| Erick5                |      190 |          36 |
| Norbert_Carroll35     |       56 |          36 |
| Jaime53               |       90 |          36 |
| Annalise.McKenzie16   |       53 |          36 |
| Odessa2               |       58 |          36 |
| Yvette.Gottlieb91     |      101 |          36 |
| Janet.Armstrong       |      116 |          36 |
| Tabitha_Schamberger11 |       25 |          36 |
| Kenton_Kirlin         |        2 |          36 |
| Maya.Farrell          |      113 |          36 |
| Ressie_Stanton46      |      171 |          36 |
| Alysa22               |      211 |          36 |
| Gus93                 |       28 |          36 |
| Javonte83             |      257 |          36 |
| Travon.Waters         |       17 |          36 |
| Delfina_VonRueden68   |      222 |          36 |
| Karley_Bosco          |      189 |          36 |
| Emilio_Bernier52      |      186 |          36 |
| Jaime53               |       85 |          36 |
| Travon.Waters         |       20 |          35 |
| Norbert_Carroll35     |       55 |          35 |
| Malinda_Streich       |      126 |          35 |
| Willie_Leuschke       |      243 |          35 |
| Dario77               |       82 |          35 |
| Josianne.Friesen      |       77 |          35 |
| Billy52               |       48 |          35 |
| Mariano_Koch3         |      137 |          35 |
| Clint27               |      232 |          35 |
| Dario77               |       84 |          35 |
| Darwin29              |       80 |          35 |
| Eveline95             |       67 |          35 |
| Clint27               |      234 |          35 |
| Yvette.Gottlieb91     |      103 |          35 |
| Arely_Bogan63         |       14 |          35 |
| Cesar93               |      158 |          35 |
| Gerard79              |      136 |          35 |
| Janet.Armstrong       |      117 |          35 |
| Tabitha_Schamberger11 |       24 |          35 |
| Justina.Gaylord27     |       36 |          35 |
| Maya.Farrell          |      112 |          35 |
| Colten.Harris76       |      204 |          35 |
| Milford_Gleichner42   |      213 |          35 |
| Adelle96              |      181 |          35 |
| Travon.Waters         |       19 |          35 |
| Colten.Harris76       |      206 |          35 |
| Jaime53               |       86 |          34 |
| Aurelie71             |      154 |          34 |
| Malinda_Streich       |      124 |          34 |
| Dereck65              |       39 |          34 |
| Eveline95             |       64 |          34 |
| Seth46                |      121 |          34 |
| Clint27               |      231 |          34 |
| Harrison.Beatty50     |      128 |          34 |
| Jaime53               |       91 |          34 |
| Josianne.Friesen      |       78 |          34 |
| Josianne.Friesen      |       79 |          34 |
| Mariano_Koch3         |      138 |          34 |
| Aracely.Johnston98    |      209 |          34 |
| Clint27               |      233 |          34 |
| Gerard79              |      134 |          34 |
| Keenan.Schamberger60  |      249 |          34 |
| Yvette.Gottlieb91     |      102 |          34 |
| Donald.Fritsch        |      200 |          34 |
| Eveline95             |       68 |          34 |
| Clint27               |      235 |          34 |
| Delfina_VonRueden68   |      217 |          34 |
| Mariano_Koch3         |      141 |          34 |
| Arely_Bogan63         |       15 |          34 |
| Eveline95             |       70 |          34 |
| Imani_Nicolas17       |      252 |          34 |
| Alexandro35           |       45 |          34 |
| Ressie_Stanton46      |      170 |          34 |
| Alexandro35           |       46 |          34 |
| Aurelie71             |      149 |          34 |
| Elenor88              |      173 |          34 |
| Delfina_VonRueden68   |      221 |          34 |
| Irwin.Larson          |       98 |          34 |
| Kaley9                |       94 |          34 |
| Eveline95             |       74 |          34 |
| Irwin.Larson          |       99 |          34 |
| Nicole71              |      245 |          33 |
| Jordyn.Jacobson2      |      109 |          33 |
| Harley_Lind18         |       11 |          33 |
| Jaime53               |       88 |          33 |
| Josianne.Friesen      |       75 |          33 |
| Malinda_Streich       |      125 |          33 |
| Willie_Leuschke       |      242 |          33 |
| Adelle96              |      185 |          33 |
| Eveline95             |       65 |          33 |
| Seth46                |      122 |          33 |
| Peter.Stehr0          |      148 |          33 |
| Alek_Watsica          |      255 |          33 |
| Cesar93               |      157 |          33 |
| Mariano_Koch3         |      140 |          33 |
| Presley_McClure       |       32 |          33 |
| Rafael.Hickle2        |      111 |          33 |
| Delfina_VonRueden68   |      220 |          33 |
| Eveline95             |       72 |          33 |
| Cesar93               |      163 |          33 |
| Gus93                 |       29 |          33 |
| Zack_Kemmer93         |      146 |          33 |
| Aurelie71             |      152 |          33 |
| Florence99            |      176 |          33 |
| Lennie_Hartmann40     |      105 |          33 |
| Rick29                |      226 |          33 |
| Hailee26              |       60 |          32 |
| Sam52                 |      168 |          32 |
| Clint27               |      229 |          32 |
| Jaime53               |       89 |          32 |
| Josianne.Friesen      |       76 |          32 |
| Alek_Watsica          |      253 |          32 |
| Justina.Gaylord27     |       34 |          32 |
| Justina.Gaylord27     |       35 |          32 |
| Delfina_VonRueden68   |      218 |          32 |
| Zack_Kemmer93         |      142 |          32 |
| Clint27               |      237 |          32 |
| Delfina_VonRueden68   |      219 |          32 |
| Elenor88              |      172 |          32 |
| Irwin.Larson          |       96 |          32 |
| Maya.Farrell          |      114 |          32 |
| Aurelie71             |      151 |          32 |
| Cesar93               |      164 |          32 |
| Emilio_Bernier52      |      187 |          31 |
| Kathryn80             |      191 |          31 |
| Colten.Harris76       |      207 |          31 |
| Dereck65              |       38 |          31 |
| Nicole71              |      246 |          31 |
| Sam52                 |      167 |          31 |
| Andre_Purdy85         |        9 |          31 |
| Clint27               |      228 |          31 |
| Aurelie71             |      156 |          31 |
| Frederik_Rice         |      239 |          31 |
| Dario77               |       83 |          31 |
| Alek_Watsica          |      254 |          31 |
| Annalise.McKenzie16   |       54 |          31 |
| Janet.Armstrong       |      115 |          31 |
| Presley_McClure       |       31 |          31 |
| Yvette.Gottlieb91     |      104 |          31 |
| Cesar93               |      159 |          31 |
| Donald.Fritsch        |      202 |          31 |
| Cesar93               |      160 |          31 |
| Tomas.Beatty93        |      250 |          31 |
| Gus93                 |       27 |          31 |
| Kaley9                |       93 |          31 |
| Eveline95             |       73 |          31 |
| Rick29                |      224 |          31 |
| Kenton_Kirlin         |        5 |          31 |
| Travon.Waters         |       18 |          31 |
| Andre_Purdy85         |        6 |          31 |
| Emilio_Bernier52      |      188 |          30 |
| Harley_Lind18         |       10 |          30 |
| Adelle96              |      184 |          30 |
| Florence99            |      179 |          30 |
| Kathryn80             |      193 |          30 |
| Billy52               |       47 |          30 |
| Frederik_Rice         |      240 |          30 |
| Delfina_VonRueden68   |      216 |          30 |
| Harrison.Beatty50     |      132 |          30 |
| Clint27               |      236 |          30 |
| Gus93                 |       26 |          30 |
| Zack_Kemmer93         |      143 |          30 |
| Jordyn.Jacobson2      |      108 |          29 |
| Annalise.McKenzie16   |       51 |          29 |
| Harley_Lind18         |       12 |          29 |
| Kathryn80             |      194 |          29 |
| Harrison.Beatty50     |      129 |          29 |
| Jaime53               |       92 |          29 |
| Harrison.Beatty50     |      130 |          29 |
| Justina.Gaylord27     |       33 |          29 |
| Delfina_VonRueden68   |      215 |          29 |
| Gerard79              |      135 |          29 |
| Harrison.Beatty50     |      131 |          29 |
| Katarina.Dibbert      |      208 |          29 |
| Milford_Gleichner42   |      214 |          29 |
| Cesar93               |      165 |          29 |
| Aiyana_Hoeger         |       95 |          28 |
| Keenan.Schamberger60  |      247 |          28 |
| Tabitha_Schamberger11 |       22 |          28 |
| Tomas.Beatty93        |      251 |          28 |
| Elenor88              |      175 |          28 |
| Andre_Purdy85         |        8 |          27 |
| Billy52               |       50 |          27 |
| Mariano_Koch3         |      139 |          27 |
| Clint27               |      238 |          27 |
| Kathryn80             |      195 |          26 |
| Kenton_Kirlin         |        1 |          25 |
| Delfina_VonRueden68   |      223 |          25 |
+-----------------------+----------+-------------+
257 rows in set (0.02 sec)

mysql> 
mysql> -- Challenge 5: How many times does the average user post
mysql> -- Solution 1:
mysql> SELECT AVG(SQResult.post_count) FROM (
    ->   SELECT
    ->   username,
    ->   COUNT(photos.id) AS 'post_count'
    ->   FROM users
    ->   LEFT JOIN photos
    ->     ON users.id = photos.user_id
    ->   GROUP BY users.username
    -> ) AS SQResult;
+--------------------------+
| AVG(SQResult.post_count) |
+--------------------------+
|                   2.5700 |
+--------------------------+
1 row in set (0.00 sec)

mysql> SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'AVG';
+--------+
| AVG    |
+--------+
| 2.5700 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT
    ->   tag_name,
    ->   COUNT(tags.id) AS total
    -> FROM tags
    -> JOIN photo_tags
    ->   ON tags.id = photo_tags.tag_id
    -> GROUP BY tags.id
    -> ORDER BY total DESC
    -> LIMIT 5;
+----------+-------+
| tag_name | total |
+----------+-------+
| smile    |    59 |
| beach    |    42 |
| party    |    39 |
| fun      |    38 |
| food     |    24 |
+----------+-------+
5 rows in set (0.00 sec)

mysql> 








mysql> SELECT
    ->   username,
    ->   COUNT(users.id) AS like_times
    -> FROM users
    -> JOIN likes
    ->   ON users.id = likes.user_id
    -> GROUP BY users.id
    -> HAVING like_times = (SELECT COUNT(*) FROM photos);
+--------------------+------------+
| username           | like_times |
+--------------------+------------+
| Aniya_Hackett      |        257 |
| Jaclyn81           |        257 |
| Rocio33            |        257 |
| Maxwell.Halvorson  |        257 |
| Ollie_Ledner37     |        257 |
| Mckenna17          |        257 |
| Duane60            |        257 |
| Julien_Schmidt     |        257 |
| Mike.Auer39        |        257 |
| Nia_Haag           |        257 |
| Leslie67           |        257 |
| Janelle.Nikolaus81 |        257 |
| Bethany20          |        257 |
+--------------------+------------+
13 rows in set (0.00 sec)


