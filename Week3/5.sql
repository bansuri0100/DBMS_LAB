/*
Consider the relations 
25BOOK (ISBN, TITLE, AUTHOR, PUBLISHER)STUDENT (USN, NAME, SEM, DEPTNO), BORROW (ISBN, USN, DATE)Create  the  above  tables,  insert  suitable  tuples  and  perform  the  following  operations  in Oracle SQL:a.Obtain  the  name  of  the  student  who  has  borrowed  the  book  bearing  ISBN „123‟ b.Obtain the Names of students who have borrowed database books.c.Find the number of books borrowed by each student.
*/

create table book
   (isbn varchar(15) primary key,
   title varchar(15),
    author varchar(15),
    publisher varchar(15));

--Table created.

create table student
    (usn number primary key,
    name varchar(15),
    sem varchar(15),
    deptno number);

--Table created.

create table borrow
    (isbn varchar(15),
    usn number,
    date1 varchar(15),
    primary key(isbn,usn),
    foreign key (isbn) references book(isbn), 
    foreign key (usn) references student(usn));

--Table created.

SQL> insert into book values('&isbn','&title','&author','&publisher');
Enter value for isbn: 123
Enter value for title: horror book
Enter value for author: james
Enter value for publisher: abc pub
old   1: insert into book values('&isbn','&title','&author','&publisher')
new   1: insert into book values('123','horror book','james','abc pub')

1 row created.

SQL> /
Enter value for isbn: 111
Enter value for title: hello book
Enter value for author: charlie
Enter value for publisher: bbb publisher
old   1: insert into book values('&isbn','&title','&author','&publisher')
new   1: insert into book values('111','hello book','charlie','bbb publisher')

1 row created.

SQL> /
Enter value for isbn: 143
Enter value for title: database ms
Enter value for author: howdy
Enter value for publisher: pqr pub
old   1: insert into book values('&isbn','&title','&author','&publisher')
new   1: insert into book values('143','database ms','howdy','pqr pub')

1 row created.

SQL> /
Enter value for isbn: 100
Enter value for title: core database
Enter value for author: jonny
Enter value for publisher: aaa pub
old   1: insert into book values('&isbn','&title','&author','&publisher')
new   1: insert into book values('100','core database','jonny','aaa pub')

1 row created.

SQL> insert into student values(&usn,'&name','&sem',&deptno);
Enter value for usn: 1
Enter value for name: amit
Enter value for sem: 5
Enter value for deptno: 1
old   1: insert into student values(&usn,'&name','&sem',&deptno)
new   1: insert into student values(1,'amit','5',1)

1 row created.

SQL> /
Enter value for usn: 2
Enter value for name: ashay
Enter value for sem: 5
Enter value for deptno: 2
old   1: insert into student values(&usn,'&name','&sem',&deptno)
new   1: insert into student values(2,'ashay','5',2)

1 row created.

SQL> /
Enter value for usn: 3
Enter value for name: bansuri
Enter value for sem: 5
Enter value for deptno: 3
old   1: insert into student values(&usn,'&name','&sem',&deptno)
new   1: insert into student values(3,'bansuri','5',3)

1 row created.

SQL> /
Enter value for usn: 4
Enter value for name: bhushan
Enter value for sem: 5
Enter value for deptno: 1
old   1: insert into student values(&usn,'&name','&sem',&deptno)
new   1: insert into student values(4,'bhushan','5',1)

1 row created.

SQL> /
Enter value for usn: 5
Enter value for name: ram
Enter value for sem: 5
Enter value for deptno: 2
old   1: insert into student values(&usn,'&name','&sem',&deptno)
new   1: insert into student values(5,'ram','5',2)
SQL> insert into borrow values('&isbn',&usn,'&date1');
Enter value for isbn: 123
Enter value for usn: 1
Enter value for date1: 1.1.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('123',1,'1.1.19')

1 row created.

SQL> /
Enter value for isbn: 123
Enter value for usn: 4
Enter value for date1: 2.2.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('123',4,'2.2.19')

1 row created.

SQL> /
Enter value for isbn: 100
Enter value for usn: 2
Enter value for date1: 1.3.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('100',2,'1.3.19')

1 row created.

SQL> /
Enter value for isbn: 111
Enter value for usn: 2
Enter value for date1: 2.2.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('111',2,'2.2.19')

1 row created.

SQL> /
Enter value for isbn: 143
Enter value for usn: 3
Enter value for date1: 3.3.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('143',3,'3.3.19')

1 row created.

SQL> /
Enter value for isbn: 100
Enter value for usn: 4
Enter value for date1: 2.2.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('100',4,'2.2.19')

1 row created.

SQL> /
Enter value for isbn: 111
Enter value for usn: 3
Enter value for date1: 1.1.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('111',3,'1.1.19')

1 row created.

SQL> /
Enter value for isbn: 123
Enter value for usn: 2
Enter value for date1: 15.6.19
old   1: insert into borrow values('&isbn',&usn,'&date1')
new   1: insert into borrow values('123',2,'15.6.19')

1 row created.

--a.)

 select name 
    from student 
   where usn in (
    select usn
    from borrow
    where isbn='123');

/*
NAME
---------------
amit
ashay
bhushan
*/

--b.)

 select name from student
    where usn in (
    select usn from borrow
    where isbn in (
    select isbn from book
    where title like 'core database'));

/*
NAME
---------------
ashay
bhushan
*/

--c.)

 select usn, count(isbn) as COUNT
   from borrow
   group by usn;

       USN	COUNT
---------- ----------
	 1	    1
	 2	    3
	 4	    2
	 3	    2
	 
	 



