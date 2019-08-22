--&& OPERATOR
mysql> -- SELECT all books by Dave Eggers and released_year after 2010
mysql> SELECT  
    ->   author_lname, released_year 
    -> FROM books
    -> WHERE 
    ->   author_lname = 'Eggers' && released_year > 2010;
+--------------+---------------+
| author_lname | released_year |
+--------------+---------------+
| Eggers       |          2012 |
| Eggers       |          2013 |
+--------------+---------------+
2 rows in set (0.00 sec)

--BETWEEN AND NOT BETWEEN AND CAST

mysql> -- SELECT all books between 2004 and 2015
mysql> -- Can not replace the 'AND' keyword by '&&', It's different !!!
mysql> SELECT title, released_year FROM books
    -> WHERE released_year BETWEEN 2004 AND 2015;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+
6 rows in set (0.00 sec)

mysql> -- SELECT all books not between 2004 and 2015
mysql> -- Can not replace the 'AND' keyword by '&&', It's different !!!
mysql> SELECT title, released_year FROM books
    -> WHERE released_year NOT BETWEEN 2004 AND 2015;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| Norse Mythology                                     |          2016 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where Im Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
| fake_book                                           |          2001 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+
13 rows in set (0.00 sec)

mysql> 
mysql> -- Using CAST()
mysql> SELECT CAST('2017-05-02' AS DATETIME);
+--------------------------------+
| CAST('2017-05-02' AS DATETIME) |
+--------------------------------+
| 2017-05-02 00:00:00            |
+--------------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> USE new_testing_db;
ERROR 1049 (42000): Unknown database 'new_testing_db'
mysql> 
mysql> SELECT * FROM people;
+-----------+------------+-----------+---------------------+
| name      | birthdate  | birthtime | birthdt             |
+-----------+------------+-----------+---------------------+
| Padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry     | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
| Microwave | 2019-08-21 | 23:27:06  | 2019-08-21 23:27:06 |
+-----------+------------+-----------+---------------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- SELECT people with birthday(datetime) is between 2 date
mysql> SELECT name, birthdt FROM people
    -> WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);
+-------+---------------------+
| name  | birthdt             |
+-------+---------------------+
| Padma | 1983-11-11 10:07:35 |
+-------+---------------------+
1 row in set (0.00 sec)

-- CASE WHEN AND THEN IMPORTANT QUERY IN THE SUNTAX

mysql> SELECT * FROM books;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      12 | Where Im Calling  From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.00 sec)

mysql> SELECT title, released_year,
    ->   CASE
    ->     WHEN released_year >= 2000 THEN 'Modern Lit'
    ->     ELSE '20th Century Lit'
    ->   END AS genre
    -> FROM books;
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | genre            |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | Modern Lit       |
| Norse Mythology                                     |          2016 | Modern Lit       |
| American Gods                                       |          2001 | Modern Lit       |
| Interpreter of Maladies                             |          1996 | 20th Century Lit |
| A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
| The Circle                                          |          2013 | Modern Lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
| Just Kids                                           |          2010 | Modern Lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
| Coraline                                            |          2003 | Modern Lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
| Where Im Calling From:  Selected Stories            |          1989 | 20th Century Lit |
| White Noise                                         |          1985 | 20th Century Lit |
| Cannery Row                                         |          1945 | 20th Century Lit |
| Oblivion: Stories                                   |          2004 | Modern Lit       |
| Consider the Lobster                                |          2005 | Modern Lit       |
| 10% Happier                                         |          2014 | Modern Lit       |
| fake_book                                           |          2001 | Modern Lit       |
| Lincoln In The Bardo                                |          2017 | Modern Lit       |
+-----------------------------------------------------+---------------+------------------+
19 rows in set (0.00 sec)

mysql> 
mysql> -- Represemt the stock quantity as follow
mysql> -- 0 <= stock <= 50 -> * (one star)
mysql> -- 51 <= stock <= 100 -> ** (two stars)
mysql> -- 101 <= stock -> *** (three stars)
mysql> SELECT title, stock_quantity,
    -> CASE
    ->     WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    ->     WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    ->     ELSE '***'
    ->   END AS 'STOCK'
    -> FROM books;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | **    |
| A Hologram for the King: A Novel                    |            154 | ***   |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where Im Calling From:  Selected Stories            |             12 | *     |
| White Noise                                         |             49 | *     |
| Cannery Row                                         |             95 | **    |
| Oblivion: Stories                                   |            172 | ***   |
| Consider the Lobster                                |             92 | **    |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ***   |
| Lincoln In The Bardo                                |           1000 | ***   |
+-----------------------------------------------------+----------------+-------+
19 rows in set (0.01 sec)

-- >= > < = in SQL

mysql> 
mysql> -- SELECT all books has released_year after 2000
mysql> SELECT title, released_year FROM books
    -> WHERE released_year > 2000
    -> ORDER BY released_year;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Oblivion: Stories                         |          2004 |
| Consider the Lobster                      |          2005 |
| Just Kids                                 |          2010 |
| A Hologram for the King: A Novel          |          2012 |
| The Circle                                |          2013 |
| 10% Happier                               |          2014 |
| Norse Mythology                           |          2016 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
13 rows in set (0.00 sec)

mysql> 
mysql> -- SELECT all books has stock_quantity equal to or greater than 100
mysql> SELECT title, stock_quantity FROM books
    -> WHERE stock_quantity > 100
    -> ORDER BY stock_quantity;
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Heartbreaking Work of Staggering Genius |            104 |
| A Hologram for the King: A Novel          |            154 |
| Oblivion: Stories                         |            172 |
| fake_book                                 |            287 |
| Lincoln In The Bardo                      |           1000 |
+-------------------------------------------+----------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- SELECT 99 > 1 --> returns TRUE in form of number 1
mysql> SELECT 99 > 1;
+--------+
| 99 > 1 |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)

mysql> 
mysql> -- SELECT 'A' > 'a', returns 0, because 'A' = 'a', case insensitive
mysql> SELECT 'A' > 'a';
+-----------+
| 'A' > 'a' |
+-----------+
|         0 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT 'A' >= 'a';
+------------+
| 'A' >= 'a' |
+------------+
|          1 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT 'A' = 'a';
+-----------+
| 'A' = 'a' |
+-----------+
|         1 |
+-----------+
1 row in set (0.00 sec)

mysql> 
mysql> -- SELECT 'b' > 'a';
mysql> SELECT 'b' > 'a';
+-----------+
| 'b' > 'a' |
+-----------+
|         1 |
+-----------+
1 row in set (0.00 sec)

mysql> 
mysql> -- SELECT all books has released_year before 2000
mysql> SELECT title, released_year FROM books
    -> WHERE released_year < 2000
    -> ORDER BY released_year;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where Im Calling From: Selected Stories            |          1989 |
| Interpreter of Maladies                             |          1996 |
+-----------------------------------------------------+---------------+
5 rows in set (0.00 sec)

-- IN AND NOT IN 

mysql> -- SELECT books written by author with last name = 'Carver' || 'Lahiri' || 'Smith'
mysql> SELECT title, author_lname FROM books
    -> WHERE author_lname = 'Carver' OR
    ->       author_lname = 'Lahiri' OR
    ->       author_lname = 'Smith';
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where Im Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Can use IN to do the same thing as above with better syntax
mysql> SELECT title, author_lname FROM books
    -> WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where Im Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- SELECT all books that were not published in released_year not in
mysql> -- 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014
mysql> SELECT title, released_year FROM books
    -> WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
    -> ORDER BY released_year;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where Im Calling From: Selected Stories            |          1989 |
| Interpreter of Maladies                             |          1996 |
| American Gods                                       |          2001 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| fake_book                                           |          2001 |
| The Namesake                                        |          2003 |
| Coraline                                            |          2003 |
| Consider the Lobster                                |          2005 |
| The Circle                                          |          2013 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+
13 rows in set (0.00 sec)

mysql> 
mysql> -- SELECT all books that were not published in released_year is not even year
mysql> SELECT title, released_year FROM books
    -> WHERE released_year >= 2000 AND released_year % 2 != 0
    -> ORDER BY released_year;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| The Circle                                |          2013 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
8 rows in set (0.00 sec)

mysql> SELECT title, released_year FROM books
    -> WHERE released_year != 2017;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| Norse Mythology                                     |          2016 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| A Hologram for the King: A Novel                    |          2012 |
| The Circle                                          |          2013 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| Just Kids                                           |          2010 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where Im Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
| Oblivion: Stories                                   |          2004 |
| Consider the Lobster                                |          2005 |
| 10% Happier                                         |          2014 |
| fake_book                                           |          2001 |
+-----------------------------------------------------+---------------+
18 rows in set (0.00 sec)
