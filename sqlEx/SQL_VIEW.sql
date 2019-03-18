
-- 뷰정의
create table dept_copy
as
select * from departments;

create table emp_copy
as
select * from employees;

select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT_COPY';

-- 뷰의 필요성
create view emp_view30  -- 해당 테이블이 물리적으로 존재하지 않음
as
select employee_id, first_name, last_name, department_id
from emp_copy
where department_id=30;

select * from emp_view30;

create view emp_view20
as
select employee_id, first_name, last_name, department_id, manager_id
from emp_copy
where department_id=20;

select * from emp_view20;

-- 컬럼에 별칭 부여
create or replace -- 없으면 새로 만들고 있으면 대체
view emp_view(사원번호, 사원명, 급여, 부서번호)
as
select employee_id, first_name || ' ' || last_name, salary, department_id
from emp_copy;
select * from emp_view;

-- 뷰 확인
select view_name, text
from user_views;

-- 조인 테이블을 기본 테이블로하여 뷰 만들기
create or replace
view emp_dept_view
as
select e.employee_id, e.first_name || ' ' || e.last_name full_name,
      e.salary, d.department_id, d.department_name
from emp_copy e, dept_copy d
where e.department_id = d.department_id
order by e.employee_id desc;

select * from emp_dept_view
where department_id = 50;

-- 뷰 삭제
drop view emp_view;

-- 뷰를 활용한 TOP-N구하기
select rownum, employee_id, last_name, hire_date
from employees;

select rownum, employee_id, last_name, hire_date
from employees
order by hire_date;

create or replace view view_hire
as
select employee_id, last_name, hire_date
from employees
order by hire_date;

select rownum, employee_id, last_name, hire_date
from view_hire
where rownum <= 5;
