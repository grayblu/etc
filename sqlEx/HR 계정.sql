SELECT * FROM EMPLOYEES;

SELECT * FROM departments;

select * from tab;

desc employees;

select employee_id, email -- SELECT Àý
from employees;           -- FROM Àý

select last_name, salary, salary*12
from EMPLOYEES;

select last_name, salary, commission_pct, salary*12, salary*12+salary*12*commission_pct
from employees;

select last_name, salary, NVL(commission_pct,0) as commission, salary*12, salary*12+salary*12*NVL(commission_pct,0) as annsal
from employees;

select last_name || ' is a ' || job_id
from EMPLOYEES;

select distinct JOB_ID
from EMPLOYEES;

select employee_id, first_name || ' ' || last_name, salary
from employees
where salary >= 10000;

select * from employees
where DEPARTMENT_ID = 10;

select employee_id, last_name, salary
from EMPLOYEES
where salary >= 10000;

select employee_id, first_name, last_name, salary
from EMPLOYEES
where LAST_NAME= 'King';

select * from EMPLOYEES where HIRE_DATE <= '2003/01/01';

select * from employees
where department_id = 110 and job_id = 'AC_MGR';
select * from employees where department_id = 110 or job_id = 'AC_MGR';
select * from employees where department_id <> 110;

SELECT * FROM employees
where salary >= 5000 or salary <= 7000;

SELECT * FROM EMPLOYEES
where hire_date between '2000/01/01' and '2003/01/01';

SELECT * FROM EMPLOYEES
where COMMISSION_PCT in (0.1, 0.2, 0.3);

select last_name, salary from EMPLOYEES
where EMPLOYEE_ID in (116, 186, 204);

select last_name, salary from EMPLOYEES
where EMPLOYEE_ID not in (116, 186, 204);

select last_name, salary from EMPLOYEES
where EMPLOYEE_ID <> 116 and EMPLOYEE_ID <> 186 and EMPLOYEE_ID <> 204;

select * from EMPLOYEES
where last_name like '_a%';

SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;

SELECT * FROM EMPLOYEES
where last_name not like '%K%';

SELECT * FROM EMPLOYEES
where commission_pct is not null;

SELECT * from EMPLOYEES
where MANAGER_ID is null;

select * from employees order by salary DESC;

select * from employees order by salary asc, FIRST_NAME desc;

select EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from employees order by HIRE_DATE;

select employee_id, first_name from EMPLOYEES order by EMPLOYEE_ID desc;

select employee_id, hire_date, first_name || ' ' || last_name as name, salary from EMPLOYEES
order by department_id, hire_date;


select last_name, salary*12+salary*12*NVL(commission_pct,0) as annsal
from employees
where salary*12+salary*12*NVL(commission_pct,0) >= 50000 -- where annsal >= 50000 (x)
order by annsal;


select 24*60
from EMPLOYEES;

select 24*60
from dual;