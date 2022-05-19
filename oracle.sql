create table Salesperson(

name varchar2 (10),

age number ,

salary number ,

primary key (name)

 

);

 

create table Orders(

num1 number,

custname varchar2(10),

salesperson varchar2(10),

amount number,

foreign key (custname) references customer(name),

foreign key (salesperson) references salesperson(name));

 

create table customer(

name varchar2(10),

city varchar2(10),

industrytype varchar2(10),

primary key (name)

);

 

drop table salesperson;

drop table orders;

drop table customer;

 

insert into salesperson

values('조수현',18,'15000');

insert into salesperson

values('김한울',18,'14000');

insert into salesperson

values('우수경',18,'13000');

 

insert into Customer

values('박다은','LA','학생');

insert into Customer

values('진애란','진주','학생');

 

insert into orders

values(1,'진애란','조수현',5);

insert into orders

values(2,'박다은','김한울',5);

 

select distinct name, salary

from salesperson;

 

select name

from salesperson

where age<30;

 

select name

from customer

where city like ('%주');

 

select count(custname)

from orders;

 

select name,age

from salesperson,orders

where orders.salesperson=salesperson.name and orders.custname= (select name

                                                from customer

                                                where city like ('LA'));

 

select name,age

from salesperson

left join orders

on orders.salesperson=salesperson.name

where orders.custname= (select name

                                                from customer

                                                where city like ('LA'));

                                                

select salesperson.name

from salesperson

inner join orders

on orders.salesperson=salesperson.name

group by orders.salesperson

having count(orders.salesperson)>=2;

 

update salesperson set salary =45000 where name='김한울';

 

create table Employee(

empno number primary key,

name varchar2(10),

phoneno number,

address varchar2(10),

sex varchar2(10),

positions varchar2(10),

deptno number

);

 

create table department(

deptno number primary key,

deptname varchar2(10),

manager1 number

);

 

create table project(

projno number primary key,

projname varchar2(10),

deptno number

 

);

 

create table works(

empno number,

projno number primary key,

hours_worked number,

foreign key(empno) references employee(empno)

);

 

insert into employee

values(1,'조수현',01011111111,'연지동','여','홀서빙',33);

insert into employee

values(2,'우수경',01011111112,'우지동','여','방닦기',22);

insert into department

values(33,'컴공',7);

insert into department

values(44,'독서',8);

insert into project

values(8080,'비밀',33);

insert into project

values(1004,'천사',44);

insert into works

values(1,33,5);

insert into works

values(2,44,5);

 

select name 

from employee;

 

select name 

from employee

where sex like '여';

 

select manager1

from department;

 

select employee.name,employee.address

from employee,department

where department.deptname like '컴공';

 

select count(employee.deptno)

from employee,department

where department.manager1 like 7 and employee.deptno= department.deptno

group by employee.deptno;

 

select  department.deptno, department.deptname, employee.name, sum(works.hours_worked)  from works, employee, department

where employee.empno = works.empno and employee.deptno = department.deptno

group by employee.name, department.deptname, department.deptno

order by department.deptno,employee.name;

 

select project.projno, project.projname,count(works.empno)

from project,works

where project.projno=works.projno

group by project.projno, project.projname

having count(works.empno)>3;

 

select name

from employee

where deptno in (select deptno

from employee

group by deptno

having count(deptno)>2);