-- Sub Query
select department_name
from departments
where department_id = ( select department_id
                        from employees
                        where last_name = 'Lee');
select department_id, department_name
from departments
where location_id in ( select location_id
                        from locations
                        where city = 'Seattle');
select first_name, last_name
from employees
where salary = ( select max(salary)
                        from employees);
select first_name, last_name, salary
from employees
where salary <= ( select avg(salary)
                        from employees);
                        
select first_name, last_name, department_id
from employees
where department_id = (
select department_id from employees where last_name = 'Jones'); 

-- �������� �� �� �ٸ� ���� ����
select department_id, last_name
from employees
where department_id in ( select department_id
                        from departments
                        where location_id = (
                        select location_id
                        from locations
                        where city='Seattle'));
                        
-- ALL ������
select first_name, last_name, salary
from employees
where salary > ALL(
            select salary
            from employees
            where DEPARTMENT_ID = 30);
            
-- ANY ������: �μ� ��ȣ�� 30���� ������� �޿� �� ���� ���� ������ ���� �޿��� �޴� ��� ����
select first_name, last_name, salary
from employees
where salary > (
            select min(salary)
            from employees
            group by department_id
            having DEPARTMENT_ID = 30);
select first_name, last_name, salary
from employees
where salary > any (
            select salary
            from employees
            where DEPARTMENT_ID = 30);
            
-- SubQuery�� from���� ����� ���
-- �μ��� �ְ� �޿��� ���� ���
select e1.department_id, first_name, last_name, salary
from employees e1,(
          select department_id, max(salary) maxsalary
          from employees
          group by department_id) e2
where e1.department_id = e2.department_id and salary = maxsalary
order by department_id;
--������ ������ �ְ� �޿���
select e1.department_id, first_name, last_name, salary
from employees e1,(
          select department_id, max(salary) maxsalary
          from employees
          where manager_id is not null
          group by department_id) e2
where e1.department_id = e2.department_id
      and salary = maxsalary
order by department_id;
-- �� ������ �� �پ� �ٲٴ� ���� ��� Ȯ�� �� ������
