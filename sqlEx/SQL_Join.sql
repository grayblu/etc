-- Equi 조인 => 공통 컬럼이 존재해야 함.
select first_name, last_name, employees.department_id, department_name from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select *
from employees
where department_id is null;  -- null을 가진 행은 제외됨.

select first_name, last_name, e.department_id, department_name from EMPLOYEES e, DEPARTMENTS d
where e.DEPARTMENT_ID = D.DEPARTMENT_ID;  -- 테이블에도 별명 가능

select first_name, last_name, salary from EMPLOYEES e, DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and department_name = 'Purchasing';

select first_name, last_name, hire_date from EMPLOYEES e, DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and department_name = 'Accounting';

-- Self Join
select first_name, last_name, manager_id from employees;
select emp.first_name || ' ' || emp.last_name || '의 매니저는 ' ||
        mgr.first_name || ' ' || mgr.last_name || '입니다.'
from employees emp, employees mgr
where emp.manager_id = mgr.employee_id;

select e.first_name, e.last_name, e.JOB_ID
from employees e, employees m
where e.manager_id = m.employee_ID and m.LAST_NAME = 'King';  -- 매니저가 King인 직원들

select e.last_name, f.last_name
from employees e, employees f;

-- Outer Join => 어느 한 쪽 테이블에 조인 조건에 명시된 컬럼에 값이 없거나(NULL 이더라도) 해당 ROW가 아예 없더라도 데이터를 모두 추출
select emp.first_name || ' ' || emp.last_name || '의 매니저는 ' ||
        mgr.first_name || ' ' || mgr.last_name || '입니다.'
from employees emp, employees mgr
where emp.manager_id = mgr.employee_id(+); -- Steven King의 매니저가 없으나 데이터 추출됨

-- 부서명 도시명 이름
select first_name, last_name, department_name, city
from employees e, departments d, locations l
where d.location_id = l.LOCATION_ID(+) and e.department_id = d.department_id(+) and city = 'Seattle';


