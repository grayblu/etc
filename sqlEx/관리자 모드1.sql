
-- JDBC 프로그래밍
-- 테이블스페이스 생성
CREATE TABLESPACE AUTOCAR_TS
DATAFILE 'autocar_ts.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 5M;
-- 사용자 생성
CREATE USER autocar
IDENTIFIED BY 1234
DEFAULT TABLESPACE autocar_ts
TEMPORARY TABLESPACE TEMP;

ALTER USER autocar
QUOTA 50M ON autocar_ts;
-- 권한 부여

GRANT CONNECT, RESOURCE, create VIEW TO autocarrole;