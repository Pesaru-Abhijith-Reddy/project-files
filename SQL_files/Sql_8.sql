/* TASK 1*/
SELECT CONCAT(FIRST_NAME, '       ', LAST_NAME) AS FULL_NAME, city FROM departments AS D INNER JOIN employees AS E ON D.department_id = E.department_id
INNER JOIN locations AS L ON L.location_id = D.location_id; 
/* TASK 2*/

SELECT first_name, last_name, department_name, J.job_id, salary, city FROM employees AS E INNER JOIN departments AS D ON E.department_id = D.department_id 
INNER JOIN jobs AS J ON E.job_id = J.job_id
INNER JOIN locations AS L ON L.location_id = D.LOCATION_ID WHERE city = 'LONDON';

/* TASK 3*/

SELECT city, AVG(salary) FROM locations AS L INNER JOIN departments AS D ON L.location_id = D.location_id
INNER JOIN employees AS E ON E.department_id = D.department_id 
GROUP BY city ORDER BY AVG(SALARY) LIMIT 5;

/* TAS 4*/

SELECT E.MANAGER_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, CONCAT(FIRST_NAME, '    ', LAST_NAME) AS EMPLOYEE_NAME, E.EMPLOYEE_ID
FROM DEPARTMENTS AS D INNER JOIN EMPLOYEES AS E ON D.department_ID = E.DEPARTMENT_ID;

