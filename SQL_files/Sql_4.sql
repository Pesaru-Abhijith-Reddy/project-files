create database if not exists S3_Car_Sales_Data;
use S3_Car_Sales_Data;
create table Salesperson
(s_salesid int primary key,
s_name varchar(100) not null,
s_city varchar(100) not null default "London",
commission_rate int);
desc Salesperson;
create table Customer_Table
(c_customerid int primary key,
c_firstname varchar(100) not null,
c_lastname varchar(100) not null,
c_city varchar(100) not null default "London",
c_rating int not null,
salesid int not null,
foreign key (salesid) references Salesperson(s_salesid)
);
desc Customer_Table;
create table Orders_Table
(orderid int primary key,
amount int not null check(amount > 0),
orderdate date not null,
customerid int not null,
foreign key (customerid) references Customer_Table(c_customerid)
);
desc Orders_Table;
insert into Salesperson (s_salesid,s_name,s_city,commission_rate) values
(1001,'peei','London',12),
(1002,'serres','san jose',13),
(1003,'axelrod','new york',10),
(1004,'judith','London',11),
(1005,'fran','London',26),
(1007,'rifkin','Barcelona',15),
(1008,'john','London',0);
insert into Salesperson (s_salesid,s_name,s_city) values
(1009,'charles','Florida');
select * from Salesperson;
insert into Customer_Table (c_customerid,c_firstname,c_lastname,c_city,c_rating,salesid) values
(2001,'hoffman','Anny','london',100,1001),
(2002,'giovanni','Jenny','rome',200,1003),
(2003,'liu','Williams','san jose',100,1002),
(2004,'grass','Harry','berlin',300,1002),
(2005,'clemens','john','london',200,1001),
(2006,'cisneros','fanny','san jose',200,1007),
(2007,'pereira','jonathan','rome',300,1004);
select * from Customer_Table;
insert into Orders_Table (orderid,amount,orderdate,customerid) values
(3001,123,'2020-02-01',2007),
(3002,100,'2020-07-30',2007),
(3003,187,'2020-10-02',2001),
(3005,201,'2011-10-09',2003),
(3007,167,'2020-04-02',2002),
(3008,189,'2020-03-06',2002),
(3009,145,'2012-10-10',2005),
(3010,200,'2012-02-23',2006),
(3011,100,'2020-09-18',2004);

/* Task 1*/

SELECT * FROM Customer_Table WHERE c_city = 'london';

/* TASK 2*/

SELECT * FROM S3_Car_Sales_Data.Salesperson WHERE s_name LIKE 'P%' AND s_name LIKE '___I';

SELECT * FROM S3_Car_Sales_Data.Salesperson;

/* TASK 3*/

SELECT * FROM S3_Car_Sales_Data.Salesperson WHERE s_city = 'london' OR s_city = 'BRAZIL' OR s_city = 'SAN JOSE';

/*TASK 4*/

SELECT * FROM Customer_Table WHERE c_firstname LIKE 'A%' OR c_firstname LIKE 'G%';

/*TASK 5*/

SELECT MAX(c_rating), c_city FROM Customer_Table GROUP BY c_city ORDER BY MAX(c_rating);

/* TASK 6*/

SELECT * FROM S3_Car_Sales_Data.Salesperson WHERE s_city = 'london' OR s_city = 'Barcelona';  

/* TASK 7*/

SELECT * FROM Orders_Table WHERE orderdate BETWEEN  '2020-10-01' AND '2020-12-04'; 

/*TASK 8*/

SELECT SUM(amount) AS 'SUM OF PURCHASES'FROM Orders_Table;

/*TASK 9*/

SELECT COUNT(c_firstname) AS 'C COUNT' FROM Customer_Table;

/*TASK 10*/

SELECT CONCAT(c_firstname, '         ',c_lastname) AS 'FULL NAME' FROM Customer_Table;

/*TASK 11*/

SELECT * FROM Customer_Table WHERE c_rating BETWEEN 200 AND 300;

/* TASK 12*/

SELECT * FROM Orders_Table ORDER BY amount DESC;

/*TASK 13*/

SELECT * FROM Customer_Table ORDER BY c_firstname DESC;

/* TASK 14*/

SELECT AVG(amount) FROM Orders_Table;

/* TASK 15*/

SELECT COUNT(c_customerid), c_city FROM Customer_Table GROUP BY c_city;

/* TASK 16*/

SELECT COUNT(c_customerid), c_city FROM Customer_Table GROUP BY c_city ORDER BY COUNT(c_customerid) DESC;

/* TASK 17*/

SELECT * FROM Orders_Table WHERE MONTH(orderdate) = 04;

/* TASK 18*/

SELECT * FROM Orders_Table ORDER BY amount DESC LIMIT 5;

/*TASK 19*/

SELECT * FROM Salesperson ORDER BY commission_rate DESC LIMIT 1;
SELECT MAX(commission_rate) AS 'MAXIMUM COMMISSION', s_salesid,s_name FROM Salesperson;

/*TASK 20*/
SELECT * FROM Salesperson ORDER BY commission_rate ASC LIMIT 3;


