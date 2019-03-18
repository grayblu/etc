
select sum(salary) from employees;
select avg(salary) from EMPLOYEES;
select max(salary), min(salary) from EMPLOYEES;
select max(hire_date)����, min(hire_date)���� from EMPLOYEES;

select count(commission_pct) from employees;
select count(*), count(commission_pct) from EMPLOYEES;
select count(*) total, ceil(count(*)/10) total_page from EMPLOYEES;
select count(job_id) from employees;
select count(DISTINCT job_id) from employees;

select count(*) from EMPLOYEES where DEPARTMENT_ID = '80';
select count(COMMISSION_PCT) from EMPLOYEES where count(COMMISSION_PCT) > 10;

--GROUP BY ��
select department_id from employees group by department_id;

select round(avg(salary),2) from employees group by department_id order by avg(salary) desc;

select department_id, count(*), count(commission_pct) from EMPLOYEES GROUP BY DEPARTMENT_ID;
select DEPARTMENT_ID, COUNT(MANAGER_ID) from employees group by DEPARTMENT_ID;

--HAVING����: GROUP�� ����� ������ �� ���
select department_ID, avg(salary) from employees
group by department_id having avg(salary) > 5000;