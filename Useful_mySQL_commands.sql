-- mySQL cheat sheet
-- Code developed by Danielle Lynch
-- March 17, 2019

-- Basic commands
ADD			-- Adds a column in an existing table
ALTER TABLE 		-- Adds, deletes, or modifies columns in a table
AS			-- Renames a column or table with an alias
ASC			-- Sorts the result set in descending order
AUTO_INCREMENT 		-- Allows a unique number to be generated automatically when a new record is inserted into a table
AVG 			-- Returns the average value of an expression
BETWEEN			-- Selects values within a given range. Note: includes from value and to value
CASE			-- Goes through conditions and return a value when the first condition is met (like an IF-THEN-ELSE statement). Uses CASE-WHEN-THEN-ELSE syntax.
CAST			-- Converts a value (of any type) into the specified datatype
CHECK 			-- Used to limit the value range that can be placed in a column
CREATE			-- Creates a database, index, view, or table
COUNT			-- Returns the number of records returned by a select query
DELETE			-- Deletes rows from a table
DELETE FROM  		-- Delete all records
DESC			-- Sorts the result set in descending order
DESCRIBE		-- Returns database's field formats
DISTINCT		-- Selects only distinct (different) values. Note: Make use of DISTINCT only when unavoidable. It incurs extra sort operation and slows queries down.
DROP			-- Deletes a column, constraint, database, index, table, or view. Note: When you drop a table, corresponding indexes are dropped automatically.
EXISTS			-- Tests for the existence of any record in a subquery
FOREIGN KEY		-- A constraint that is a key used to link two tables together
FROM			-- Specifies which table to select or delete data from
GROUP BY		-- Groups the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG). Note: Also has the effect of removing duplicates since group functions ignore NULL values..
HAVING			-- Used instead of WHERE with aggregate functions; requires the group counts to be greater than one
HASH			-- Partitioning by HASH ensures an even distribution of data among a predetermined number of partitions. Note: You have to specify how many partitions you want to create in a particular table.
IN			-- Allows you to specify multiple values in a WHERE clause
INSERT IGNORE INTO 	-- Insert fields, ignoring duplicates
INSERT INTO		-- Inserts new rows in a table
INSERT INTO SELECT	-- Copies data from one table into another table
IS NULL			-- Tests for empty values
KEY			-- This is very similar to HASH partitioning, but the hashing function is supplied by MySQL
LIKE			-- Searches for a specified pattern in a column
LIMIT			-- Specifies the number of records to return in the result set
LIST COLUMNS		-- A partitioning mode that accepts a list of one or more columns as partition keys
MAX			-- Returns the maximum value in a set of values
MIN			-- Returns the minimum value in a set of values
NOT			-- Only includes rows where a condition is not true
NOT NULL		-- A constraint that enforces a column to not accept NULL values. Note: NOT NULL constraint can only be defined at the column level.
ON			-- used to join tables where the column names don’t match in both tables, so you specify the column names for join keys in both tables
OR			-- Includes rows where either condition is true
ORDER BY		-- Sorts the result set in ascending or descending order. Note: Column alias can be used in ORDER BY clause.
PARTITION BY		-- Splits tables, indexes, and index-organized tables into smaller pieces, therefore queries that access only a fraction of the data can run faster because there are fewer data to scan.
PRIMARY KEY		-- A constraint that uniquely identifies each record in a database table; an easy way of removing duplicate records is to add a PRIMARY KEY
REPLACE INTO 		-- Insert fields, only new records replace any duplicates
RANGE			-- A partitioning mode to specify rows within a given range. Ranges should be contiguous but not overlapping, and are defined using the VALUES LESS THAN operator.
ROUND   		-- Rounds a number to a specified number of decimal places
SELECT			-- Selects data from a database
SELECT DISTINCT		-- Returns unique records; note that NULL is considered a distinct value
SELECT INTO		-- Copies data from one table into a new table
SELECT * FROM  		-- Returns all data in a table
SET			-- Specifies which columns and values that should be updated in a table
SHOW TABLES       	-- Returns all the tables in the database
SHOW COLUMNS FROM   	-- Returns colunns and column information in a table
SUM  			-- Calculates the sum of a set of values
TRUNCATE       		-- Removes all records if already the table exists. Can be used to remove a partition.
UNIQUE			-- A constraint that ensures that all values in a column are different
UPDATE	        	-- Updates existing rows in a table
USE     		-- Selects the default database for the session
USING			-- Used if several columns share the same name but you don’t want to join using all of these common columns, so you specify the join key by name.
VALUES			-- Specifies the values of an INSERT INTO statement
VIEW			-- A virtual table based on the result-set of an SQL statement. Note: A view has a name in the database schema so that other queries can use it like a table.
WHERE			-- Filters a result set to include only records that fulfill a specified condition. Note: Group functions cannot be used in WHERE clause.
WITH			-- Allows you, as part of your select statement, to assign a name to a subquery and utilise its results by referencing that name.

-- Logical Operators
ALL			-- TRUE if all of the subquery values meet the condition	
AND			-- TRUE if all the conditions separated by AND is TRUE	
ANY			-- TRUE if any of the subquery values meet the condition	
BETWEEN			-- TRUE if the operand is within the range of comparisons	
EXISTS			-- TRUE if the subquery returns one or more records	
IN			-- TRUE if the operand is equal to one of a list of expressions	
LIKE			-- TRUE if the operand matches a pattern	
NOT			-- Displays a record if the condition(s) is NOT TRUE	
OR			-- TRUE if any of the conditions separated by OR is TRUE	
SOME			-- TRUE if any of the subquery values meet the condition

-- Date formats
DATE 			-- format YYYY-MM-DD
DATETIME 		-- format: YYYY-MM-DD HH:MI:SS
TIMESTAMP 		-- format: YYYY-MM-DD HH:MI:SS
YEAR 			-- format YYYY or YY

-- Order of execution of SELECT queries
-- 1. FROM clause
-- 2. WHERE clause
-- 3. GROUP BY clause									
-- 4. HAVING clause 									
-- 5. SELECT clause
-- 6. ORDER BY clause

-- In Order to create a new Database, first remove any databases with the same name as the one you will create
DROP DATABASE IF EXISTS db;

-- Create a Database
CREATE DATABASE db;

-- Create a table
-- You may have as many columns as you'd like, and the constraints are optional
-- Use proper naming conventions while naming tables and columns
CREATE TABLE db.t (                  
    id INTEGER,
    c1 VARCHAR(20),
    c2 INTEGER
);
    
-- After you create a table, you can start loading it with data.
LOAD DATA LOCAL INFILE 'dump.txt' 	-- Bulk data loader, assumes that datafiles are tab delimited
INTO TABLE t
   FIELDS TERMINATED BY ':'   		-- Specifies the column-ending sequence (for example, each column in a CSV file is separated by ','
   LINES TERMINATED BY '\n'		-- Specifies the line-ending sequence and the column order to load
   IGNORE 1 LINES                       -- If your file has a header, this command will ignore it
   (c2, c1, c3);			-- Reorder columns in the file to match the column order in the table	

-- SELECT statement examples
SELECT COUNT(DISTINCT c1) FROM t; 	-- When combined with COUNT, the NULL value will not be counted
SELECT * FROM t WHERE c1 = 'whatever'; 	-- Returns all records with the value "whatever"
SELECT * FROM t WHERE c1 ='whatever' 	-- Returns all records with the value "whatever" AND '9999"
	AND c2 = '9999'; 							
SELECT * FROM t WHERE c1 LIKE 'what%'; 	-- Returns all records starting with the value "what"
DELETE FROM t WHERE c1 = 'whatever'; 	-- Deletes rows with values matching "whatever" from the table
SELECT * FROM t 			-- Multiple group. Note: Columns in GROUP BY clause does have to necessarily be used in SELECT columns.
	GROUP BY c1, c2;						
SELECT c1, COUNT(*) FROM t		-- GROUP BY and AGGREGATE
	GROUP BY c1;				  					
SELECT c1, c2 FROM t			-- The HAVING clause
	GROUP BY c1 HAVING c2 < 1970;			
SELECT SUM(c1) FROM t;			-- Sum
SELECT MIN(c1), MAX(c1) FROM t; 	-- Min and Max
SELECT * FROM t WHERE c1 		-- The IN operator allows you to specify multiple values in a WHERE clause
	IN (value1, value2);                                
SELECT * FROM t WHERE c1 		-- The BETWEEN operator is inclusive: begin and end values are included
	BETWEEN value1 AND value2;   
SELECT SUBSTRING_INDEX(`c1`, '/', 1)	-- Substrings to capture part of a string
	AS c FROM t;
  
-- Do you love LIKE?
-- Wherever possible use equality instead of LIKE predicate as it slow down the query
SELECT * FROM t WHERE c1 LIKE 'a%';	 -- Returns any values that start with "a"
SELECT * FROM t WHERE c1 LIKE '%a';	 -- Returns any values that end with "a" - but avoid the leading wildcard (%) if possible
SELECT * FROM t WHERE c1 LIKE '%or%';	 -- Returns any values that have "or" in any position - but avoid the leading wildcard (%) if possible
SELECT * FROM t WHERE c1 LIKE '_r%';	 -- Returns any values that have "r" in the second position
SELECT * FROM t WHERE c1 LIKE 'a_%_%';	 -- Returns any values that start with "a" and are at least 3 characters in length
SELECT * FROM t WHERE c1 LIKE 'a%o';	 -- Returns any values that start with "a" and ends with "o"

-- Other command examples
ALTER TABLE t ADD c1 VARCHAR (50);  	-- Use the ALTER command to add new columns to the table
ALTER TABLE t1 RENAME TO t2;        	-- Rename table
ALTER TABLE t RENAME COLUMN c1 TO c2;	-- Rename column. Note: Only one column at a time can be renamed
ALTER TABLE t ADD PARTITION 		-- Adds a new partition in which to store rows having the data column values 7, 14, and 21
	(PARTITION p1 VALUES IN (7, 14, 21));
INSERT INTO t(column_list) 		-- Insert one row into a table
	VALUES(value_list);  
INSERT INTO t(column_list)   		-- Insert multiple rows into a table
	VALUES(value_list, value_list);
INSERT INTO t1(colunn_list) 		-- Insert rows from one table into another
	SELECT column_list FROM t2;
UPDATE t SET c1 = value1;		-- Update new value in the column FieldName for all rows
UPDATE t SET c1 = value1, 		-- Update values in the coluns that match the value "whatever"
	c2 = value2 WHERE c1 = 'whatever'; 
DELETE FROM t WHERE c1 = 'whatever';  	-- Delete a subset of rows in a table
								  
-- Aliases
-- SQL aliases are used to give a table, or a column in a table, a temporary name
-- Aliases of tables should be meaningful
-- Aliases of columns are often used to make column names more readable
-- An alias only exists for the duration of the query.
SELECT c1 AS alias_name	FROM t;		-- Column syntax. Note: Column alias cannot be used in WHERE clause.
SELECT * FROM t AS alias_name;		-- Table syntax

-- The WITH clause
-- They are not stored in the database schema: instead, they are only valid in the query they belong to
-- The advantage of using the WITH clause is that, once you have defined your subquery, you can subsequently reference it repeatedly in your main select statement.
-- The syntax after the keyword WITH is the same as it is for CREATE VIEW 
-- WITH clause can be used for better performance instead of complex subqueries
WITH alias_name AS (SELECT c1 FROM t)    -- The keyword AS introduces the definition itself (the query)
	SELECT * FROM alias_name;

-- Subqueries
-- Doing this is very computationally expensive because SQL will evaluate the outer query first before proceeding with the inner query. 
SELECT 
    *
FROM
    t
WHERE
    c1 IN (SELECT 
            c1
        FROM
            t1);
				 
-- Using dummytable is probably better than using an IN operator to do a subquery. Alternatively, an exist operator is also better.
SELECT 
    *
FROM
    t,
    (SELECT 
        c1
    FROM
        t) AS dummytable
WHERE
    dummytable.c1 = t.c1;
				 
-- Using Subqueries in INSERT statement
INSERT INTO t 
	(c1, c2, c3) 
VALUES  
  (1, 'Of', (SELECT t2_id 
                FROM   t2 
                WHERE  c1 = 'whatever'));

-- To make queries reusable, SQL introduced views
-- Once created, a view has a name in the database schema so that other queries can use it like a table
-- Create a View
CREATE VIEW v AS SELECT c1, c2		
	FROM t ORDER BY c1 DESC;  
  
-- Modify data thorugh views
UPDATE v SET c2 = 9999
	WHERE c1 = 'whatever'; 	
	
-- Delete View
DROP VIEW v; 	
