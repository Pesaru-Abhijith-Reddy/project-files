/* task 1*/
SELECT CONCAT(FIRST_NAME, '     ', LAST_NAME), SALARY FROM employees WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'AUSTIN');

/* TASK 2*/
SELECT concat(first_name, '       ', last_name) as full_name, department_id 
FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_NAME = 'Human Resources');


/* Task 3*/
select concat(first_name, '       ', last_name) as full_name, manager_id from employees where manager_id 
in (select manager_id from departments where location_id 
in (select location_id from locations where country_id = (select country_id from countries where country_name = 'United Kingdom')));

/* Task 4*/
select concat(first_name, '       ', last_name) as full_name, salary from employees where salary > any(select avg(salary) from employees);   

/* Task 5*/
select concat(first_name, '       ', last_name) as full_name, salary from employees where department_id in
(select department_id from departments where department_name like '%sales') and salary < (select avg(salary) from employees);


/* Task 6*/
select employee_id, concat(first_name, '      ', last_name) as Full_name, job_id, salary, department_id from employees where salary > 
all(select salary from employees where job_id = 'IT_PROG') order by salary asc;

/* Task 7*/
select employee_id, first_name, last_name, (select department_name from departments as D
where A.department_id = D.department_id) departments from employees As A;

/*Task 8*/
select employee_id, concat(first_name, '    ', last_name) as Full_name, salary, department_id 
from employees where salary > any(select Avg(salary) from employees group by department_id);





