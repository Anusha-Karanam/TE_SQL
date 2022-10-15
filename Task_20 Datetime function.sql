USE ORG;
 create table employee1(
 EID int,
 EName varchar(20),
 Ephone int,
 Esalary int
 )
 insert into employee1 values(1,'Raksha',959161751,40000)
 insert into employee1 values(2,'Ahalya',998031705,60000)
 insert into employee1 values(3,'Kripa',123456790,800000)
 insert into employee1 values(4,'Diana',998031790,90000)

 --Synonym-

 create synonym emp1 for employee1
 select * from emp1;
 select * from employee1;
 select EName from emp where EID=1

 --index-------
  create table department(
 DID int Primary Key,
  EName varchar(20),
 DName varchar(20),
 Des varchar(20)

 )
 insert into department values(1,'Raksha','CSE','HOD')
 insert into department values(2,'Ahalya','ECE','PROF')
 insert into department values(3,'Kripa','AI','PROF')
 insert into department values(4,'Diana','ISE','HOD')
 
 select * from department
 --create a clustered index on department table
 create clustered index name on department(EName)
 --create a mon clustered index on department table
 create index Name on department(Des)

 select * from employee1;
 select * from department

 --filtered index
 create index Desgn on department (Des) where Des ='HOD'

 select * from department where Des='HOD'

 --Views

 select * from department
 --create view
 create view dep_View
 as
 select * from department where Des='HOD'

 --retrieve view
 select * from dep_View

 --insert values in view table
 insert into dep_View values(5,'Keerti','ECE','PROF')
 insert into dep_View values(6,'Kiya','ECE','HOD')

 --update
 update dep_View set Des='Asst Prof' where DID=1
 update department set EName='Riya' where  DID=2
 ---complex view
 select e.EID,e.EName, d.DName,d.Des from employee1 as e inner join department as d on  e.EName=d.EName

create view employeedetails
as
select e.EID,e.EName,d.DName,d.Des
from employee1 as e inner join department as d on e.EName=d.EName;

 select * from employeedetails

 --insert(View or function 'employeedetails' is not updatable because the modification affects multiple base tables.)
 insert into employeedetails values(7,'Rihan','Mech','HOD')

 --update
 update employeedetails set EName='Kiyaika' where EID=3

 --sequence

 create table product
 (
 pid int,
 pname varchar(20),
 pbrand varchar(20),
 price int
 )
 create sequence ProductId as int start with 1000 increment by 2
 insert into product values(NEXT VALUE FOR ProductId,'Salt','TATA',30)
 insert into product values(NEXT VALUE FOR ProductId,'Wheat','Ashirwad',90)
 insert into product values(NEXT VALUE FOR ProductId,'Rice','IndiaGate',150)
 insert into product values(NEXT VALUE FOR ProductId,'Shampoo','Loreal',190)

 select * from product


 ---STRING FUNCTIONS-----
 select Des, LEN(Des) as designation from department

 select LOWER(EName) from department;

 select REPLACE('Replicate','E','I')

 ---MATH FUNCTIONS
 select ROUND(89.89,2) as Round_Value

 select ABS(-78) as abs_value

 select CEILING(9.6) as cieling_value

 select cos(1.048) as cos_value
 select FLOOR(4.8) as floor_value
 select LOG(14) as log_value
 select RADIANS(120) as rad_value
 select DEGREES(PI()) as pi_value
 select  POWER(3,4) as power_value

 ---Datetime Functions-----
 select GETDATE() as todays_date

 select *,GETDATE() as JoinedDate from department


 ---Dateadd function
 select *, DATEADD(day,30,GETDATE()) as Month_WORK_ANNIVERSARY from department
 alter table employee1 add DateofBirth DATE
 select * from employee1

  update employee1 set DateofBirth='2000-5-14' where EID=1
  update employee1 set DateofBirth='1978-1-16' where EID=2
   update employee1 set DateofBirth='1990-08-9' where EID=3
   update employee1 set DateofBirth='1980-9-6' where EID=3
   update employee1 set DateofBirth='2001-8-16' where EID=4
    update employee1 set DateofBirth='2000-9-6' where EID=5

	select * from employee1

	--DateDiff
	select DATEDIFF(YEAR,DateofBirth,getdate()) as age, * from employee1
	-- Age of employee =44 
	select * from employee1 where DATEDIFF(YEAR,DateofBirth,getdate()) = 44

	--DateName
	select DATENAME(dw,DateofBirth) as day,* from employee1 where DATENAME(dw,DateofBirth)   ='Thursday'
	select DATENAME(dw,DateofBirth) as day,* from employee1 where DATENAME(dw,DateofBirth)   ='Monday'
	--datepart
	select DATEPART(month,DateofBirth) as monthofbirth from employee1