create table UserDetails
(
ID int IDENTITY(1000,1) PRIMARY KEY,
Salutation int NOT NULL,
First_Name varchar(20) NOT NULL,
Last_Name varchar(20) NOT NULL,
Gender int NOT NULL,
Comments varchar(50)
)

select * from UserDetails

insert into UserDetails values (1,'abc','def',1,'')

insert into UserDetails values (2,'sde','erfr',2,'ok')

create procedure addUser
@Salutation int,
@First_Name varchar(20),
@Last_Name varchar(20),
@Gender int,
@Comments varchar(50)
as
begin
insert into UserDetails values (@Salutation,@First_Name,@Last_Name,@Gender,@Comments)
end
go

truncate table userDetails

select * from UserDetails

delete from UserDetails where ID=1001

create procedure deleteUser
@identity int
as
begin 
delete from UserDetails where ID = @identity
end
go

exec deleteUser 1000

exec addUser 1,'abc','ddg',1,'hello'

create procedure selectUser
@user_id int
as
begin
select * from UserDetails where ID=@user_id
end
go

exec selectUser 1002

update UserDetails set Salutation = 1,First_Name = 'abc',Gender = 1 where ID = 1008

create procedure updateUser
@identity int,
@salutation int,
@first_name varchar(20),
@last_name varchar(20),
@gender int,
@comments varchar(50)
as 
begin
update UserDetails
set Salutation=@salutation, First_Name=@first_name, Last_Name=@last_name,Gender=@gender,Comments=@comments
where ID=@identity
end
go

select * from UserDetails

exec updateUser 1011,2,'Adwe','EWed',2,''