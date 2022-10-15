use org

create table trainee
(
TID int,
TName varchar(20)
)

--Sequence
create sequence ID as int start with 100 increment by 5

insert into trainee values(NEXT VALUE FOR ID,'John')
insert into trainee values(NEXT VALUE FOR ID,'Sam')
insert into trainee values(NEXT VALUE FOR ID,'Paul')
insert into trainee values(NEXT VALUE FOR ID,'James')

select * from trainee

create table trainer
(
TID int,
TName varchar(20)
)

--alter sequence
alter sequence ID restart with 1000 increment by 1

insert into trainer values(NEXT VALUE FOR ID,'Jane')
insert into trainer values(NEXT VALUE FOR ID,'Peter')
insert into trainer values(NEXT VALUE FOR ID,'Rita')
insert into trainer values(NEXT VALUE FOR ID,'Riya')

select * from trainer

--drop sequence
drop sequence ID

insert into trainer values(NEXT VALUE FOR ID,'Sam')



--Index
--clustered index on trainee table
create clustered index ind_TID on trainee(TID)

--Non clustered index on trainee table
create index ind_TName on trainee(TName)


--Synonyms
create synonym work for Worker

select * from work
select * from Worker


--Views
-- 1.Simple View
create view work_view
as
select * from Worker where DEPARTMENT='Admin'

--Retrieve the view
select * from work_view


--2. Complex View

create view BonusWork
as
select w.worker_id,w.first_name,w.salary,w.DEPARTMENT,b.bonus_amount
from Worker as w inner join Bonus as b on w.WORKER_ID=b.WORKER_REF_ID;

select * from BonusWork



--String functions
SELECT CONCAT('TIETO', 'EVRY') as Concat; --concat

SELECT LEN('TIETO EVRY') as Length; --Length

SELECT SUBSTRING('SQL Tutorial', 1, 3) AS substring; --substring

SELECT TRIM('    Tietoevry     ') AS TrimmedString;  --Remove leading and trailing spaces from a string

SELECT UPPER('Tieto Evry Trainee software Engineer') as ToUpper; --to upper case

SELECT REVERSE('Tietoevry Trainings')as Reverse; --reverse

SELECT REPLICATE('SQL Tutorial ', 3) as Replicate; --replicate 3 times


-- Math functions
Select abs(-6) as ABSOLUTE; -- absolute value

Select sign(10) as Sign;--This method returns 1 if X is positive, -1 if it is negative and 0 if the value of X is 0.

Select floor(5.7)as floor; --returns the largest integer value that is either less than X or equal to it

Select power(2,5)as power; --function returns the value of x raised to the power of Y 

Select round(5.7345,2) as Round; --function returns the value of X rounded off to 2 decimal value

Select sqrt(9) as squareroot; --sqrt

---Datetime Function-----
 select GETDATE() as todays_date

 

