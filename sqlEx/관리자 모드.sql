
-- 사용자 추가
create user web
identified by web
default tablespace users
temporary tablespace temp;  -- 커밋 수행전까지 TEMP 테이블스페이스에 저장됨, 생략 시 DEFAULT로 처리 됨 

-- 접속 권한 부여
grant create session to web;

-- 권한을 한번에 모두 지정하기
grant create session, create table, create view,
create sequence, create procedure to web;

-- 테이블스페이스 quota 설정
alter user web
quota 50m on users;

-- 비밀번호 변경
ALTER USER WEB
IDENTIFIED BY 1234;



-- 사용자 롤 정의
CREATE ROLE MROLE;

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW
TO MROLE;

CREATE USER USER01 IDENTIFIED BY USER01;

GRANT MROLE TO USER01;

ALTER USER USER01
QUOTA 50M ON USERS;

DROP ROLE MROLE2;
CREATE ROLE MROLE2;

GRANT MROLE2 TO USER01;

REVOKE MROLE2 FROM USER01;


-- 동의어 생성
SELECT * FROM SYSTBL;

CREATE TABLE SYSTBL (
  ENAME VARCHAR(20));
  
INSERT INTO SYSTBL VALUES('홍길동');
INSERT INTO SYSTBL VALUES('허준');

GRANT SELECT ON SYSTBL TO WEB;

-- 비공개 동의어


GRANT CREATE SYNONYM TO WEB;

CREATE PUBLIC SYNONYM PubDept FOR HR.DEPARTMENTS;
GRANT SELECT ON PubDept TO WEB;

DROP SYNONYM PriSYSTBL;

drop user user01 cascade;
