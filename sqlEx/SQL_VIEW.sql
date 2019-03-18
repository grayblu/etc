
-- ������
create table dept_copy
as
select * from departments;

create table emp_copy
as
select * from employees;

select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT_COPY';

-- ���� �ʿ伺
create view emp_view30  -- �ش� ���̺��� ���������� �������� ����
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

-- �÷��� ��Ī �ο�
create or replace -- ������ ���� ����� ������ ��ü
view emp_view(�����ȣ, �����, �޿�, �μ���ȣ)
as
select employee_id, first_name || ' ' || last_name, salary, department_id
from emp_copy;
select * from emp_view;

-- �� Ȯ��
select view_name, text
from user_views;

-- ���� ���̺��� �⺻ ���̺���Ͽ� �� �����
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

-- �� ����
drop view emp_view;

-- �並 Ȱ���� TOP-N���ϱ�
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
