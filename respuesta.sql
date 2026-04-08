SELECT p.productname
FROM products p
JOIN orderdetails od ON p.productid = od.productid
JOIN orders o ON od.orderid = o.orderid
GROUP BY p.productid, p.productname
HAVING COUNT(DISTINCT o.employeeid) = (SELECT COUNT(*) FROM employees);


SELECT c.CompanyName
FROM customers c

WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.CustomerID = c.CustomerID)

AND NOT EXISTS (
    SELECT 1
    FROM orders o
    INNER JOIN orderdetails od ON o.OrderID   = od.OrderID
    INNER JOIN products p ON od.ProductID = p.ProductID
    WHERE o.CustomerID = c.CustomerID
    AND p.UnitPrice >= 50);



SELECT DISTINCT e.title, e.firstname, e.lastname
FROM employees e
JOIN orders o ON e.employeeid = o.employeeid
JOIN orderdetails od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid
WHERE p.productname IN ('Gravad Lax', 'Mishi Kobe Niku');

SELECT e.firstname, e.lastname, c.companyname
FROM orders o
JOIN employees e ON o.employeeid = e.employeeid
JOIN customers c ON o.customerid = c.customerid
JOIN shippers s  ON o.shipvia = s.shipperid
WHERE s.companyname = 'Speedy Express' AND c.city = 'Bruxelles';

SELECT DISTINCT e.firstname, e.lastname, e.address, e.city, e.region
FROM employees e
JOIN orders o ON e.employeeid = o.employeeid
WHERE o.shipcountry = 'Belgium';