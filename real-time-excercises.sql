mysql> -- Select all title that contains 'stories'
mysql> SELECT title FROM books WHERE title LIKE '%stories%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where Im Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- Find the longest book
mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Print a summary containing the title and year, for the 3 most recent books
mysql> SELECT 
    ->   CONCAT
    ->     (
    ->       title,
    ->       ' - ',
    ->       released_year
    ->     ) AS summary 
    -> FROM books
    -> ORDER BY released_year DESC
    -> LIMIT 3;
+-----------------------------------------+
| summary                                 |
+-----------------------------------------+
| Norse Mythology - 2016                  |
| The Circle - 2013                       |
| A Hologram for the King: A Novel - 2012 |
+-----------------------------------------+
3 rows in set (0.00 sec)

mysql> -- Find all books with an author_lname that contains a space
mysql> SELECT
    ->   title, author_lname
    -> FROM books
    -> WHERE author_lname LIKE '% %';
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- Find the 3 books with the lowest stock
mysql> SELECT
    ->   title, released_year, stock_quantity
    -> FROM books
    -> ORDER BY stock_quantity, released_year DESC
    -> LIMIT 3;
+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| American Gods                                       |          2001 |             12 |
| Where Im Calling From: Selected Stories            |          1989 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+
3 rows in set (0.00 sec)

mysql> -- Print title and author_lname, sorted first by author_lname and then by title
mysql> SELECT
    ->   title, author_lname
    -> FROM books
    -> ORDER BY author_lname, title;
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where Im Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+
16 rows in set (0.00 sec)

mysql> 
mysql> -- Print out sorted alphabetically by last name
mysql> SELECT
    ->   CONCAT
    ->     (
    ->       'MY FAVORITE AUTHOR IS ',
    ->       UPPER(author_fname),
    ->       ' ',
    ->       UPPER(author_lname),
    ->       ' !'
    ->     ) AS yell
    -> FROM books
    -> ORDER BY author_lname;
+----------------------------------------------+
| yell                                         |
+----------------------------------------------+
| MY FAVORITE AUTHOR IS RAYMOND CARVER !       |
| MY FAVORITE AUTHOR IS RAYMOND CARVER !       |
| MY FAVORITE AUTHOR IS MICHAEL CHABON !       |
| MY FAVORITE AUTHOR IS DON DELILLO !          |
| MY FAVORITE AUTHOR IS DAVE EGGERS !          |
| MY FAVORITE AUTHOR IS DAVE EGGERS !          |
| MY FAVORITE AUTHOR IS DAVE EGGERS !          |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE ! |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE ! |
| MY FAVORITE AUTHOR IS NEIL GAIMAN !          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN !          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN !          |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI !        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI !        |
| MY FAVORITE AUTHOR IS PATTI SMITH !          |
| MY FAVORITE AUTHOR IS JOHN STEINBECK !       |
+----------------------------------------------+
16 rows in set (0.00 sec)



-- EXCERCISES

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS tweets;

/*
Fill in the blank
CREATE TABLE inventory (
  item_name ____________,
  price ________________,
  quantity _____________
);
NOTE: price is always < 1,000,000
*/

CREATE TABLE inventory (
  item_name VARCHAR(100),
  price DECIMAL(8, 2),
  quantity INT
);

/*
1. Print out the current time
2. Print out the current date
3. Print out the current day of the week - the number
4. Print out the current day of the week - the day name
5. Print out the current day and time using this format: mm/dd/yyy
6. Print out the current day and time using this format: January 2nd at 3:15
*/
mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 23:34:06  |
+-----------+
1 row in set (0.00 sec)

mysql> -- 2 
mysql> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2019-08-21 |
+------------+
1 row in set (0.00 sec)

mysql> -- 3
mysql> SELECT DAYOFWEEK(NOW());
+------------------+
| DAYOFWEEK(NOW()) |
+------------------+
|                4 |
+------------------+
1 row in set (0.00 sec)

mysql> -- 4
mysql> SELECT DAYNAME(NOW());
+----------------+
| DAYNAME(NOW()) |
+----------------+
| Wednesday      |
+----------------+
1 row in set (0.00 sec)

mysql> -- 5
mysql> SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
+--------------------------------+
| DATE_FORMAT(NOW(), '%m/%d/%Y') |
+--------------------------------+
| 08/21/2019                     |
+--------------------------------+
1 row in set (0.00 sec)

mysql> -- 6
mysql> SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');
+--------------------------------------+
| DATE_FORMAT(NOW(), '%M %D at %H:%i') |
+--------------------------------------+
| August 21st at 23:34                 |
+--------------------------------------+
1 row in set (0.00 sec)

