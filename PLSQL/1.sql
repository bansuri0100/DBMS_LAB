--1.​ ​Write​ ​a​ ​PL/SQL​ ​program​ ​to​ ​display​ ​the​ ​contents​ ​of​ ​the​ ​above​ ​tables​ ​and​ ​then​ ​update
--the​ ​balance​ ​of​ ​a​ ​few​ ​accounts.


CREATE​ ​ TABLE​​ ​ BRANCH_DETAIL​ ​ (
CODE​ ​ VARCHAR(2)​ ​ PRIMARY​ ​ KEY,
NAME​ ​ VARCHAR(3),
ASSETS​ ​ NUMBER(6)​ ​ ​ );
CREATE​ ​ TABLE​​ ​ CUSTOMER_DETAIL(
​ ​ ​ ​ SSN​ ​ NUMBER(1)​ ​ PRIMARY​ ​ KEY,
​ ​ ​ ​ NAME​ ​ VARCHAR(20)​ ​ ,
​ ​ ​ ​ PLACE​ ​ VARCHAR(3)​ ​ ​ );
CREATE​ ​ TABLE​​ ​ ACCOUNT_DETAIL(
​ ​ ​ ​ ACCNO​ ​ VARCHAR(2)​ ​ PRIMARY​ ​ KEY,
​ ​ ​ ​ SSN​ ​ ​ ​ NUMBER(1)​ ​ REFERENCES​ ​ CUSTOMER_DETAIL(SSN)​ ​ ON​ ​ DELETE​ ​ CASCADE,
​ ​ ​ ​ CODE​ ​ ​ VARCHAR(2)​ ​ REFERENCES​ ​ BRANCH_DETAIL(CODE)​ ​ ON​ ​ DELETE​ ​ CASCADE,
​ ​ ​ ​ BALANCE​ ​ NUMBER(7)​ ​ );
CREATE​ ​ TABLE​​ ​ EMPLOYEE_DETAIL​ ​ (
​ ​ ​ ​ ​ SSN​ ​ NUMBER(3)​ ​ PRIMARY​ ​ KEY,
​ ​ ​ ​ ​ NAME​ ​ VARCHAR(20),
​ ​ ​ ​ ​ SALARY​ ​ NUMBER(6),
​ ​ ​ ​ ​ DEPTNO​ ​ NUMBER(3)​ ​ ​ );
INSERT​ ​ INTO​​ ​ BRANCH_DETAIL​ ​ VALUES​​ ​ ('&CODE',​ ​ '&NAME',​ ​ '&ASSETS');
INSERT​​ ​ INTO​​ ​ CUSTOMER_DETAIL​ ​ VALUES​​ ​ ('&SSN','&NAME','&PLACE');
INSERT​ ​ INTO​​ ​ ACCOUNT_DETAIL​ ​ VALUES​​ ​ ('&ACCNO','&SSN','&CODE','&BALANCE');
INSERT​ ​ INTO​​ ​ EMPLOYEE_DETAIL​ ​ VALUES​​ ​ ('&SSN','&NAME','&SALARY','&DEPTNO');

PL/SQL​ ​PROGRAM​ ​:
SET​​ ​ SERVEROUTPUT​ ​ ON
BEGIN
​ FOR​​ ​ rec​ ​ IN​​ ​ ( ​ SELECT​​ ​ * ​ ​ FROM​​ ​ BRANCH_DETAIL)
​ ​ LOOP
​ ​ ​ ​ dbms_output.put_line​ ('CODE​ ​ : ​ ​ ' ​ ​ ||​ ​ rec.code​ ​ ||​ ​ ' ​ ​ NAME​ ​ : ​ ​ '||​ ​ rec.name​ ​ ||
'​ ASSETS​ ​ : ​ ​ '||​ ​ rec.assets);
​ ​ END​ ​ LOOP​ ;
​ FOR​​ ​ rec​ ​ IN​​ ​ ( ​ SELECT​​ ​ * ​ ​ FROM​ ​ CUSTOMER_DETAIL)
​ ​ LOOP
​ ​ ​ ​ dbms_output.put_line​ ('SSN​ ​ : ​ ​ ' ​ ​ ||​ ​ rec.ssn​ ​ ||​ ​ ' ​ ​ NAME​ ​ : ​ ​ '||​ ​ rec.name​ ​ ||
'​ PLACE​ ​ : ​ ​ '||​ ​ rec.place);
​ ​ END​ ​ LOOP​ ;
​ FOR​​ ​ rec​ ​ IN​​ ​ ( ​ SELECT​​ ​ * ​ ​ FROM​​ ​ ACCOUNT_DETAIL)
​ ​ LOOP
​ ​ ​ ​ dbms_output.put_line​ ('ACCNo​ ​ : ​ ​ ' ​ ​ ||​ ​ rec.accno​ ​ ||​ ​ ' ​ ​ SSN​ ​ : ​ ​ '||​ ​ rec.ssn
||​ '
​ ​ CODE​ ​ : ​ ​ '||​ ​ rec.code​ ​ ||​ ​ ' ​ ​ BALANCE​ ​ : ​ ​ '||​ ​ rec.balance);
​ ​ END​ ​ LOOP;
UPDATE​​ ​ ACCOUNT_DETAIL
SET​​ ​ BALANCE=120000
WHERE​​ ​ SSN=1;
dbms_output.put_line​ (‘SOME​ ​ ROWS​ ​ ARE​ ​ UPDATED’​ ​ );
END​ ;
/
