--DISTINCT 
mysql> SELECT author_lname FROM books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Gaiman         |
| Lahiri         |
| Eggers         |
| Eggers         |
| Chabon         |
| Smith          |
| Eggers         |
| Gaiman         |
| Carver         |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Foster Wallace |
+----------------+
16 rows in set (0.00 sec)

mysql> SELECT DISTINCT author_lname FROM books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
+----------------+
9 rows in set (0.00 sec)

mysql> 
mysql> SELECT released_year FROM books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          2001 |
|          2003 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
+---------------+
16 rows in set (0.00 sec)

mysql> SELECT DISTINCT released_year FROM books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
+---------------+
14 rows in set (0.00 sec)

mysql> 
mysql> SELECT author_fname, author_lname FROM books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Jhumpa       | Lahiri         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Dave         | Eggers         |
| Neil         | Gaiman         |
| Raymond      | Carver         |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| David        | Foster Wallace |
+--------------+----------------+
16 rows in set (0.00 sec)

mysql> SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
+-----------------------------------------+
| CONCAT(author_fname, ' ', author_lname) |
+-----------------------------------------+
| Jhumpa Lahiri                           |
| Neil Gaiman                             |
| Dave Eggers                             |
| Michael Chabon                          |
| Patti Smith                             |
| Raymond Carver                          |
| Don DeLillo                             |
| John Steinbeck                          |
| David Foster Wallace                    |
+-----------------------------------------+
9 rows in set (0.00 sec)

mysql> SELECT DISTINCT author_fname, author_lname FROM books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
+--------------+----------------+
9 rows in set (0.00 sec)

--LIKE and wild card queries
mysql> SELECT title FROM books WHERE author_fname LIKE '%da%'; -- % is wildcard sign -> search for all book title with author_fname contains 'da'
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| A Hologram for the King: A Novel          |
| The Circle                                |
| A Heartbreaking Work of Staggering Genius |
| Oblivion: Stories                         |
| Consider the Lobster                      |
+-------------------------------------------+
5 rows in set (0.00 sec)

mysql> SELECT title FROM books WHERE author_fname LIKE 'da%'; -- search for all books title with author_fname start with 'da'
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| A Hologram for the King: A Novel          |
| The Circle                                |
| A Heartbreaking Work of Staggering Genius |
| Oblivion: Stories                         |
| Consider the Lobster                      |
+-------------------------------------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
Empty set (0.00 sec)

mysql> 
mysql> SELECT title FROM books WHERE title LIKE '%\%%';
Empty set (0.00 sec)

mysql> SELECT title FROM books WHERE title LIKE '%\_%';
Empty set (0.00 sec)

--ORDER-BY

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 0, 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Norse Mythology                  |          2016 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
| Just Kids                        |          2010 |
| Consider the Lobster             |          2005 |
+----------------------------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 3, 1;
+-----------+---------------+
| title     | released_year |
+-----------+---------------+
| Just Kids |          2010 |
+-----------+---------------+
1 row in set (0.00 sec)

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 4, 1;
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Consider the Lobster |          2005 |
+----------------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 0, 1;
+-----------------+---------------+
| title           | released_year |
+-----------------+---------------+
| Norse Mythology |          2016 |
+-----------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 2, 1;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT   title,   released_year FROM books ORDER BY released_year DESC LIMIT 1, 1;
+------------+---------------+
| title      | released_year |
+------------+---------------+
| The Circle |          2013 |
+------------+---------------+
1 row in set (0.00 sec)
