
-- ROWID
select rowid, rownum, employee_id
from employees;

-- CREATE TABLE
CREATE TABLE EMP01 (
        EMPNO NUMBER(4),
        ENMAE VARCHAR2(20),
        SAL NUMBER(7,2));
        
SELECT * FROM EMP01;
DESC EMP01;

CREATE TABLE DEPT01 (
        DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
);

DESC DEPT01;

-- ���������� ���̺��� ����� ��� �̹� �����ϴ� ���̺�� ������ ������ ������ ���� ���ο� ���̺� ���� ����
CREATE TABLE EMP02
AS
SELECT * FROM EMPLOYEES;
SELECT * FROM EMP02;

CREATE TABLE EMP03
AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT * FROM EMP03;

CREATE TABLE EMP04
AS
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID=80;
SELECT * FROM EMP04;

CREATE TABLE EMP05
AS
SELECT * FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC;
SELECT ROWNUM, DEPARTMENT_ID FROM EMP05;

-- DEPARTMENT ���̺�� ���� ������ ����
CREATE TABLE DEPT
AS
SELECT * FROM DEPARTMENTS
WHERE 1=0;  -- Ʋ�� ������ �� ��� ���ǿ� �ش��ϴ� �����Ͱ� ���� ������ ������ ����
SELECT * FROM DEPT;


-- ALTER TABLE => ���̺� ������ ����
DESC EMP01;
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));
DESC EMP01;

ALTER TABLE DEPT01
ADD(DMGR VARCHAR2(10));
DESC DEPT01;

-- ALTER TABLE: ���� �÷��� �Ӽ� �����ϱ� - �÷��� �����Ͱ� �ִ� ��� ũ�� �ø��⸸ ����
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));
DESC EMP01;

ALTER TABLE DEPT01
MODIFY(DMGR NUMBER(4));
DESC DEPT01;
-- DROP: �÷� ����
ALTER TABLE DEPT01
DROP COLUMN DMGR;
DESC DEPT01;
-- SET UNUSED �÷��� ����� �������� ���� => � �� �����ؾ� �� �÷��� ���� ��� ���
ALTER TABLE EMP02
SET UNUSED(JOB_ID);
SELECT * FROM EMP02;

DESC EMP02;

ALTER TABLE EMP02
DROP UNUSED COLUMNS; -- ��� ������ �÷� ����

-- DROP TABLE: ���̺� ����
DROP TABLE EMP01;
SELECT * FROM EMP01;

-- TRUNCATE TABLE ���̺��� ������ ����(������ ����), ���� �Ұ�
TRUNCATE TABLE EMP02;
SELECT * FROM EMP02;

-- RENAME
RENAME EMP02 TO TEST;
SELECT * FROM EMP02;
SELECT * FROM TEST;


SELECT * FROM TAB;
-- USER_������ ��ųʸ�: �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ
DESC USER_TABLES; -- USER_TABLES: ���� ������ ���̺� ���� ��ȸ
SELECT TABLE_NAME FROM USER_TABLES  
WHERE TABLE_NAME = 'EMPLOYEES'; -- ���̺���� �ҹ����� ��� ��ȸ���� ����