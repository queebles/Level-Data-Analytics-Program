-- Joining tables in mySQL
-- Code developed by Danielle Lynch
-- March 17, 2019

-- Left join
-- Returns all rows from the left table, and the matching rows from the right table
SELECT 
    *
FROM
    t1
        LEFT JOIN
    t2 ON t1.key = t2.key;


-- [Exclusive] Left join (-B)
SELECT 
    *
FROM
    t1
        LEFT JOIN
    t2 ON t1.key = t2.key
WHERE
    t2.key IS NULL;

-- Inner join
-- The kind of joins where all rows that don't match the join condition exactly are eliminated.
SELECT 
    t1.key, t2.c1, t1.c2
FROM
    t1
        INNER JOIN
    t2 ON t1.key = t2.key;  

-- Right join
-- Returns all rows from the right table, and the matching rows from the left table
SELECT 
    *
FROM
    t1
        RIGHT JOIN
    t2 ON t1.key = t2.key;

-- [Exclusive] Right join (-A)
SELECT 
    *
FROM
    t1
        RIGHT JOIN
    t2 ON t1.key = t2.key
WHERE
    t1.key IS NULL;

-- [Exclusive] Full outer join
-- mySQL lacks functionality for FULL OUTER JOIN but here is a workaround.
-- Returns all rows when there is a match in either left table or right table
SELECT 
    *
FROM
    t1
        LEFT JOIN
    t2 ON t1.key = t2.key 
UNION ALL SELECT 
    *
FROM
    t1
        RIGHT JOIN
    t2 ON t1.key = t2.key
WHERE
    t1.key IS NULL;
 
-- Cross Join
-- A.k.a Cartesian Product, resultset contains the output of all possible combinations of records.
SELECT 
    c1, c2
FROM
    t1
        CROSS JOIN
    t2;

-- Self Join 
-- A self JOIN is a regular join, but the table is joined with itself
SELECT DISTINCT
    b.value1, b.field_name
FROM
    t1 AS a,
    t1 AS b
WHERE
    a.field_name = b.field_name
        AND a.value1 = '9999';
    
-- The UNION operator is used to combine the results of two or more SELECT statements (only distinct values)
-- Each SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in each SELECT statement must also be in the same order   
SELECT 
    c1
FROM
    t1 
UNION SELECT 
    c1
FROM
    t2; 
    
-- The UNION ALL operator combines the result set of two or more SELECT statements (allows duplicate values)
SELECT 
    c1
FROM
    t1 
UNION ALL SELECT 
    c1
FROM
    t2; 

-- Joining 3 tables
SELECT 
    *
FROM
    t1;
SELECT 
    *
FROM
    t2;
SELECT 
    *
FROM
    t3;
SELECT 
    *
FROM
    t1
        JOIN
    t3 ON t1.key = t3.key
        JOIN
    t2 ON t3.key = t2.key;
