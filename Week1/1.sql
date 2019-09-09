

 create table employee1
    (ssn number primary key,
   name varchar(15),
    deptno number);

--Table created.

create table project
    (pno number primary key,
  3 parea varchar(15));

--Table created.

 create table assigned_to
    (ssn number,
    pno varchar(2),
    foreign key(ssn) references employee1(ssn),

