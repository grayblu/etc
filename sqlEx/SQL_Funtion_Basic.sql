desc dual;
select * from dual;

select sysdate from dual;

-- ���� �Լ�
select 34.5678, round(34.5678)
from dual;
select 34.5678, round(34.5678, 2)
from dual;
select 34.5678, round(34.5678, -1)
from dual;

select trunc(34.5678, 2), trunc(34.5678, -1), trunc(34.5678) from dual;

select mod(27,2), mod(27,5), mod(27,7) from dual;
select * from employees where mod(employee_id, 2) = 1;

-- ���� ó�� �Լ�
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;
select 'WELCOME TO ORACLE', INITCAP('WELCOME TO ORACLE') from dual;

SELECT * FROM EMPLOYEES where lower(LAST_NAME) = 'king'; --LAST_NAME = initcap('king');
SELECT * FROM EMPLOYEES where lower(LAST_NAME) like '%IN%';

select length('Oracle'), length('����Ŭ') from dual;
select lengthb('Oracle'), lengthb('����Ŭ') from dual;

select SUBSTR('Welcome to Oracle',3, 4) from dual; -- �ε��� 1���� ����, ���� ������ �� ���� ������
select SUBSTR('Welcome to Oracle',-4,3) from dual; -- ������ �����ʺ��� �ؼ�
--����� �Ի� �⵵, ��, �� ��ȸ
select substr(hire_date, 1, 2)�⵵, substr(hire_date, 4, 2)��, substr(hire_date, 7, 2)��
from EMPLOYEES;
-- ���� ��¥ �Ի��� ���
select * from EMPLOYEES where substr(hire_date, 4) = substr(sysdate, 4);
-- 03�⵵ �Ի���
SELECT * FROM EMPLOYEES WHERE substr(hire_date, 1,2) = '03';
SELECT * FROM EMPLOYEES WHERE hire_date between '03/01/01' and '03/12/31';
-- last_name�� 'e'�� ������ ���
SELECT * FROM EMPLOYEES WHERE substr(LAST_NAME, -1) = 'e';
SELECT * FROM EMPLOYEES WHERE LAST_NAME like '%e';

select instr('����Ÿ���̽�', '��', 3, 1), instrb('����Ÿ���̽�', '��', 3, 1) from dual;
select * from EMPLOYEES where instr(FIRST_NAME, 'r', 3) = 3; --������ ��ġ
select * from EMPLOYEES where substr(FIRST_NAME, 3, 1) = 'r';

select lpad('Oracle', 20, '#') from dual;
select rpad('Oracle', 20, '#') from dual;
select lpad(first_name, 20, ' ') from EMPLOYEES  order by FIRST_NAME;

select ltrim('  oracle') from dual;
select ltrim('oracle  ') from dual;
select trim('a' from 'aaaaOcracleaaaaa') from dual;
SELECT trim(' oracle  ') from dual;

select replace(phone_number, '.', '-') from EMPLOYEES;

--��¥ �Լ�
select sysdate from dual;
select sysdate-1 ����, sysdate+1 ���� from dual;
select sysdate-hire_date from EMPLOYEES;  -- ��¥ - ��¥ = 1

-- �� ��ȯ �Լ�
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
select hire_date, to_char(hire_date, 'YYYY/MM/DD DAY') from EMPLOYEES;
select hire_date, to_char(hire_date, 'YYYY/MON/DD DY') from EMPLOYEES;
select to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual;

select to_char(12300000) from dual;
select last_name, salary, to_char(salary, 'L999,999') from EMPLOYEES; -- 9: �ڸ����� ���� �ʾƵ� ä���� ����
select to_char(123456, '000000000'), to_char(123456, '999,999,999') from dual; -- 0: �ڸ����� ���缭 ä��
select to_char(123456, '0000'), to_char(123456, '9,999') from dual;

select last_name, hire_date from EMPLOYEES where hire_date = 20021020;
select last_name, hire_date from EMPLOYEES where hire_date = TO_DATE(20020816, 'YYYYMMDD');
select trunc(sysdate-TO_DATE('2008/01/01', 'YYYY/MM/DD')) from dual;
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

select '1000' - '500' from dual; -- �ڵ� casting
select '1,000' - '500' from dual;

-- �Ϲ� �Լ�
select department_id, decode(department_id, 10, 'A', 20, 'B', 'DEFAULT')  -- decode�� switch-case���� ���� ��� ����
from EMPLOYEES order by department_id;
select last_name, department_id, decode(department_id, 10, 'Administration', 20, 'Marketing', -- default�� ���� ������
                                        30, 'Purchasing', 40, 'Human Resources') as dname
from employees;

select last_name, department_id,
        case      when department_id=10 then 'Administration'
                  when department_id=20 then 'Marketing'
                  when department_id=30 then 'Purchasing'
                  when department_id=40 then 'Human Resources'
        end as dname
from EMPLOYEES;