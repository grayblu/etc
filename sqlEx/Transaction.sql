
drop table emp_t;

create table EMP_T
as
select * from employees;

select * from emp_t;

delete from emp_t
where DEPARTMENT_ID = 30;

savepoint delete_did_30;

delete from emp_t
where DEPARTMENT_ID = 50;

rollback to delete_did_30;
select count(*) from emp_t;

select * from emp_t;

truncate table emp_t;

rollback;
