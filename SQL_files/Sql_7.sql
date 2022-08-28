/* TASK 1*/
CREATE DATABASE IF NOT EXISTS WAT_A_PIZZA;

/* TASH 2*/

CREATE TABLE MENU
(
ITEM_ID INT PRIMARY KEY,
ITEM_NAME VARCHAR(300),
P_SIZE VARCHAR(300),
CAT_NAME VARCHAR(300),
CRUST VARCHAR(300),
PRICE INT
);

INSERT INTO MENU(ITEM_ID, ITEM_NAME, P_SIZE, CAT_NAME, CRUST, PRICE)
VALUES (01, 'GOLDEN_CORN', 'SMALL', 'VEG', 'CHEESE_BURST', 99),
	   ( 02, 'MARGHERITA', 'SMALL', 'VEG', 'HAND_TOSSED', 199),
       (03, 'PANEER', 'LARGE', 'VEG', 'CHEESE_BURST', 629),
       (04, 'MEXICAN', 'MEDIUM', 'VEG', 'THIN_CRUST', 699);
       
SELECT * FROM MENU;



CREATE TABLE TOPPING_TABLE
(
TOPPING_ID INT PRIMARY KEY,
TOPPING_NAME VARCHAR(300),
TOPPING_PRICE  INT
);

INSERT INTO TOPPING_TABLE(TOPPING_ID, TOPPING_NAME, TOPPING_PRICE)
VALUES (11, 'PEPPERONI', 100),
	   (12, 'ONIONS', 100);
       
INSERT INTO TOPPING_TABLE(TOPPING_ID, TOPPING_NAME, TOPPING_PRICE)
VALUES (13, 'CHEESE', 100),
	   (14, 'OLIVIE', 100);
SELECT * FROM TOPPING_TABLE;
/* TASK 3*/

CREATE TABLE CUSTOMER_TABLE
(
CUST_ID INT PRIMARY KEY,
CUST_NAME VARCHAR(300),
CUST_CITY VARCHAR(300)
);

INSERT INTO CUSTOMER_TABLE(CUST_ID, CUST_NAME, CUST_CITY)
VALUES (21, 'ROHIT', 'HYDERABAD'),
	   (22, 'LOHIT', 'BANGALORE'),
       (23, 'MOHIT', 'MUMBAI'),
       (24, 'NIKHIL', 'DELHI');
       
/* TASK 4*/
CREATE TABLE ORDER_TABLE
(
O_ID INT,
O_DATE DATE,
CUST_ID INT,
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER_TABLE(CUST_ID),
ITEM_ID INT,
FOREIGN KEY (ITEM_ID) REFERENCES MENU(ITEM_ID),
DELIVERY_TYPE VARCHAR(300),
QUANTITY INT,
ORDER_AMOUNT INT,
TOPPING_ID INT
);

ALTER TABLE ORDER_TABLE MODIFY TOPPING_ID INT PRIMARY KEY;

INSERT INTO ORDER_TABLE(O_ID, O_DATE, CUST_ID, ITEM_ID, DELIVERY_TYPE, QUANTITY, ORDER_AMOUNT, TOPPING_ID)
VALUES (31, '2022-01-01', 21, 01, 'OFFLINE', 1, 199, 11),
       (32, '2022-02-02', 22, 03, 'OFFLINE', 1, 729, 12),
       (33, '2022-03-03', 23, 04, 'HOME_DELIVERY', 1, 799, 13),
       (34, '2022-04-04', 21, 01, 'HOME_DELIVERY', 1, 199, 14);
/* TASK 5*/

INSERT INTO MENU(ITEM_ID, ITEM_NAME, P_SIZE, CAT_NAME, CRUST, PRICE)
VALUES (05, 'CHICKEN_PIZZA', 'MEDIUM', 'NON_VEG', 'HAND_TOSSED', 299);
/* TASK 6*/
INSERT INTO MENU(ITEM_ID, ITEM_NAME, P_SIZE, CAT_NAME, CRUST, PRICE)
VALUES (06, 'CHICKEN_FEAST', 'LARGE', 'NON_VEG', 'CHEESE_BURST', 699);

/* TASK 7*/

SELECT * FROM MENU;

/* TASK 8*/

SELECT C.CUST_NAME, M.P_SIZE FROM CUSTOMER_TABLE AS C INNER JOIN ORDER_TABLE AS O ON C.CUST_ID = O.CUST_ID
INNER JOIN MENU AS M ON M.ITEM_ID = O.ITEM_ID WHERE P_SIZE = 'LARGE';
/* TASK 9*/

SELECT * FROM TOPPING_TABLE AS T INNER JOIN ORDER_TABLE AS O ON T.TOPPING_ID = O.TOPPING_ID
GROUP BY O.TOPPING_ID ORDER BY COUNT(O.TOPPING_ID);           -- ALL TOPPINGS ARE ORDERED SAME NUMBER OF TIMES.


/* TASK 10*/



/* TASK 11*/
SELECT DELIVERY_TYPE, M.ITEM_ID, M.ITEM_NAME, C.CUST_NAME FROM CUSTOMER_TABLE AS C INNER JOIN ORDER_TABLE AS O ON C.CUST_ID = O.CUST_ID
INNER JOIN MENU AS M ON M.ITEM_ID = O.ITEM_ID WHERE DELIVERY_TYPE = 'HOME_DELIVERY';

/* TASK 12*/
SELECT C.CUST_NAME, M.P_SIZE, ORDER_AMOUNT AS ORIGINAL_PRICE, ORDER_AMOUNT*0.9 AS DISCOUNT_PRICE FROM CUSTOMER_TABLE AS C INNER JOIN ORDER_TABLE AS O ON C.CUST_ID = O.CUST_ID
INNER JOIN MENU AS M ON M.ITEM_ID = O.ITEM_ID WHERE P_SIZE = 'LARGE';

