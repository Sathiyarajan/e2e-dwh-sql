
sql end to end:

schema basics:

-- creating a table schema
CREATE TABLE cats (
  cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT
);

--inserting a data into cats:
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

--inserting a duplicate data into cats:
INSERT INTO cats(name, breed, age) VALUES ('Ringo', 'Tabby', 5);


finding a duplicate row in a table:


SELECT
    name, breed, COUNT(*)
FROM
    cats
GROUP BY
    name, breed
HAVING 
    COUNT(*) > 1;














