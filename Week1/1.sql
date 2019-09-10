/*Q. 
Consider the relations
EMPLOYEE (SSN, Name, DeptNo)
ASSIGNED_TO (USN , ProjectNo)
PROJECT (ProjectNo, ProjectArea)
 Create the above tables, insert suitable tuples and perform the following operations
in Oracle SQL
a. Obtain the SSN of employees assigned to database projects.
b. Find the number of employees working in each department
c. Update the ProjectNo of Employee bearing SSN=1 to ProjectNo=20*/

 create table employee
    (ssn number primary key,
   name varchar(15),
    deptno number);

--Table created.

create table project
    (pno number primary key,
   parea varchar(15));

--Table created.

 create table assigned_to
    (ssn number,
    pno varchar(2),
    foreign key(ssn) references employee(ssn),
    foreign key(pno) references project(pno),
    primary key(ssn,pno));
    
    --Table created.
    
insert into employee values(001,'Alexander',1);
insert into employee values(002,'Bolt',2);
insert into employee values(003,'Colt',2);
insert into employee values(004,'Denver',5);
insert into employee values(005,'Emilia',4);
insert into employee values(006,'Forzan',3);
insert into employee values(007,'Geek',3);
insert into employee values(008,'Harry',1);

insert into project values(12,'Data Structures');
insert into project values(13,'Applied CS');
insert into project values(15,'Databases');
insert into project values(14, 'Machine Learning');
insert into project values(16,'Full Stack Web Development'),(20,'Java Project');

insert into assigned_to (ssn ,pno) values(001,12),(002,13),(003,16),(004,14),(005,16),(006,12),(007,15),(008,13);

--Queries:

--a.)

select ssn
from assigned_to
where pno=
(select pno from project where parea like 'databas%');

--Result
/*
ssn
7
*/

--b.)

select deptno,
count(ssn) as 'No of Employees'
from employee 
group by deptno;

--Result
/*
Number of Records: 5
deptno	No of Employees
1	2
2	2
3	2
4	1
5	1
*/

--c.)

update assigned_to set pno=20 where ssn=1;

--Display
select *
from assigned_to

/*
Number of Records: 8
ssn	pno
1	20
2	13
3	16
4	14
5	16
6	12
7	15
8	13
*/	    
   
    

