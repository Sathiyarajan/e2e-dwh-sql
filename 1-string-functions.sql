mysql> CREATE DATABASE book_shop;
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> use book_shop;
Database changed
mysql> CREATE TABLE books (
    ->   book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->   title VARCHAR(100),
    ->   author_fname VARCHAR(100),
    ->   author_lname VARCHAR(100),
    ->   released_year INT,
    ->   stock_quantity INT,
    ->   pages INT
    -> );
Query OK, 0 rows affected (0.45 sec)

mysql> INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
    -> VALUES
    -> ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
    -> ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
    -> ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
    -> ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
    -> ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
    -> ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
    -> ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
    -> ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
    -> ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
    -> ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
    -> ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
    -> ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
    -> ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
    -> ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
    -> ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
    -> ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
'
Query OK, 16 rows affected (0.05 sec)
Records: 16  Duplicates: 0  Warnings: 0

--CHAR_LENGTH
mysql> SELECT CHAR_LENGTH('Hello World');
+----------------------------+
| CHAR_LENGTH('Hello World') |
+----------------------------+
|                         11 |
+----------------------------+
1 row in set (0.00 sec)

mysql> SELECT 
    ->   author_lname,
    ->   CHAR_LENGTH(author_lname) AS 'length'
    -> FROM books;
+----------------+--------+
| author_lname   | length |
+----------------+--------+
| Lahiri         |      6 |
| Gaiman         |      6 |
| Gaiman         |      6 |
| Lahiri         |      6 |
| Eggers         |      6 |
| Eggers         |      6 |
| Chabon         |      6 |
| Smith          |      5 |
| Eggers         |      6 |
| Gaiman         |      6 |
| Carver         |      6 |
| Carver         |      6 |
| DeLillo        |      7 |
| Steinbeck      |      9 |
| Foster Wallace |     14 |
| Foster Wallace |     14 |
+----------------+--------+
16 rows in set (0.00 sec)

mysql> SELECT
    ->   CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')
    -> FROM books;
+-----------------------------------------------------------------------------+
| CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') |
+-----------------------------------------------------------------------------+
| Lahiri is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Lahiri is 6 characters long                                                 |
| Eggers is 6 characters long                                                 |
| Eggers is 6 characters long                                                 |
| Chabon is 6 characters long                                                 |
| Smith is 5 characters long                                                  |
| Eggers is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Carver is 6 characters long                                                 |
| Carver is 6 characters long                                                 |
| DeLillo is 7 characters long                                                |
| Steinbeck is 9 characters long                                              |
| Foster Wallace is 14 characters long                                        |
| Foster Wallace is 14 characters long                                        |
+-----------------------------------------------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT   CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')  as author_name_details FROM books;
+--------------------------------------+
| author_name_details                  |
+--------------------------------------+
| Lahiri is 6 characters long          |
| Gaiman is 6 characters long          |
| Gaiman is 6 characters long          |
| Lahiri is 6 characters long          |
| Eggers is 6 characters long          |
| Eggers is 6 characters long          |
| Chabon is 6 characters long          |
| Smith is 5 characters long           |
| Eggers is 6 characters long          |
| Gaiman is 6 characters long          |
| Carver is 6 characters long          |
| Carver is 6 characters long          |
| DeLillo is 7 characters long         |
| Steinbeck is 9 characters long       |
| Foster Wallace is 14 characters long |
| Foster Wallace is 14 characters long |
+--------------------------------------+
16 rows in set (0.00 sec)



--CONCAT and CONCAT_WS

mysql> SELECT
    ->   CONCAT(author_fname, ' ', author_lname) AS 'Fullname'
    -> FROM books;
+----------------------+
| Fullname             |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Neil Gaiman          |
| Jhumpa Lahiri        |
| Dave Eggers          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Dave Eggers          |
| Neil Gaiman          |
| Raymond Carver       |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| David Foster Wallace |
+----------------------+
16 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->   author_fname AS 'first', author_lname AS 'last',
    ->   CONCAT(author_fname, ' ', author_lname) AS 'full'
    -> FROM books;
+---------+----------------+----------------------+
| first   | last           | full                 |
+---------+----------------+----------------------+
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Neil    | Gaiman         | Neil Gaiman          |
| Neil    | Gaiman         | Neil Gaiman          |
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Dave    | Eggers         | Dave Eggers          |
| Dave    | Eggers         | Dave Eggers          |
| Michael | Chabon         | Michael Chabon       |
| Patti   | Smith          | Patti Smith          |
| Dave    | Eggers         | Dave Eggers          |
| Neil    | Gaiman         | Neil Gaiman          |
| Raymond | Carver         | Raymond Carver       |
| Raymond | Carver         | Raymond Carver       |
| Don     | DeLillo        | Don DeLillo          |
| John    | Steinbeck      | John Steinbeck       |
| David   | Foster Wallace | David Foster Wallace |
| David   | Foster Wallace | David Foster Wallace |
+---------+----------------+----------------------+
16 rows in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   CONCAT_WS('-', author_fname, author_lname) AS 'full name'
    -> FROM books;
+----------------------+
| full name            |
+----------------------+
| Jhumpa-Lahiri        |
| Neil-Gaiman          |
| Neil-Gaiman          |
| Jhumpa-Lahiri        |
| Dave-Eggers          |
| Dave-Eggers          |
| Michael-Chabon       |
| Patti-Smith          |
| Dave-Eggers          |
| Neil-Gaiman          |
| Raymond-Carver       |
| Raymond-Carver       |
| Don-DeLillo          |
| John-Steinbeck       |
| David-Foster Wallace |
| David-Foster Wallace |
+----------------------+
16 rows in set (0.00 sec)

--UPPER REPLACE SUBSTRING

mysql> SELECT 
    ->   UPPER(REVERSE('Why does my cat look at me with such harted'));
+---------------------------------------------------------------+
| UPPER(REVERSE('Why does my cat look at me with such harted')) |
+---------------------------------------------------------------+
| DETRAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW                   |
+---------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->   REPLACE
    ->   (
    ->     CONCAT('I', ' ', 'like', ' ', 'cats'),
    ->     ' ',
    ->     '-'
    ->   );
+-----------------------------------------------------------------------------+
| REPLACE
  (
    CONCAT('I', ' ', 'like', ' ', 'cats'),
    ' ',
    '-'
  ) |
+-----------------------------------------------------------------------------+
| I-like-cats                                                                 |
+-----------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->   REPLACE(title, ' ', '->')
    -> FROM books;
+--------------------------------------------------------------+
| REPLACE(title, ' ', '->')                                    |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
| Where->Im->Calling->From:->Selected->Stories                 |
| White->Noise                                                 |
| Cannery->Row                                                 |
| Oblivion:->Stories                                           |
| Consider->the->Lobster                                       |
+--------------------------------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT
    ->   author_lname AS forwards,
    ->   REVERSE(author_lname) AS backwards
    -> FROM books;
+----------------+----------------+
| forwards       | backwards      |
+----------------+----------------+
| Lahiri         | irihaL         |
| Gaiman         | namiaG         |
| Gaiman         | namiaG         |
| Lahiri         | irihaL         |
| Eggers         | sreggE         |
| Eggers         | sreggE         |
| Chabon         | nobahC         |
| Smith          | htimS          |
| Eggers         | sreggE         |
| Gaiman         | namiaG         |
| Carver         | revraC         |
| Carver         | revraC         |
| DeLillo        | olliLeD        |
| Steinbeck      | kcebnietS      |
| Foster Wallace | ecallaW retsoF |
| Foster Wallace | ecallaW retsoF |
+----------------+----------------+
16 rows in set (0.01 sec)

mysql> SELECT
    ->   UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps'
    -> FROM books;
+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+
16 rows in set (0.00 sec)

mysql> SELECT
    ->   CONCAT(title, ' was released in ', released_year) AS 'blurb'
    -> FROM books;
+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius was released in 2001           |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |
| Where Im Calling From: Selected Stories was released in 1989            |
| White Noise was released in 1985                                         |
| Cannery Row was released in 1945                                         |
| Oblivion: Stories was released in 2004                                   |
| Consider the Lobster was released in 2005                                |
+--------------------------------------------------------------------------+
16 rows in set (0.00 sec)

mysql> SELECT
    ->   title,
    ->   CHAR_LENGTH(title) AS 'character count'
    -> FROM books;
+-----------------------------------------------------+-----------------+
| title                                               | character count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
| Norse Mythology                                     |              15 |
| American Gods                                       |              13 |
| Interpreter of Maladies                             |              23 |
| A Hologram for the King: A Novel                    |              32 |
| The Circle                                          |              10 |
| The Amazing Adventures of Kavalier & Clay           |              41 |
| Just Kids                                           |               9 |
| A Heartbreaking Work of Staggering Genius           |              41 |
| Coraline                                            |               8 |
| What We Talk About When We Talk About Love: Stories |              51 |
| Where Im Calling From: Selected Stories            |              40 |
| White Noise                                         |              11 |
| Cannery Row                                         |              11 |
| Oblivion: Stories                                   |              17 |
| Consider the Lobster                                |              20 |
+-----------------------------------------------------+-----------------+
16 rows in set (0.00 sec)

mysql> SELECT 
    ->   CONCAT(SUBSTRING(title, 1, 10), ' ', '...') AS 'short title',
    ->   CONCAT(author_lname, ', ', author_fname) AS 'author',
    ->   CONCAT(stock_quantity, ' in stock') AS 'quantity'
    -> FROM books;
+----------------+-----------------------+--------------+
| short title    | author                | quantity     |
+----------------+-----------------------+--------------+
| The Namesa ... | Lahiri, Jhumpa        | 32 in stock  |
| Norse Myth ... | Gaiman, Neil          | 43 in stock  |
| American G ... | Gaiman, Neil          | 12 in stock  |
| Interprete ... | Lahiri, Jhumpa        | 97 in stock  |
| A Hologram ... | Eggers, Dave          | 154 in stock |
| The Circle ... | Eggers, Dave          | 26 in stock  |
| The Amazin ... | Chabon, Michael       | 68 in stock  |
| Just Kids ...  | Smith, Patti          | 55 in stock  |
| A Heartbre ... | Eggers, Dave          | 104 in stock |
| Coraline ...   | Gaiman, Neil          | 100 in stock |
| What We Ta ... | Carver, Raymond       | 23 in stock  |
| Where Im  ... | Carver, Raymond       | 12 in stock  |
| White Nois ... | DeLillo, Don          | 49 in stock  |
| Cannery Ro ... | Steinbeck, John       | 95 in stock  |
| Oblivion:  ... | Foster Wallace, David | 172 in stock |
| Consider t ... | Foster Wallace, David | 92 in stock  |
+----------------+-----------------------+--------------+
16 rows in set (0.00 sec)

mysql> SELECT
    ->   REPLACE(title, 'e', '3') AS 'teen code title'
    -> FROM books;
+-----------------------------------------------------+
| teen code title                                     |
+-----------------------------------------------------+
| Th3 Nam3sak3                                        |
| Nors3 Mythology                                     |
| Am3rican Gods                                       |
| Int3rpr3t3r of Maladi3s                             |
| A Hologram for th3 King: A Nov3l                    |
| Th3 Circl3                                          |
| Th3 Amazing Adv3ntur3s of Kavali3r & Clay           |
| Just Kids                                           |
| A H3artbr3aking Work of Stagg3ring G3nius           |
| Coralin3                                            |
| What W3 Talk About Wh3n W3 Talk About Lov3: Stori3s |
| Wh3r3 Im Calling From: S3l3ct3d Stori3s            |
| Whit3 Nois3                                         |
| Cann3ry Row                                         |
| Oblivion: Stori3s                                   |
| Consid3r th3 Lobst3r                                |
+-----------------------------------------------------+
16 rows in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   REPLACE(SUBSTRING(title, 1, 10), 'e', '3')
    -> FROM books;
+--------------------------------------------+
| REPLACE(SUBSTRING(title, 1, 10), 'e', '3') |
+--------------------------------------------+
| Th3 Nam3sa                                 |
| Nors3 Myth                                 |
| Am3rican G                                 |
| Int3rpr3t3                                 |
| A Hologram                                 |
| Th3 Circl3                                 |
| Th3 Amazin                                 |
| Just Kids                                  |
| A H3artbr3                                 |
| Coralin3                                   |
| What W3 Ta                                 |
| Wh3r3 Im                                  |
| Whit3 Nois                                 |
| Cann3ry Ro                                 |
| Oblivion:                                  |
| Consid3r t                                 |
+--------------------------------------------+
16 rows in set (0.01 sec)

mysql> SELECT REVERSE('Hello World');
+------------------------+
| REVERSE('Hello World') |
+------------------------+
| dlroW olleH            |
+------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT REVERSE('meow meow');
+----------------------+
| REVERSE('meow meow') |
+----------------------+
| woem woem            |
+----------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   REVERSE(author_fname)
    -> FROM books;
+-----------------------+
| REVERSE(author_fname) |
+-----------------------+
| apmuhJ                |
| lieN                  |
| lieN                  |
| apmuhJ                |
| evaD                  |
| evaD                  |
| leahciM               |
| ittaP                 |
| evaD                  |
| lieN                  |
| dnomyaR               |
| dnomyaR               |
| noD                   |
| nhoJ                  |
| divaD                 |
| divaD                 |
+-----------------------+
16 rows in set (0.00 sec)

mysql> 
mysql> SELECT CONCAT('woof', REVERSE('woof'));
+---------------------------------+
| CONCAT('woof', REVERSE('woof')) |
+---------------------------------+
| wooffoow                        |
+---------------------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   CONCAT(author_fname, REVERSE(author_fname))
    -> FROM books;
+---------------------------------------------+
| CONCAT(author_fname, REVERSE(author_fname)) |
+---------------------------------------------+
| JhumpaapmuhJ                                |
| NeillieN                                    |
| NeillieN                                    |
| JhumpaapmuhJ                                |
| DaveevaD                                    |
| DaveevaD                                    |
| MichaelleahciM                              |
| PattiittaP                                  |
| DaveevaD                                    |
| NeillieN                                    |
| RaymonddnomyaR                              |
| RaymonddnomyaR                              |
| DonnoD                                      |
| JohnnhoJ                                    |
| DaviddivaD                                  |
| DaviddivaD                                  |
+---------------------------------------------+

mysql> SELECT 
    ->   CONCAT
    ->   (
    ->     SUBSTRING(title, 1, 10),
    ->     ' ...'
    ->   ) AS 'display_title'
    -> FROM books;
+----------------+
| display_title  |
+----------------+
| The Namesa ... |
| Norse Myth ... |
| American G ... |
| Interprete ... |
| A Hologram ... |
| The Circle ... |
| The Amazin ... |
| Just Kids ...  |
| A Heartbre ... |
| Coraline ...   |
| What We Ta ... |
| Where Im  ... |
| White Nois ... |
| Cannery Ro ... |
| Oblivion:  ... |
| Consider t ... |
+----------------+
16 rows in set (0.00 sec)

mysql> 
mysql> SELECT
    ->   CONCAT('MY FAVORITE BOOK IS THE ', UPPER(title))
    -> FROM books;
+-----------------------------------------------------------------------------+
| CONCAT('MY FAVORITE BOOK IS THE ', UPPER(title))                            |
+-----------------------------------------------------------------------------+
| MY FAVORITE BOOK IS THE THE NAMESAKE                                        |
| MY FAVORITE BOOK IS THE NORSE MYTHOLOGY                                     |
| MY FAVORITE BOOK IS THE AMERICAN GODS                                       |
| MY FAVORITE BOOK IS THE INTERPRETER OF MALADIES                             |
| MY FAVORITE BOOK IS THE A HOLOGRAM FOR THE KING: A NOVEL                    |
| MY FAVORITE BOOK IS THE THE CIRCLE                                          |
| MY FAVORITE BOOK IS THE THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| MY FAVORITE BOOK IS THE JUST KIDS                                           |
| MY FAVORITE BOOK IS THE A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| MY FAVORITE BOOK IS THE CORALINE                                            |
| MY FAVORITE BOOK IS THE WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| MY FAVORITE BOOK IS THE WHERE IM CALLING FROM: SELECTED STORIES            |
| MY FAVORITE BOOK IS THE WHITE NOISE                                         |
| MY FAVORITE BOOK IS THE CANNERY ROW                                         |
| MY FAVORITE BOOK IS THE OBLIVION: STORIES                                   |
| MY FAVORITE BOOK IS THE CONSIDER THE LOBSTER                                |
+-----------------------------------------------------------------------------+
16 rows in set (0.00 sec)


