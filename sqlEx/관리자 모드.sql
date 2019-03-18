
-- ����� �߰�
create user web
identified by web
default tablespace users
temporary tablespace temp;  -- Ŀ�� ���������� TEMP ���̺����̽��� �����, ���� �� DEFAULT�� ó�� �� 

-- ���� ���� �ο�
grant create session to web;

-- ������ �ѹ��� ��� �����ϱ�
grant create session, create table, create view,
create sequence, create procedure to web;

-- ���̺����̽� quota ����
alter user web
quota 50m on users;

-- ��й�ȣ ����
ALTER USER WEB
IDENTIFIED BY 1234;



-- ����� �� ����
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


-- ���Ǿ� ����
SELECT * FROM SYSTBL;

CREATE TABLE SYSTBL (
  ENAME VARCHAR(20));
  
INSERT INTO SYSTBL VALUES('ȫ�浿');
INSERT INTO SYSTBL VALUES('����');

GRANT SELECT ON SYSTBL TO WEB;

-- ����� ���Ǿ�


GRANT CREATE SYNONYM TO WEB;

CREATE PUBLIC SYNONYM PubDept FOR HR.DEPARTMENTS;
GRANT SELECT ON PubDept TO WEB;

DROP SYNONYM PriSYSTBL;

drop user user01 cascade;
