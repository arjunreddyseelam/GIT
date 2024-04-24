# Select all Spanish customers that starts with either "G" or "R":
SELECT * FROM Customers
WHERE Country = "Spain" AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');


# Select only the customers that are NOT from Spain:
SELECT * FROM Customers
WHERE NOT Country = 'Spain';

# Select customers that does not start with the letter 'A':
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'A%';

# Select customers with a customerID not between 10 and 60:
SELECT * FROM Customers 
WHERE CustomerID NOT BETWEEN 10 AND 60;

# Select customers that are not from Paris or London:
SELECT * FROM Customers
WHERE City NOT IN ('Paris','London');

# Select customers with a CustomerId not greater than 50:
SELECT * FROM Customers
WHERE NOT CustomerID > 50;

# Select customers with a CustomerID not less than 50:
SELECT * FROM Customers
WHERE NOT CustomerID < 50;

#INSERT INTO
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

# INSERT INTO SPECIFIC COLUMNS
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

# INSERT MULTIPLE ROWS
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

# Always use IS NULL or IS NOT NULL to test NULL values

# lists all customers with a value in the "Address" field:
SELECT CustomerName FROM Customers
WHERE Address IS NOT NULL;

# update the first customer (CustomerID = 1) with a new contact person and a new city.
UPDATE Customers 
SET CustomerName = "Arjun", City = "Hyderabad"
WHERE CustomerID = 1;

# delete the customer "Alfreds Futterkiste" from the "Customers" table
DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';

# Delete all rows from Customers
DELETE FROM Customers;

# Remove the Customers table
DROP TABLE Customers;

# Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM Customers
WHERE Country = 'Norway';

#Select only the first 3 records of the Customers table
SELECT TOP 3 * FROM Customers;

SELECT * FROM Customers LIMIT 3;

# Oracle
SELECT * FROM Customers
FETCH FIRST 3 ROWS ONLY;

# SQL TOP PERCENT Example
# Select the first 50% of the records from the "Customers" table (for SQL Server/MS Access)
SELECT TOP 50 PERCENT * FROM Customers;

# FOR ORACLE
SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY;

# select the first three records from the "Customers" table, where the country is "Germany" (for SQL Server/MS Access)
SELECT TOP 3 * FROM Customers
WHERE Country = 'Germany';

# select the first three records from the "Customers" table, where the country is "Germany" (for MySQL)
SELECT * FROM Customers
WHERE Country = 'Germany'
LIMIT 3;

# Select the first three records from the "Customers" table, where the country is "Germany" (for Oracle)
SELECT * FROM Customers
WHERE Country = 'Germany'
FETCH FIRST 3 ROWS ONLY;

# Sort the result, and return the first 3 records of the sorted result. For SQL Server and MS Access:
SELECT TOP 3 * FROM Customers
ORDER BY CustomerName DESC;

# Sort the result, and return the first 3 records of the sorted result. For MySQL:
SELECT * FROM Customers
ORDER BY CustomerName DESC
LIMIT 3;

# Sort the result, and return the first 3 records of the sorted result. For Oracle:
SELECT * FROM Customers
ORDER BY CustomerName DESC
FETCH FIRST 3 ROWS ONLY;

# Set Column Name (Alias)
# When you use MIN() or MAX(), the returned column will not have a descriptive name. To give the column a descriptive name, use the AS keyword
SELECT MIN(PRICE) AS MinimumPrice
FROM PRODUCTS;

# Use MIN() with GROUP BY
# Here we use the MIN() function and the GROUP BY clause, to return the smallest price for each category in the Products table
SELECT MIN(PRICE) AS MinimumPrice, CategoryID
FROM PRODUCTS
GROUP BY CategoryID;

# SQL COUNT()
# Find the total number of rows in the Products table:
SELECT COUNT(*) FROM PRODUCTS;

# You can specify a column name instead of the asterix symbol (*). If you specify a column name instead of (*), NULL values will not be counted.
# Find the number of products where the ProductName is not null
SELECT COUNT(ProductName)
FROM PRODUCTS;

# Find the number of products where Price is higher than 20:
SELECT COUNT(ProductID)
FROM PRODUCTS
WHERE PRICE > 20;

# How many different prices are there in the Products table
SELECT COUNT(DISTINCT Price)
FROM PRODUCTS;

# Give the counted column a name by using the AS keyword.
SELECT COUNT(*) AS [Number of Records]
FROM PRODUCTS;

# Use COUNT() with GROUP BY
# Here we use the COUNT() function and the GROUP BY clause, to return the number of records for each category in the Products table
SELECT COUNT(*) AS [Number of Records], CategoryID
FROM PRODUCTS
GROUP BY CategoryID;

# SQL SUM() Function
# The SUM() function returns the total sum of a numeric column.
# Return the sum of all Quantity fields in the OrderDetails table
SELECT SUM(QUANTITY)
FROM OrderDetails;

# Return the sum of the Quantity field for the product with ProductID 11:
SELECT SUM(QUANTITY)
FROM OrderDetails
WHERE ProductID = 11;

# Name the column "total"
SELECT SUM(QUANTITY) AS total
FROM OrderDetails;

# Use the SUM() function and the GROUP BY clause, to return the Quantity for each OrderID in the OrderDetails table
SELECT OrderID, SUM(QUANTITY) AS [TOTAL QUANTITY]
FROM OrderDetails
GROUP BY OrderID;

# SUM() With an Expression
# The parameter inside the SUM() function can also be an expression.
# If we assume that each product in the OrderDetails column costs 10 dollars, we can find the total earnings in dollars by multiply each quantity with 10:

# Use an expression inside the SUM() function
SELECT SUM(QUANTITY * 10)
FROM OrderDetails;

# We can also join the OrderDetails table to the Products table to find the actual amount, instead of assuming it is 10 dollars
# Join OrderDetails with Products, and use SUM() to find the total amount
SELECT SUM(PRICE * QUANTITY)
FROM OrderDetails
LEFT JOIN PRODUCTS ON OrderDetails.ProductID = Products.ProductID;

# SQL AVG() Function
# The AVG() function returns the average value of a numeric column.
# Find the average price of all products
SELECT AVG(PRICE)
FROM PRODUCTS;

# Return the average price of products in category 1
SELECT AVG(PRICE)
FROM PRODUCTS 
WHERE CategoryID = 1;

# Name the column "average price"
SELECT AVG(PRICE) AS [average price]
FROM PRODUCTS;

# Return all products with a higher price than the average price
SELECT * FROM PRODUCTS
WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS);

# Use AVG() with GROUP BY
SELECT AVG(PRICE) AS AveragePrice, CategoryID
FROM PRODUCTS
GROUP BY CategoryID;

# SQL LIKE Operator
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- There are two wildcards often used in conjunction with the LIKE operator:

--  The percent sign % represents zero, one, or multiple characters
--  The underscore sign _ represents one, single character

# Select all customers that starts with the letter "a"
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# The _ Wildcard. The _ wildcard represents a single character. It can be any character or number, but each _ represents one, and only one, character.
# Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters
SELECT * FROM Customers
WHERE City LIKE 'L_nd__';

# The % Wildcard
# The % wildcard represents any number of characters, even zero characters
# Return all customers from a city that contains the letter 'L'.
SELECT * FROM Customers
WHERE City LIKE '%L%';

# Return all customers that starts with 'La'
SELECT * FROM Customers
WHERE CustomerName LIKE 'La%';

# Return all customers that starts with 'a' or starts with 'b'
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' or CustomerName LIKE 'b%';

# Return all customers that ends with 'a'
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

# Return all customers that starts with "b" and ends with "s"
SELECT * FROM Customers
WHERE CustomerName LIKE 'b%s';

# Return all customers that contains the phrase 'or'
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

# Return all customers that starts with "a" and are at least 3 characters in length
SELECT * FROM Customers
WHERE CustomerName LIKE 'a___%';

# Return all customers that have "r" in the second position
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

# Return all customers from Spain
SELECT * FROM Customers
WHERE Country LIKE 'Spain';

# SQL Wildcard Characters
# Return all customers that starts with the letter 'a'
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# Return all customers that ends with the pattern 'es'
SELECT * FROM Customers
WHERE CustomerName LIKE '%es';

# Return all customers that contains the pattern 'mer'
SELECT * FROM Customers
WHERE CustomerName LIKE '%mer%';

# Using the _ Wildcard
# Return all customers with a City starting with any character, followed by "ondon"
SELECT * FROM Customers
WHERE City LIKE '_ondon';

# Return all customers with a City starting with "L", followed by any 3 characters, ending with "on"
SELECT * FROM Customers
WHERE City LIKE 'L___on';

# Using the [] Wildcard
# The [] wildcard returns a result if any of the characters inside gets a match.
# Return all customers starting with either "b", "s", or "p"
SELECT * FROM Customers
WHERE CustomerName LIKE '[bsp]%';

# Using the - Wildcard. The - wildcard allows you to specify a range of characters inside the [] wildcard.
# Return all customers starting with "a", "b", "c", "d", "e" or "f".
SELECT * FROM Customers
WHERE CustomerName LIKE '[a-f]%';

# Combine Wildcards. Any wildcard, like % and _ , can be used in combination with other wildcards.
# Return all customers that starts with "a" and are at least 3 characters in length
SELECT * FROM Customers
WHERE CustomerName LIKE 'a___%';

# Return all customers that have "r" in the second position
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

#Return all customers from Spain
SELECT * FROM Customers
WHERE Country LIKE 'Spain';

# SQL IN Operator
# The IN operator allows you to specify multiple values in a WHERE clause. The IN operator is a shorthand for multiple OR conditions.
# Return all customers from 'Germany', 'France', or 'UK'
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

# Return all customers that are NOT from 'Germany', 'France', or 'UK':
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

# IN (SELECT)
# You can also use IN with a subquery in the WHERE clause.
# Return all customers that have an order in the Orders table
SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

# Return all customers that have NOT placed any orders in the Orders table
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

# SQL BETWEEN Operator
# The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates. The BETWEEN operator is inclusive: begin and end values are included.
# Selects all products with a price between 10 and 20
SELECT * FROM PRODUCTS
WHERE PRICE BETWEEN 10 AND 20;

# Selects all products with a price not between 10 and 20
SELECT * FROM PRODUCTS
WHERE PRICE NOT BETWEEN 10 AND 20;

# BETWEEN with IN
# select all products with a price between 10 and 20. In addition, the CategoryID must be either 1,2, or 3
SELECT * FROM PRODUCTS
WHERE PRICE BETWEEN 10 AND 20
AND CategoryID IN (1,2,3);

# BETWEEN Text Values
# selects all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni
SELECT * FROM PRODUCTS
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

# NOT BETWEEN
# selects all products with a ProductName not between Carnarvon Tigers and Mozzarella di Giovanni
SELECT * FROM PRODUCTS
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

# BETWEEN Dates
# selects all orders with an OrderDate between '01-July-1996' and '31-July-1996'
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

# SQL Aliases
# create two aliases, one for the CustomerID column and one for the CustomerName column
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

# Using Aliases With a Space Character
# Using [square brackets] for aliases with space characters
SELECT ProductName AS [My Great Products]
FROM Products;

# Using "double quotes" for aliases with space characters
SELECT ProductName AS "My Great Products"
FROM Products;

# Concatenate Columns. Create an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
SELECT CustomerName, Address + ',' PostalCode + ',' City + ',' Country AS Address
FROM Customers;

# Concatenate Columns. Create an alias named "Address" that combine four columns (Address, PostalCode, City and Country) in MySQL
SELECT CustomerName, CONCAT(Address,',' PostalCode,',' City,',' Country) AS Address
FROM Customers;

# Concatenate Columns. Create an alias named "Address" that combine four columns (Address, PostalCode, City and Country): in Oracle
SELECT CustomerName, (Address || ',' || PostalCode || ',' City || ',' || Country) AS Address
FROM Customers;

# Refer to the Customers table as Persons instead
SELECT * FROM Customers AS Persons;

# The following SQL statement selects all the orders from the customer with CustomerID=4 (Around the Horn). 
# We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively (Here we use aliases to make the SQL shorter):
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName = 'Around the Horn' AND c.CustomerID = o.CustomerID

# SQL statement is the same as above, but without aliases
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName = 'Around the Horn' AND Customers.CustomerID = Orders.OrderID

# Inner Join
# Join the Products table with the Categories table, by using the CategoryID field from both tables
SELECT ProductID, ProductName, CategoryID
FROM Products
INNER JOIN Categories ON
Products.CategoryID = Categories.CategoryID;

# JOIN and INNER JOIN will return the same result.
SELECT Products.ProductID, Products.ProductName, Categories.CategoryID
FROM PRODUCTS 
JOIN Categories ON
Products.CategoryID = Categories.CategoryID;

# Join 3 tables that selects all orders with customer and shipper information.
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((ORDERS
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

# Left Join Example. The following SQL statement will select all customers, and any orders they might have
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

# RIGHT JOIN Example. The following SQL statement will return all employees, and any orders they might have placed
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

# SQL FULL OUTER JOIN Example. The following SQL statement selects all customers, and all orders:
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

# Self Join Example. The following SQL statement matches customers that are from the same city.
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

# SQL UNION Operator
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
-- Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order

# The following SQL statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table:
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

# The following SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table:
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

# The following SQL statement returns the German cities (duplicate values also) from both the "Customers" and the "Suppliers" table
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

# The following SQL statement lists all customers and suppliers
SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

# SQL GROUP BY. The following SQL statement lists the number of customers in each country
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

# The following SQL statement lists the number of customers in each country, sorted high to low
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

# GROUP BY With JOIN Example
# The following SQL statement lists the number of orders sent by each shipper
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

# SQL HAVING Clause. following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers.
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

# The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers)
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;



















