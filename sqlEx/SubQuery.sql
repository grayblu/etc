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

-- 서브쿼리 내 또 다른 서브 쿼리
select department_id, last_name
from employees
where department_id in ( select department_id
                        from departments
                        where location_id = (
                        select location_id
                        from locations
                        where city='Seattle'));
                        
-- ALL 연산자
select first_name, last_name, salary
from employees
where salary > ALL(
            select salary
            from employees
            where DEPARTMENT_ID = 30);
            
-- ANY 연산자: 부서 번호가 30번인 사원들의 급여 중 가장 낮은 값보다 높은 급여를 받는 사원 추출
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
            
-- SubQuery를 from절에 사용할 경우
-- 부서별 최고 급여자 정보 출력
select e1.department_id, first_name, last_name, salary
from employees e1,(
          select department_id, max(salary) maxsalary
          from employees
          group by department_id) e2
where e1.department_id = e2.department_id and salary = maxsalary
order by department_id;
--사장은 제외한 최고 급여자
select e1.department_id, first_name, last_name, salary
from employees e1,(
          select department_id, max(salary) maxsalary
          from employees
          where manager_id is not null
          group by department_id) e2
where e1.department_id = e2.department_id
      and salary = maxsalary
order by department_id;
-- ※ 절마다 한 줄씩 바꾸는 것이 결과 확인 시 유용함
