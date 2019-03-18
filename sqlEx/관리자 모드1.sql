
-- JDBC ���α׷���
-- ���̺����̽� ����
CREATE TABLESPACE AUTOCAR_TS
DATAFILE 'autocar_ts.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 5M;
-- ����� ����
CREATE USER autocar
IDENTIFIED BY 1234
DEFAULT TABLESPACE autocar_ts
TEMPORARY TABLESPACE TEMP;

ALTER USER autocar
QUOTA 50M ON autocar_ts;
-- ���� �ο�

GRANT CONNECT, RESOURCE, create VIEW TO autocarrole;