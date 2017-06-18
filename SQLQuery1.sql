create database dc
create table TblRegister
(
 UserId int identity (1001,1),                         
UserName char(20),
sex char(10),
PhoneNumber bigint,
 UserAddress varchar(30),
 MailId varchar(40),
 UserPwd varchar(20),
 Primary key(UserId)
 )
 select * from TblRegister


 drop table TblRegister


 create table TblStaffDetails
(
StaffId int ,
StaffName char(20),
Designation char(20),
StaffPwd varchar(20),
Primary key(StaffId)
)
insert into TblStaffDetails values(101,'Stella','Receptionist','Staff1'),(102,'Joseph','Lab Technician','Staff2'),(103,'Shravan','Chief of Lab','Staff3')

select * from TblStaffDetails

create table TblPatientAppointment
(
userId int, 
 ApplicationId int identity(1,1),
PatientName char(20),
DOB VARCHAR(20),
Age int,
 gender char(10),
 PhoneNo bigint,
 PatientAddress varchar(40),
 TestToBeTaken varchar(20),
 Appointdate VARCHAR(20),
 Primary key(ApplicationId),
 foreign key(userId) references TblRegister(UserId),
 sta_tus char(10)
)
drop table TblPatientAppointment
select * from TblPatientAppointment 


create trigger trgstatus1
on
TblPatientAppointment
for insert as
declare @status char(10) = 'Pending' 

update TblPatientAppointment set sta_tus=@status 
create trigger trgid2
on
TblRegister
for insert as
declare @id char(10) = (select UserId from inserted)
insert into TblPatientAppointment(userId)values(@id)

drop table TblPatientAppointment
create table TblPatientDetails
(
 ApplicationId int identity(1,1),
PatientName char(20),
DOB VARCHAR(20),
Age int,
 gender char(10),
 PhoneNo bigint,
 PatientAddress varchar(40),
 TestToBeTaken varchar(20),
 Appointdate VARCHAR(20),
 Primary key(ApplicationId),
 
)
select * from TblPatientDetails

alter table TblPatientAppointment drop column status
alter table TblPatientAppointment add  status char(10) 

select * from TblPatientAppointment

create table TblPappointmentStatus
 (
 ApplicationId int,
 ApplicationStatus char(20) Default 'Pending',
 Appointdate VARCHAR(20),

 )
 select * from TblPappointmentStatus

 create trigger trAppStatus
 on TblPappointmentStatus
 for update
 as
 declare @id int=(select ApplicationId from inserted)
 insert into TblPappointmentStatus(ApplicationId) values(@id)


 drop table TblPappointmentStatus










create table TblPatientDetails
(
 ApplicationId int identity(1,1),
PatientName char(20),
DOB VARCHAR(20),
Age int,
 gender char(10),
 PhoneNo bigint,
 PatientAddress varchar(40),
 TestToBeTaken varchar(20),
 Appointdate VARCHAR(20),
 Primary key(ApplicationId),
)

 insert into TblPatientDetails(PatientName,DOB,Age,gender,PhoneNo,PatientAddress,TestToBeTaken,Appointdate)values ('dee','21-01-1994',20,'f',9849999999,'ghfyk','Blood Test',23/05/2017)
 select * from TblPatientDetails


 drop table TblPatientDetails













 create table TblAppoitnment
 (
 ApplicationId int identity(1,1),
 PatientId int,
 TestToBeTaken varchar(20),
 Appointdate VARCHAR(20),
 Primary key(ApplicationId),
 foreign key(PatientId) references TblPatientDetails(PatientId)
 )

 select * from TblAppoitnment
 truncate table TblAppoitnment
 drop table TblAppoitnment

 create table TblAppointmentStatus
 (
 ApplicationId int,
 ApplicationStatus char(20) Default 'Pending',
 Appointdate VARCHAR(20),
 foreign key(ApplicationId) references TblAppoitnment(ApplicationId)
 )

select * from TblAppointmentStatus

 create trigger trgAppointment
 on TblAppoitnment
 for insert
 as
 declare @id int=(select ApplicationId from inserted)
 declare @date varchar(20)=(select Appointdate from inserted)
 insert into TblAppointmentStatus(ApplicationId,Appointdate) values(@id,@date)

 create trigger trgAppStatus
 on TblAppointmentStatus
 for update
 as
 declare @id int=(select ApplicationId from inserted)
 insert into TblAppointmentStatus(ApplicationId) values(@id)
 drop trigger trgAppStatus
  drop trigger trgAppointment


create table TblLogin
(
 UserId int ,                         
 UserPwd varchar(20),
 Primary key(UserId)
 )