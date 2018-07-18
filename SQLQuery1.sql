create table Designation(
desg_ID int PRIMARY KEY,
desg_Description varchar(25)
);

create table Organisation(
org_ID int PRIMARY KEY,
org_Description varchar(25)
);

create table Employee(
emp_ID int IDENTITY(1000,1) PRIMARY KEY,
Name varchar(20) NOT NULL,
Designation_ID int references Designation(desg_id),
Organisation_ID int references Organisation(org_id),
Present_Address varchar(20)
)

select * from Organisation
select * from Designation
select * from Employee

insert into Designation values (10,'CEO')
insert into Designation values (11,'Manager')
insert into Designation values (12,'TL')
insert into Designation values (13,'SE')
insert into Designation values (14,'Trainee')

insert into Organisation values (100,'A')
insert into Organisation values (101,'B')
insert into Organisation values (102,'C')
insert into Organisation values (103,'D')
insert into Organisation values (104,'E')

insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('ASD','11','101','City1')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('QWE','12','103','City2')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('UIO','10','104','City5')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('BNT','12','100','City9')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('DFG','14','101','City3')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('BVC','14','102','City1')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('TRG','12','102','City2')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('XZC','13','103','City2')
insert into Employee (Name,Designation_ID,Organisation_ID,Present_Address) values ('LQA','13','104','City3')

delete from Employee where emp_ID=1007;

alter table Employee add PIN varchar(20);

Update Employee set PIN = 'PIN1' where emp_ID = 1002

Update Employee set PIN = 'pin1' where emp_ID = 1002

alter table Employee alter column Name varchar(50)

select * from Employee where Name like '%T%'

select * from Employee where emp_ID between 1002 and 1007

select Present_Address from Employee group by Present_Address

select Name from Employee order by Name desc;

update Employee set PIN='pin2' where Present_Address in('City2','City3')


select * from Employee where PIN='pin2'