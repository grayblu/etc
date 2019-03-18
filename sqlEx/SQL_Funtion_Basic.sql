desc dual;
select * from dual;

select sysdate from dual;

-- 숫자 함수
select 34.5678, round(34.5678)
from dual;
select 34.5678, round(34.5678, 2)
from dual;
select 34.5678, round(34.5678, -1)
from dual;

select trunc(34.5678, 2), trunc(34.5678, -1), trunc(34.5678) from dual;

select mod(27,2), mod(27,5), mod(27,7) from dual;
select * from employees where mod(employee_id, 2) = 1;

-- 문자 처리 함수
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;
select 'WELCOME TO ORACLE', INITCAP('WELCOME TO ORACLE') from dual;

SELECT * FROM EMPLOYEES where lower(LAST_NAME) = 'king'; --LAST_NAME = initcap('king');
SELECT * FROM EMPLOYEES where lower(LAST_NAME) like '%IN%';

select length('Oracle'), length('오라클') from dual;
select lengthb('Oracle'), lengthb('오라클') from dual;

select SUBSTR('Welcome to Oracle',3, 4) from dual; -- 인덱스 1부터 시작, 갯수 미지정 시 문자 끝까지
select SUBSTR('Welcome to Oracle',-4,3) from dual; -- 음수는 오른쪽부터 해석
--사원의 입사 년도, 월, 일 조회
select substr(hire_date, 1, 2)년도, substr(hire_date, 4, 2)월, substr(hire_date, 7, 2)일
from EMPLOYEES;
-- 오늘 날짜 입사자 출력
select * from EMPLOYEES where substr(hire_date, 4) = substr(sysdate, 4);
-- 03년도 입사자
SELECT * FROM EMPLOYEES WHERE substr(hire_date, 1,2) = '03';
SELECT * FROM EMPLOYEES WHERE hire_date between '03/01/01' and '03/12/31';
-- last_name이 'e'로 끝나는 사원
SELECT * FROM EMPLOYEES WHERE substr(LAST_NAME, -1) = 'e';
SELECT * FROM EMPLOYEES WHERE LAST_NAME like '%e';

select instr('데이타베이스', '이', 3, 1), instrb('데이타베이스', '이', 3, 1) from dual;
select * from EMPLOYEES where instr(FIRST_NAME, 'r', 3) = 3; --글자의 위치
select * from EMPLOYEES where substr(FIRST_NAME, 3, 1) = 'r';

select lpad('Oracle', 20, '#') from dual;
select rpad('Oracle', 20, '#') from dual;
select lpad(first_name, 20, ' ') from EMPLOYEES  order by FIRST_NAME;

select ltrim('  oracle') from dual;
select ltrim('oracle  ') from dual;
select trim('a' from 'aaaaOcracleaaaaa') from dual;
SELECT trim(' oracle  ') from dual;

select replace(phone_number, '.', '-') from EMPLOYEES;

--날짜 함수
select sysdate from dual;
select sysdate-1 어제, sysdate+1 내일 from dual;
select sysdate-hire_date from EMPLOYEES;  -- 날짜 - 날짜 = 1

-- 형 변환 함수
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
select hire_date, to_char(hire_date, 'YYYY/MM/DD DAY') from EMPLOYEES;
select hire_date, to_char(hire_date, 'YYYY/MON/DD DY') from EMPLOYEES;
select to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual;

select to_char(12300000) from dual;
select last_name, salary, to_char(salary, 'L999,999') from EMPLOYEES; -- 9: 자릿수가 맞지 않아도 채우지 않음
select to_char(123456, '000000000'), to_char(123456, '999,999,999') from dual; -- 0: 자릿수에 맞춰서 채움
select to_char(123456, '0000'), to_char(123456, '9,999') from dual;

select last_name, hire_date from EMPLOYEES where hire_date = 20021020;
select last_name, hire_date from EMPLOYEES where hire_date = TO_DATE(20020816, 'YYYYMMDD');
select trunc(sysdate-TO_DATE('2008/01/01', 'YYYY/MM/DD')) from dual;
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

select '1000' - '500' from dual; -- 자동 casting
select '1,000' - '500' from dual;

-- 일반 함수
select department_id, decode(department_id, 10, 'A', 20, 'B', 'DEFAULT')  -- decode는 switch-case문과 같은 기능 제공
from EMPLOYEES order by department_id;
select last_name, department_id, decode(department_id, 10, 'Administration', 20, 'Marketing', -- default는 생략 가능함
                                        30, 'Purchasing', 40, 'Human Resources') as dname
from employees;

select last_name, department_id,
        case      when department_id=10 then 'Administration'
                  when department_id=20 then 'Marketing'
                  when department_id=30 then 'Purchasing'
                  when department_id=40 then 'Human Resources'
        end as dname
from EMPLOYEES;