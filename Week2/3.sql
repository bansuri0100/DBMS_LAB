



SQL> create table boat
  2  (bid number primary key,
  3  bname varchar(15),
  4  color varchar(15));

Table created.

SQL> create table sailor 
  2  (sid number primary key,
  3  sname varchar(15),
  4  age number,
  5  rating number);

Table created.



SQL> create table reserves(bid number,sid number,day varchar(15),primary key(bid,sid),foreign key (bid) references boat(bid),foreign key(sid) references sailor(sid));

Table created.

SQL> insert into boat values(&bid,'bname','&color');
Enter value for bid: 1
Enter value for color: 
old   1: insert into boat values(&bid,'bname','&color')
new   1: insert into boat values(1,'bname','')

1 row created.



SQL> insert into boat values(&bid,'&bname','&color');
Enter value for bid: 2
Enter value for bname: blue bleeders
Enter value for color: blue
old   1: insert into boat values(&bid,'&bname','&color')
new   1: insert into boat values(2,'blue bleeders','blue')

1 row created.

SQL> /
Enter value for bid: 3
Enter value for bname: gold diggers
Enter value for color: gold
old   1: insert into boat values(&bid,'&bname','&color')
new   1: insert into boat values(3,'gold diggers','gold')

1 row created.

SQL> /
Enter value for bid: 4
Enter value for bname: silver maniac
Enter value for color: yellow
old   1: insert into boat values(&bid,'&bname','&color')
new   1: insert into boat values(4,'silver maniac','yellow')

1 row created.

SQL> /
Enter value for bid: 5
Enter value for bname: balcks
Enter value for color: black
old   1: insert into boat values(&bid,'&bname','&color')
new   1: insert into boat values(5,'balcks','black')

1 row created.

SQL> insert into sailor values(&sid,'&sname',&age,&rating);
Enter value for sid: 1
Enter value for sname: ashay
Enter value for age: 22
Enter value for rating: 4.5
old   1: insert into sailor values(&sid,'&sname',&age,&rating)
new   1: insert into sailor values(1,'ashay',22,4.5)

1 row created.

SQL> /
Enter value for sid: 2
Enter value for sname: bhushan
Enter value for age: 24
Enter value for rating: 3.89
old   1: insert into sailor values(&sid,'&sname',&age,&rating)
new   1: insert into sailor values(2,'bhushan',24,3.89)

1 row created.




SQL> 
SQL> /
Enter value for sid: 3
Enter value for sname: bansuri
Enter value for age: 19
Enter value for rating: 5
old   1: insert into sailor values(&sid,'&sname',&age,&rating)
new   1: insert into sailor values(3,'bansuri',19,5)

1 row created.

SQL> /
Enter value for sid: 4
Enter value for sname: ayush
Enter value for age: 20
Enter value for rating: 4
old   1: insert into sailor values(&sid,'&sname',&age,&rating)
new   1: insert into sailor values(4,'ayush',20,4)

1 row created.

SQL> /
Enter value for sid: 5
Enter value for sname: hell
Enter value for age: 26
Enter value for rating: 5.5
old   1: insert into sailor values(&sid,'&sname',&age,&rating)
new   1: insert into sailor values(5,'hell',26,5.5)

1 row created.

SQL> insert into reserves values(&bid,&sid,'&day');
Enter value for bid: 1
Enter value for sid: 2
Enter value for day: monday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(1,2,'monday')

1 row created.

SQL> /
Enter value for bid: 2
Enter value for sid: 3
Enter value for day: tuesday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(2,3,'tuesday')

1 row created.

SQL> /
Enter value for bid: 3
Enter value for sid: 4
Enter value for day: wednesday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(3,4,'wednesday')

1 row created.

SQL> /
Enter value for bid: 4
Enter value for sid: 5
Enter value for day: thursday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(4,5,'thursday')

1 row created.

SQL> /
Enter value for bid: 5
Enter value for sid: 1
Enter value for day: friday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(5,1,'friday')

1 row created.

SQL> select bid from reserves where sid=(select sid from sailor where sname='ashay');

       BID                   --a.)
----------
	 5

SQL> select * from reserves;

       BID	  SID DAY
---------- ---------- ---------------
	 1	    2 monday
	 2	    3 tuesday
	 3	    4 wednesday
	 4	    5 thursday
	 5	    1 friday

SQL> select * from sailor;

       SID SNAME		  AGE	  RATING
---------- --------------- ---------- ----------
	 1 ashay		   22	     4.5
	 2 bhushan		   24	    3.89
	 3 bansuri		   19	       5
	 4 ayush		   20	       4
	 5 hell 		   26	     5.5

SQL> commit;

Commit complete.




SQL> insert into reserves values(&bid,&sid,'&day');
Enter value for bid: 1
Enter value for sid: 3
Enter value for day: sunday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(1,3,'sunday')

1 row created.

SQL> /
Enter value for bid: 1
Enter value for sid: 4
Enter value for day: friday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(1,4,'friday')

1 row created.

SQL> /
Enter value for bid: 1
Enter value for sid: 5
Enter value for day: saturday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(1,5,'saturday')

1 row created.

SQL> /
Enter value for bid: 2
Enter value for sid: 1
Enter value for day: monday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(2,1,'monday')

1 row created.



SQL> /
Enter value for bid: 1
Enter value for sid: 1
Enter value for day: sunday
old   1: insert into reserves values(&bid,&sid,'&day')
new   1: insert into reserves values(1,1,'sunday')

1 row created.




SQL> select bid from reserves                      --b.)
  2  group by bid
  3  having count(bid)=(select count(sid)
  4  from sailor);

       BID
----------
	 1

SQL> commit;

Commit complete.


SQL> select sid, count(*) as Count                     --c.)
  2  from reserves 
  3  group by sid;

       SID	COUNT
---------- ----------
	 1	    3
	 2	    1
	 4	    2
	 5	    2
	 3	    2

SQL> commit;

Commit complete.


