/*sem5a@iselab1:~$ sudo sp
Username: is30
Password: 


SQL*Plus: Release 12.1.0.2.0 Production on Mon Sep 9 14:52:52 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production*/

CREATE TABLE EMPLOYEE
    (NAME VARCHAR(15),
    SALARY NUMBER,
    DOJ VARCHAR(10),
    YOE NUMBER,
    DEPTNO NUMBER PRIMARY KEY);

--Table created.

 DESCRIBE EMPLOYEE
/* Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 NAME						    VARCHAR2(15)
 SALARY 					    NUMBER
 DOJ						    VARCHAR2(10)
 YOE						    NUMBER
 DEPTNO 				   NOT NULL NUMBER*/

 INSERT INTO EMPLOYEE VALUES('&name',&salary,'&doj',&yoe,&deptno);
/*Enter value for name: abc
Enter value for salary: 50000
Enter value for doj: 05-02-1999
Enter value for yoe: 2
Enter value for deptno: 2
old   1: INSERT INTO EMPLOYEE VALUES('&name',&salary,'&doj',&yoe,&deptno)
new   1: INSERT INTO EMPLOYEE VALUES('abc',50000,'05-02-1999',2,2)

1 row created.

SQL>*/ INSERT INTO EMPLOYEE VALUES('&name',&salary,'&doj',&yoe,&deptno);
/*Enter value for name: def
Enter value for salary: 60000
Enter value for doj: 05-06-2000
Enter value for yoe: 3
Enter value for deptno: 1
old   1: INSERT INTO EMPLOYEE VALUES('&name',&salary,'&doj',&yoe,&deptno)
new   1: INSERT INTO EMPLOYEE VALUES('def',60000,'05-06-2000',3,1)

1 row created.*/



	select *
    from employee
    ;

/*NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2
def		     60000 05-06-2000	       3	  1
*/



 select*
    from employee
   where salary>=50000;
/*
NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2
def		     60000 05-06-2000	       3	  1

SQL>*/ select*
   from employee
    where name like 'a%'
    ;
/*
NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2

SQL>*/ 


 select *
  from employee
  where name like '_b%';
/*
NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2
*/
select *
   from employee
   where lower(name)='Abc';

--no rows selected

select *
    from employee
    where lower(name)='abc';
/*
NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2
*/

select sum(salary)
  from employee;

--SUM(SALARY)
-----------
  --   110000

 select count(*)
    from employee
   where salary>=50000;
/*
  COUNT(*)
----------
	 2
*/


select avg(salary)
   from employee
   ;

--AVG(SALARY)
-----------
  --    55000

 insert into employee values('ccc',100000,'20-10-1999',3,5);

--1 row created.

 select *
    from employee;
/*
NAME		    SALARY DOJ		     YOE     DEPTNO
--------------- ---------- ---------- ---------- ----------
abc		     50000 05-02-1999	       2	  2
def		     60000 05-06-2000	       3	  1
ccc		    100000 20-10-1999	       3	  5

SQL>*/ 

