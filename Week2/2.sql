/*Consider the relations
PART (PNO, PNAME, COLOUR),
SUPPLIER ( SNO, SNAME, ADDRESS)
SUPPLY (PNO, SNO, QUANTITY)
Create the above tables, insert suitable tuples and perform the following operations in
Oracle SQL:
a. Obtain the PNO of parts supplied by supplier „Ram‟.
b. Obtain the Names of suppliers who supply bolts
c. Delete the parts which are green in colour*/
create table part
(pno number primary key,
panme varchar(15),
color varchar(15));

--Table created.

create table supplier
(sno number primary key,
sname varchar(15),
address varchar(15));

--Table created.


SQL> create table supply
  2  (pno number ,
  3  sno number,
  4  quantity number,
  5  primary key(pno,sno),
  6  foreign key(pno) references part(pno) on delete cascade,
  7  foreign key(sno) references supplier(sno) on delete cascade);

--Table created.




SQL> insert into part values(&pno,'&panme','&color');
Enter value for pno: 25
Enter value for panme: bottle
Enter value for color: yellow
old   1: insert into part values(&pno,'&panme','&color')
new   1: insert into part values(25,'bottle','yellow')

1 row created.

SQL> /
Enter value for pno: 13
Enter value for panme: gear lever
Enter value for color: silver
old   1: insert into part values(&pno,'&panme','&color')
new   1: insert into part values(13,'gear lever','silver')

1 row created.




SQL> /\
Enter value for pno: 6
Enter value for panme: foot peg
Enter value for color: gold
old   1: insert into part values(&pno,'&panme','&color')
new   1: insert into part values(6,'foot peg','gold')

1 row created.






SQL> insert into supply values(&pno,&sno,&quantity);
Enter value for pno: 1
Enter value for sno: 2
Enter value for quantity: 2
old   1: insert into supply values(&pno,&sno,&quantity)
new   1: insert into supply values(1,2,2)

1 row created.




SQL> /
Enter value for pno: 5
Enter value for sno: 6
Enter value for quantity: 2
old   1: insert into supply values(&pno,&sno,&quantity)
new   1: insert into supply values(5,6,2)

1 row created.




SQL> insert into supplier values(&sno,'&sname','&address');
Enter value for sno: 3
Enter value for sname: ashay
Enter value for address: rit hostel
old   1: insert into supplier values(&sno,'&sname','&address')
new   1: insert into supplier values(3,'ashay','rit hostel')

1 row created.

SQL> /
Enter value for sno: 10
Enter value for sname: raj
Enter value for address: attur layout
old   1: insert into supplier values(&sno,'&sname','&address')
new   1: insert into supplier values(10,'raj','attur layout')

1 row created.

SQL> /
Enter value for sno: 26
Enter value for sname: bhushan
Enter value for address: vrp
old   1: insert into supplier values(&sno,'&sname','&address')
new   1: insert into supplier values(26,'bhushan','vrp')

1 row created.

SQL> /
Enter value for sno: 4
Enter value for sname: ban
Enter value for address: yelahanka
old   1: insert into supplier values(&sno,'&sname','&address')
new   1: insert into supplier values(4,'ban','yelahanka')

1 row created.

SQL> select *
  2  from supplier;

       SNO SNAME	   ADDRESS
---------- --------------- --------------------
	 1 jaquar	   adiyogi
	 2 cona 	   hebbal
	 6 srs		   vrp
	 3 ashay	   rit hostel
	10 raj		   attur layout
	26 bhushan	   vrp
	 4 ban		   yelahanka

7 rows selected.

SQL> select *
  2  from supply;

       PNO	  SNO	QUANTITY
---------- ---------- ----------
	 1	    2	       2
	 5	    6	       2

SQL> insert into supply values(&pno,7sno,&quantity);
Enter value for pno: 25
Enter value for quantity: 

SQL> insert into supply values(&pno,&sno,&quantity);
Enter value for pno: 25
Enter value for sno: 10
Enter value for quantity: 6
old   1: insert into supply values(&pno,&sno,&quantity)
new   1: insert into supply values(25,10,6)

1 row created.

SQL> /
Enter value for pno: 13
Enter value for sno: 26
Enter value for quantity: 3
old   1: insert into supply values(&pno,&sno,&quantity)
new   1: insert into supply values(13,26,3)

1 row created.

SQL> /
Enter value for pno: 4
Enter value for sno: 2
Enter value for quantity: 5
old   1: insert into supply values(&pno,&sno,&quantity)
new   1: insert into supply values(4,2,5)

1 row created.

SQL> select pno                         --a.)
  2  from supply
  3  where sno=(
  4  select sno from 
  5  supplier
  6  where sname='bhushan');

       PNO
----------
	13

SQL> select *
  2  from supply;

       PNO	  SNO	QUANTITY
---------- ---------- ----------
	 1	    2	       2
	 5	    6	       2
	25	   10	       6
	13	   26	       3
	 4	    2	       5



SQL> select sname from supplier                    --b.)
  2  where sno=
  3  (select pno from supply
  4  where pno=(select pno from part
  5  where panme='bolt'));

no rows selected

SQL> select *
  2  from part;

       PNO PANME	   COLOR
---------- --------------- ---------------
	 1 abc		   red
	 2 nut		   blue
	 3 bolt 	   blue
	 4 tap		   gold
	 5 bottle	   silver
	25 bottle	   yellow
	13 gear lever	   silver
	 6 foot peg	   gold

8 rows selected.



SQL> delete from part                 --c.)
  2  where color='green';

0 rows deleted.

SQL> delete from part
  2  where color='gold';

2 rows deleted.
