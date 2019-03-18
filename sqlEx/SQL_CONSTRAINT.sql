
-- 제약 조건
select constraint_name, constraint_type, table_name
from user_constraints;

-- 제약조건 컬럼 조회
select * from user_cons_columns;

-- not null 제약조건
create table emp04(
      empno number(4) not null,
      ename varchar2(10) not null,
      job varchar2(9),
      deptno number(2));
insert into emp04
values(null, null, 'salesman', 10);   -- 에러메세지 => SQL 오류: ORA-00947: not enough values

select constraint_name, constraint_type, table_name
from user_constraints
where table_name='EMP04';
--where table_name='emp04'; => 데이터로 들어감

-- UNIQUE 제약조건
drop table emp04;
create table emp04(
      empno number(4) unique,
      ename varchar2(10),
      job varchar2(9),
      deptno number(2));
      
insert into emp04
values(7449, 'Jones', 'CLERK', 20);
insert into emp04
values(7450, 'Jones', 'CLERK', 20);

select * from emp04;

-- 제약 조건명 설정
create table emp04(
      empno number(4) constraint emp04_empno_UK unique,
      ename varchar2(10) constraint emp04_ename_NN not null,
      job varchar2(9),
      deptno number(2));

insert into emp04
values(7449, 'Jones', 'CLERK', 20);
insert into emp04
values(7450, '', 'CLERK', 20);

-- primary key 제약조건
drop table emp05;
create table emp05(
      empno number(4) constraint emp05_empno_PK primary key,
      ename varchar2(10) constraint emp05_ename_NN not null,
      job varchar2(9),
      deptno number(2));
      
insert into emp05
values(7449, 'ALLEN', 'SALESMAN', 30);
insert into emp05
values(7449, 'JONES', 'MANAGER', 20);
insert into emp05
values(null, 'JONES', 'MANAGER', 20);

commit;
rollback;

select * from emp05;

-- 참조 무결성을 위한 FK 제약조건
drop table dept06;
create table dept06(
      deptno number(4) constraint dept06_deptno_pk primary key,
      dname varchar2(20) not null,
      loc varchar2(20));

insert into dept06 values(10, 'sales', 'seattle');
insert into dept06 values(20, 'accounting', 'dallas');
insert into dept06 values(30, 'marketing', 'new york');

drop table emp06;
create table emp06(
      empno number(4) constraint emp06_empno_PK primary key,
      ename varchar2(10) constraint emp06_ename_NN not null,
      job varchar2(9),
      deptno number(2) constraint emp06_deptno_FK REFERENCES dept06(deptno));
      
insert into emp06
values(7449, 'ALLEN', 'SALESMAN', 50);  -- 에러 메세지: integrity constraint (HR.EMP06_DEPTNO_FK) violated - parent key not found
insert into emp06
values(7449, 'ALLEN', 'SALESMAN', 20);
delete from dept06
where DEPTNO = 20;  -- 참조중이므로 삭제 불가

update emp06
set deptno = 30
where deptno = 20;  -- 외래키의 값을 변경

select constraint_name, constraint_type, r_constraint_name
from user_constraints
where table_name='EMP06';

-- check 제약조건
drop table emp07;
create table emp07(
      empno number(4) constraint emp07_empno_PK primary key,
      ename varchar2(10) constraint emp07_ename_NN not null,
      sal number(7,2) constraint emp07_sal_ck
                      check(sal between 500 and 5000),
      gender char(1) constraint emp07_gender_ck
                     check(gender in('M', 'F')));
                     
insert into emp07
values(1,'jones',5000, 'M');
insert into emp07
values(2,'jones',null, 'M');
select * from emp07;

select table_name, constraint_type, constraint_name, search_condition
from user_constraints
where table_name='EMP07';

-- default 제약조건
drop table dept07;
create table dept07(
      deptno number(4) constraint dept07_deptno_PK primary key,
      dname varchar2(10),
      loc varchar2(20) default 'SEOUL',
      reg_date date default sysdate,
      update_date date DEFAULT sysdate
);
insert into dept07 (deptno, dname)
values(10, 'Accounting');

update dept07 set
  LOC = 'BUSAN',
  update_date = sysdate
where deptno = 10;

select * from dept07;

-- 테이블 레벨 방식으로 제약조건 지정 => 복합키 정의할 때 반드시 사용
drop table emp06;
create table emp06(
        empno number(4),
        ename varchar2(10),
        job varchar2(9),
        deptno number(4),
        primary key(empno),
        unique(job),
        foreign key(deptno) references dept06(deptno)
);

create table member01(
        name varchar2(10),
        address varchar2(30),
        hphone varchar2(16),
        constraint member01_combo_pk primary key(name, hphone));

select constraint_name, constraint_type
from user_constraints
where table_name = 'MEMBER01';

select * from user_cons_columns
where table_name = 'MEMBER01';

-- 제약조건 추기하기
drop table emp01;
create table emp01(
          empno number(4),
          ename varchar2(10),
          job varchar2(9),
          deptno number(4));

alter table emp01
add constraint emp01_deptno_fk
foreign key(deptno) references dept06(deptno);

select constraint_name, constraint_type, r_constraint_name
from user_constraints
where table_name='EMP01';

-- NOT NULL 제약조건 추가 시 ADD가 아닌 MODIFY로 추가한다 => 테이블 레벨에서 불가
alter table emp01
modify ename constraint emp01_ename_NN not null;
