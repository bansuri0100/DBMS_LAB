/*Q.
Consider the relations
PART (PNO, PNAME, COLOUR),
WAREHOUSE (WNO, WNAME, CITY)
SHIPMENT (PNO, WNO, QUANTITY, DATE)
Create the above tables, insert suitable tuples and perform the following
operations in Oracle SQL:
a. Obtain the Names of warehouses which have shipped red coloured parts.
b. Retrieve the PNO of the parts shipped by all the warehouses.
c. Find the number of parts supplied by each warehouse
*/

create table part
(pno number primary key,
pname varchar(15),
color varchar(15));

create table warehouse
(wno number primary key,
wname varchar(15),
city varchar(15));
        
create table shipment 
(pno number,
wno number,
quantity number,
date varchar(15),
primary key(pno,wno),
foreign key (pno) references part(pno),
foreign key (wno) references warehouse(wno));

insert into part(pno,pname,color) values(1,'aaa','red'),(2,'bbb','blue'),(3,'ccc','green'),(4,'ddd','red'),(5,'eee','red');

insert into warehouse(wno,wname,city) values(1,'abc','bengaluru'),(2,'bcd','mysuru'),(3,'cde','bellary'),(4,'def','hubli'),(5,'efg','hassan');

insert into shipment(pno,wno,quantity,date) values(1,1,1,'1.2.19'),(1,2,3,'2.9.19'),(1,3,3,'5.2.18'),(1,4,2,'1.1.19'),(1,5,5,'6.2.19'),(2,3,5,'5.5.19'),(3,2,3,'6.6.19'),(4,5,6,'2.2.19'),(3,1,1,'4.4.19');  

--a.)

select wname 
from warehouse
where wno=
(select wno from shipment where pno=
(select pno from part where color='red')); 

/*Result:
abc
bcd
cde
def
efg
*/

--b.)

select pno 
from shipment 
group by pno
having count(wno)=
(select count(wno)
from warehouse);

/*Result:
pno
1
*/

--c.)

select wno,count(pno) as Number_Of_Parts
from shipment
group by wno;

/* Result:
     Number of Records: 5
wno	Number_Of_Parts
1	3
2	3
3	2
4	2
5	3
*/
