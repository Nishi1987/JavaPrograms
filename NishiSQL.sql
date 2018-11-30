--###  CREATE a table ###---

CREATE TABLE employees
( 	employee_number number(10) 	not null,
  	employee_name 	varchar2(50) 	not null,
  	department_id 	number(10), 	
  	salary 	number(6), 	
  	CONSTRAINT employees_pk PRIMARY KEY (employee_number),
  	
); 	


CREATE TABLE SUPPLIER
( supplier_id 	numeric(10) 	not null,
	supplier_name 	varchar2(50) 	not null,
	contact_name 	varchar2(50), 	
	CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
);



--child table
CREATE TABLE products
( 	product_id 	numeric(10) 	not null,
	supplier_id 	numeric(10) 	not null,
	CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
	
);


--child table
CREATE TABLE products
( 	product_id 	numeric(10) 	not null,
	Id 	numeric(10) 	not null,
	CONSTRAINT fk_supplier FOREIGN KEY (Id) REFERENCES supplier(supplier_id)
	
);


---------Unique Constraints--------

--A unique constraint is a single field or combination of fields that uniquely defines a record. Some of the fields can contain null values as long as the combination of values is unique.

CREATE TABLE supplier
( 	supplier_id 	numeric(10) 	not null,
	supplier_name 	varchar2(50) 	not null,
	contact_name 	varchar2(50), 	
	CONSTRAINT supplier_unique UNIQUE (supplier_id, supplier_name)
)

CREATE TABLE supplier
( 	supplier_id 	numeric(10) 	not null,
	supplier_name 	varchar2(50) 	not null,
	contact_name 	varchar2(50), 	
	CONSTRAINT supplier_unique UNIQUE (supplier_id)
)


--child table
CREATE TABLE products
( 	product_id 	numeric(10) 	not null,
	Id 	numeric(10) 	not null,
	CONSTRAINT fk_supplier FOREIGN KEY (Id) REFERENCES supplier(supplier_id)
	
);

---Insert 

--- update

-- delete 

-- trunkate


----####  Joins ----#####


---Simple join 


SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
FROM suppliers, orders
WHERE suppliers.supplier_id = orders.supplier_id;




----Outer Join---- left outer join and Right  outer join


--A left outer join retains all of the rows of the left table, regardless of whether there is a row that matches on the right table.
--Rows which are not matching in right table null values will be displayed.
Employee.EmpID	 Employee.EmpName	 Location.EmpID	 Location.EmpLoc
13	 Jason	 13	 San Jose
8	 Alex	 8	 Los Angeles
3	 Ram	 3	 Pune, India
17	 Babu	 17	 Chennai, India
25	 Johnson	 NULL	 NULL


select suppliers.supplier_id, suppliers.supplier_name, orders.order_date
from suppliers, orders
where orders.supplier_id(+) = suppliers.supplier_id



select * 
from employee left outer join location 
on employee.empID = location.empID;



--A right outer join retains all of the rows of the right table, regardless of whether there is a row that matches on the left table.
--Rows which are not matching in left table null values will be displayed.


select suppliers.supplier_id, suppliers.supplier_name, orders.order_date
from suppliers, orders
where suppliers.supplier_id = orders.supplier_id(+);


select * from employee right outer join location 
on employee.empID = location.empID;


Employee.EmpID	 Employee.EmpName	 Location.EmpID	 Location.EmpLoc
13	 Jason	 13	 San Jose
8	 Alex	 8	 Los Angeles
3	 Ram	 3	 Pune, India
17	 Babu	 17	 Chennai, India
NULL	 NULL	 39	 Bangalore, India






----####################------------Inner Joins-----------##############---------


Now that we have gone over outer joins, we can contrast those with the inner join. The difference between an inner join and an outer join is that an inner join will 
return only the rows that actually match based on the join predicate. Once again, this is best illustrated via an example. 
Here�s what the SQL for an inner join will look like:


select * from employee, location
where employee.empID = location.empID

select * from employee inner join location on 
employee.empID = location.empID
This can also be written as:


Employee.EmpID	 Employee.EmpName	 Location.EmpID	 Location.EmpLoc
13	 Jason	 13	 San Jose
8	 Alex	 8	 Los Angeles
3	 Ram	 3	 Pune, India
17	 Babu	 17	 Chennai, India





----ORDER BY Clause

SELECT columns
FROM tables
WHERE predicates
ORDER BY column ASC/DESC;

--ASC indicates ascending order. (default)
--DESC indicates descending order.


--You can also sort by relative position in the result set, where the first field in the result set is 1. The next field is 2, and so on.

    SELECT supplier_city
    FROM suppliers
    WHERE supplier_name = 'IBM'
    ORDER BY 1 DESC


----HAVING Clause
--The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
--aggregate functions
--AVG – calculates the average of a set of values.
--COUNT – counts rows in a specified table or view.
--MIN – gets the minimum value in a set of values.
--MAX – gets the maximum value in a set of values.
--SUM – calculates the sum of values.

SELECT department, SUM(sales) as "Total sales"
FROM order_details
GROUP BY department
HAVING SUM(sales) > 1000;    
    
 --------------------   
	
    Select COUNT(*)
	FROM
    products;
--------------------------------

	SELECT 
    AVG(unitsinstock)
	FROM
    products;
	
	----------------------
	SELECT 
    categoryid, AVG(unitsinstock)
	FROM products
   GROUP BY categoryid;
   
 ---------------  
   SELECT 
    categoryid, SUM(unitsinstock)
FROM
    products
GROUP BY categoryid;
----------

SELECT 
    MIN(unitsinstock)
FROM
    products;
	
----SELECT 
    MAX(unitsinstock)
FROM
    products;
	
		
-----BETWEEN Condition


SELECT * 
FROM suppliers
WHERE supplier_id between 5000 AND 5010;



SELECT *
FROM suppliers
WHERE supplier_id not between 5000 and 5500;


-----In Condition and no in

SELECT *
FROM suppliers
WHERE supplier_name in ( 'IBM', 'Hewlett Packard', 'Microsoft');


SELECT *
FROM suppliers
WHERE supplier_name not in ( 'IBM', 'Hewlett Packard', 'Microsoft');


----Union Query ----------

--The UNION query allows you to combine the result sets of 2 or more "select" queries. It removes duplicate rows between the various "select" statements.

--Each SQL statement within the UNION query must have the same number of fields in the result sets with similar data types.




select field1, field2, . field_n
from tables
UNION
select field1, field2, . field_n
from tables;




--The UNION ALL query allows you to combine the result sets of 2 or more "select" queries. It returns all rows (even if the row exists in more than one of the "select" statements).

--Each SQL statement within the UNION ALL query must have the same number of fields in the result sets with similar data types.


select field1, field2, . field_n
from tables
UNION ALL
select field1, field2, . field_n
from tables;



-----DISTINCT -------


SELECT DISTINCT columns
FROM tables
WHERE predicates;


------INSERT Statement----------

INSERT INTO suppliers
(supplier_id, supplier_name)
VALUES
(24553, 'IBM');




-------------------------------Questions---------------


--What is the point of having a foreign key?
--Foreign keys are used to reference unique columns in another table. So, for example, a foreign key can be defined on one table A, and it can reference some unique column(s) in another table 


--Can a table have multiple unique, foreign, and/or primary keys?
--A table can have multiple unique and foreign keys. However, a table can have only one primary key.

--Can a unique key have NULL values? Can a primary key have NULL values?
--Unique key columns are allowed to hold NULL values. The values in a primary key column, however, can never be NULL.

--Can a foreign key reference a non-primary key?
--Yes, a foreign key can actually reference a key that is not the primary key of a table. But, a foreign key must reference a unique key.

--Can a foreign key contain null values?
--Yes, a foreign key can hold NULL values. Because foreign keys can reference unique, non-primary keys � which can hold NULL values � this means that foreign keys can themselves hold NULL values as well.

--How many ways we can improve database table performance (read/write)?
a.	Index
b.	Store Procedure
c.	Joins (Inner/Outer - differences)?


--Find 2nd Highest Salary

--Question 1: SQL Query to find second highest salary of Employee
--Answer: There are many ways to find second highest salary of Employee in SQL, you can either use SQL Join or Subquery to solve this problem.

SELECT MAX(PRS_EP075_AMT)
FROM XATESTSTAL1.XAT_PROP_END_REF_SPJ
WHERE PRS_EP075_AMT <
  (SELECT MAX(PRS_EP075_AMT) FROM XATESTSTAL1.XAT_PROP_END_REF_SPJ
  );
  
  
  
SELECT PRS_EP075_AMT
FROM XATESTSTAL1.XAT_PROP_END_REF_SPJ
WHERE ROWNUM =2
ORDER BY PRS_EP075_AMT DESC;


--Question 2- SQL Query to find second highest salary of Employee
--Answer: You can find the maximum salary for each department by grouping all records by DeptId and then using MAX() function to calculate maximum salary in each group or each department.

SELECT DeptID, MAX(Salary) 
FROM Employee 
GROUP BY DeptID. 

--These questions become more interesting if Interviewer will ask you to print department name instead of department id, in that case, you need to join Employee table with Department using foreign key DeptID, make sure you do LEFT or RIGHT OUTER JOIN to include departments without any employee as well.  Here is the query


SELECT DeptName, MAX(Salary) 
FROM Employee e RIGHT JOIN Department d 
ON e.DeptId = d.DeptID GROUP BY DeptName;


--Question 5: Write an SQL Query to print the name of the distinct employee whose DOB is between 01/01/1960 to 31/12/1975.

--Answer: This SQL query is tricky, but you can use BETWEEN clause to get all records whose date fall between two dates.
SELECT DISTINCT EmpName 
FROM Employees
WHERE DOB  BETWEEN ‘01/01/1960’ AND ‘31/12/1975’;


--Question 6: Write an SQL Query find number of employees according to gender  whose DOB is between 01/01/1960 to 31/12/1975.
SELECT COUNT(*), sex 
from Employees 
WHERE DOB BETWEEN '01/01/1960' AND '31/12/1975' GROUP BY sex


--Question 7: Write an SQL Query to find an employee whose Salary is equal or greater than 10000.

SELECT EmpName FROM  Employees WHERE  Salary>=10000;

--Question 8: Write an SQL Query to find name of employee whose name Start with ‘M’

SELECT * FROM Employees WHERE EmpName like 'M%';


--Question 9: find all Employee records containing the word "Joe", regardless of whether it was stored as JOE, Joe, or joe.

SELECT * from Employees WHERE UPPER(EmpName) like '%JOE%';

--Question 12: There is a table which contains two column Student and Marks, you need to find all the students, whose marks are greater than average marks i.e. list of above average students.


SELECT student, marks from table where marks > S(ELECT AVG(marks) from table)

--Question 13: How do you find all employees which are also manager? .
--Answer: You need to know about self-join to solve this problem. In Self Join, you can join two instances of the same table to find out additional details as shown below


SELECT e.name, m.name FROM Employee e, Employee m WHERE e.mgr_id = m.emp_id;

--Question 11: Write SQL Query to find duplicate rows in a database? and then write SQL query to delete them?


SELECT * 
FROM emp a 
WHERE rowid = (SELECT MAX(rowid) FROM EMP b WHERE a.empno=b.empno)


DELETE FROM emp a WHERE rowid != (SELECT MAX(rowid) FROM emp b WHERE a.empno=b.empno);


