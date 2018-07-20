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

select * from Employee where PIN='pin2' order by Name;

select count(emp_ID) as emp_count, Present_Address FROM Employee GROUP BY Present_Address HAVING count(emp_ID) >= 1;

SELECT emp_ID, Name, ISNULL(PIN,0) as newPIN from Employee

select * from Employee

select Employee.emp_ID, Employee.Name, Employee.Present_Address, Designation.desg_Description, 
Organisation.org_Description from ((Employee inner join Designation on Employee.Designation_ID=Designation.desg_ID)
inner join Organisation on Employee.Organisation_ID = Organisation.org_ID)

select Employee.emp_ID, Employee.Name, Designation.desg_Description from Employee left join Designation 
on Employee.Designation_ID = Designation.desg_ID

select Employee.emp_ID, Employee.Name,Organisation.org_Description, Employee.Organisation_ID from Employee right join Organisation 
on Employee.Organisation_ID = Organisation.org_ID 

create procedure selEmployees
as
select * from Employee;

create procedure addEmployee
@Name varchar (50),
@Designation_ID int,
@organisation_ID int, 
@Present_Address varchar(20),
@PIN varchar(20)
as
begin 
     SET NOCOUNT ON 

     INSERT INTO addEmployee
          (                    
            Name,
			Designation_ID,
			Organisation_ID,
			Present_Address,
			PIN          
          ) 
     VALUES 
          ( 
            @Name,
            @Designation_ID,
            @Organisation_ID,
            @Present_Address,
			@PIN
          ) 

END 

drop procedure addEmployee

drop procedure selEmployees

exec [dbo].[addEmployee] 'SFB',13, 104, 'City5','pin4' ;

exec addEmployee 'VSK', 12, 102, 'City9', 'pin7';

exec addEmployee 'ERF', 11, 103, 'City7', 'pin6';

exec selEmployees

create index index1 on Employee (Present_Address)

create view view_Emp AS
SELECT Name, Present_Address
FROM Employee
WHERE emp_ID<1006;

select * from view_Emp

select * from Designation

select Name, Present_Address,
case
  when  Name like '%A%'  then 'contains A'
  else 'no A present' 
end
from Employee;

alter table Designation 
add check (desg_id<17)

select desg_Description from Designation where desg_id in (select desg_ID from Designation where desg_ID <= 12)

select e1.Name AS Emp1, e2.Name AS Emp2, e1.Present_Address
from Employee e1, Employee e2
where e1.emp_ID != e2.emp_ID
and e1.Present_Address = e2.Present_Address 
order by e1.Present_Address

select e.name, o.org_Description 
from employee e cross join Organisation o
