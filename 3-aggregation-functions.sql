--AGGREGATION FUNCTIONS

--AVG

mysql> SELECT AVG(released_year) FROM books;
+--------------------+
| AVG(released_year) |
+--------------------+
|          1999.7895 |
+--------------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Calculate the average of pages across all books
mysql> SELECT AVG(pages) FROM books;
+------------+
| AVG(pages) |
+------------+
|   348.5789 |
+------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Calculate the average stock quantity for books released in the same year
mysql> SELECT
    ->   released_year,
    ->   AVG(stock_quantity) as 'average in stock'
    -> FROM books
    -> GROUP BY released_year;
+---------------+------------------+
| released_year | average in stock |
+---------------+------------------+
|          1945 |          95.0000 |
|          1981 |          23.0000 |
|          1985 |          49.0000 |
|          1989 |          12.0000 |
|          1996 |          97.0000 |
|          2000 |          68.0000 |
|          2001 |         134.3333 |
|          2003 |          66.0000 |
|          2004 |         172.0000 |
|          2005 |          92.0000 |
|          2010 |          55.0000 |
|          2012 |         154.0000 |
|          2013 |          26.0000 |
|          2014 |          29.0000 |
|          2016 |          43.0000 |
|          2017 |        1000.0000 |
+---------------+------------------+
16 rows in set (0.00 sec)

mysql> 
mysql> -- Calculate the average pages of author
mysql> SELECT
    ->   author_fname,
    ->   author_lname,
    ->   AVG(pages)
    -> FROM books
    -> GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | AVG(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |   351.0000 |
| Michael      | Chabon         |   634.0000 |
| Don          | DeLillo        |   320.0000 |
| Dave         | Eggers         |   431.0000 |
| David        | Foster Wallace |   336.0000 |
| Neil         | Gaiman         |   325.6667 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| Jhumpa       | Lahiri         |   244.5000 |
| George       | Saunders       |   367.0000 |
| Patti        | Smith          |   304.0000 |
| John         | Steinbeck      |   181.0000 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

--COUNT 


mysql> SELECT COUNT(*) FROM books; -- count all records
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT COUNT(DISTINCT author_fname) FROM books; -- count all distince author_fname
+------------------------------+
| COUNT(DISTINCT author_fname) |
+------------------------------+
|                           12 |
+------------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT COUNT(DISTINCT author_fname, author_lname) FROM books; -- count all author
+--------------------------------------------+
| COUNT(DISTINCT author_fname, author_lname) |
+--------------------------------------------+
|                                         12 |
+--------------------------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT COUNT(*) AS 'total title contains "the"' FROM books WHERE title LIKE '%the%';
+----------------------------+
| total title contains "the" |
+----------------------------+
|                          6 |
+----------------------------+
1 row in set (0.00 sec)

--GROUP BY
mysql> -- This query will returns table contains author_lname, author_fname and the total books of that author
mysql> -- But, cause of group by author_lname, so Dan Harris and Freida Harris will count as 'Harris'
mysql> -- So, We will have one record called Harris, which has 2 books
mysql> SELECT
    ->   author_lname, author_fname, COUNT(*)
    -> FROM books
    -> GROUP BY author_lname;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'book_shop.books.author_fname' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> 
mysql> -- To classify 2 authors with the same last name, we need to group by the first name also
mysql> SELECT
    ->   author_lname, author_fname, COUNT(*)
    -> FROM books
    -> GROUP BY author_lname, author_fname;
+----------------+--------------+----------+
| author_lname   | author_fname | COUNT(*) |
+----------------+--------------+----------+
| Carver         | Raymond      |        2 |
| Chabon         | Michael      |        1 |
| DeLillo        | Don          |        1 |
| Eggers         | Dave         |        3 |
| Foster Wallace | David        |        2 |
| Gaiman         | Neil         |        3 |
| Harris         | Dan          |        1 |
| Harris         | Freida       |        1 |
| Lahiri         | Jhumpa       |        2 |
| Saunders       | George       |        1 |
| Smith          | Patti        |        1 |
| Steinbeck      | John         |        1 |
+----------------+--------------+----------+
12 rows in set (0.00 sec)

mysql> 
mysql> -- The case that 2 authors has exactly the same name in both last name and first name ???
mysql> 
mysql> -- group by released_year
mysql> SELECT
    ->   released_year, COUNT(*)
    -> FROM books
    -> GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          1945 |        1 |
|          1981 |        1 |
|          1985 |        1 |
|          1989 |        1 |
|          1996 |        1 |
|          2000 |        1 |
|          2001 |        3 |
|          2003 |        2 |
|          2004 |        1 |
|          2005 |        1 |
|          2010 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2014 |        1 |
|          2016 |        1 |
|          2017 |        1 |
+---------------+----------+
16 rows in set (0.00 sec)

mysql> SELECT   CONCAT(     author_fname,     ' ',     author_lname   ) AS author,   MIN(pages) AS 'shortest book' FROM books GROUP BY author_lname, author_fname;
+----------------------+---------------+
| author               | shortest book |
+----------------------+---------------+
| Raymond Carver       |           176 |
| Michael Chabon       |           634 |
| Don DeLillo          |           320 |
| Dave Eggers          |           352 |
| David Foster Wallace |           329 |
| Neil Gaiman          |           208 |
| Dan Harris           |           256 |
| Freida Harris        |           428 |
| Jhumpa Lahiri        |           198 |
| George Saunders      |           367 |
| Patti Smith          |           304 |
| John Steinbeck       |           181 |
+----------------------+---------------+
12 rows in set (0.00 sec)

mysql> SELECT   CONCAT(     author_fname,     ' ',     author_lname   ) AS author,   MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;
+----------------------+--------------+
| author               | longest book |
+----------------------+--------------+
| Raymond Carver       |          526 |
| Michael Chabon       |          634 |
| Don DeLillo          |          320 |
| Dave Eggers          |          504 |
| David Foster Wallace |          343 |
| Neil Gaiman          |          465 |
| Dan Harris           |          256 |
| Freida Harris        |          428 |
| Jhumpa Lahiri        |          291 |
| George Saunders      |          367 |
| Patti Smith          |          304 |
| John Steinbeck       |          181 |
+----------------------+--------------+
12 rows in set (0.00 sec)

--SUM
mysql> -- Sum all pages in the entire database
mysql> SELECT SUM(pages) as 'total pages' FROM books;
+-------------+
| total pages |
+-------------+
|        6623 |
+-------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Sum all pages of each author
mysql> SELECT
    ->   author_fname,
    ->   author_lname,
    ->   SUM(pages) AS 'total pages'
    -> FROM books
    -> GROUP BY author_lname, author_fname;
+--------------+----------------+-------------+
| author_fname | author_lname   | total pages |
+--------------+----------------+-------------+
| Raymond      | Carver         |         702 |
| Michael      | Chabon         |         634 |
| Don          | DeLillo        |         320 |
| Dave         | Eggers         |        1293 |
| David        | Foster Wallace |         672 |
| Neil         | Gaiman         |         977 |
| Dan          | Harris         |         256 |
| Freida       | Harris         |         428 |
| Jhumpa       | Lahiri         |         489 |
| George       | Saunders       |         367 |
| Patti        | Smith          |         304 |
| John         | Steinbeck      |         181 |
+--------------+----------------+-------------+
12 rows in set (0.00 sec)

--MIN AND MAX FUNCTIONS

mysql> SELECT MIN(released_year) FROM books;
+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- This query will return the maximum pages but, the title is the first one of SELECT * FROM books;
mysql> -- The title here is not the title of the book has maximum pages
mysql> SELECT title, MAX(pages) as pages FROM books;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.title'; this is incompatible with sql_mode=only_full_group_by
mysql> 
mysql> -- Solution for above query - find the maximum pages and the tile of it
mysql> ---- use sub query -> This solution will be slow, it has to run 2 queries
    -> SELECT title, pages FROM books
    -> WHERE pages = (SELECT MAX(pages) FROM books);
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.00 sec)

mysql> ---- use ORDER BY instead will has better performance
    -> SELECT title, pages FROM books
    -> ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.00 sec)



