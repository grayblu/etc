-- Equi ���� => ���� �÷��� �����ؾ� ��.
select first_name, last_name, employees.department_id, department_name from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select *
from employees
where department_id is null;  -- null�� ���� ���� ���ܵ�.

select first_name, last_name, e.department_id, department_name from EMPLOYEES e, DEPARTMENTS d
where e.DEPARTMENT_ID = D.DEPARTMENT_ID;  -- ���̺��� ���� ����

select first_name, last_name, salary from EMPLOYEES e, DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and department_name = 'Purchasing';

select first_name, last_name, hire_date from EMPLOYEES e, DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and department_name = 'Accounting';

-- Self Join
select first_name, last_name, manager_id from employees;
select emp.first_name || ' ' || emp.last_name || '�� �Ŵ����� ' ||
        mgr.first_name || ' ' || mgr.last_name || '�Դϴ�.'
from employees emp, employees mgr
where emp.manager_id = mgr.employee_id;

select e.first_name, e.last_name, e.JOB_ID
from employees e, employees m
where e.manager_id = m.employee_ID and m.LAST_NAME = 'King';  -- �Ŵ����� King�� ������

select e.last_name, f.last_name
from employees e, employees f;

-- Outer Join => ��� �� �� ���̺� ���� ���ǿ� ��õ� �÷��� ���� ���ų�(NULL �̴���) �ش� ROW�� �ƿ� ������ �����͸� ��� ����
select emp.first_name || ' ' || emp.last_name || '�� �Ŵ����� ' ||
        mgr.first_name || ' ' || mgr.last_name || '�Դϴ�.'
from employees emp, employees mgr
where emp.manager_id = mgr.employee_id(+); -- Steven King�� �Ŵ����� ������ ������ �����

-- �μ��� ���ø� �̸�
select first_name, last_name, department_name, city
from employees e, departments d, locations l
where d.location_id = l.LOCATION_ID(+) and e.department_id = d.department_id(+) and city = 'Seattle';


