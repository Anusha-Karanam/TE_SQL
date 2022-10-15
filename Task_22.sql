use ORG

--1. Scalar Function with 2 parameters - any concept
create function multiplication(@a int,@b int)
returns int
as
begin
	return @a * @b
end

select dbo.multiplication(4,3) as Result



--2. Procedure with OUTPUT parameter
SELECT * FROM Worker

--Creating Procedure for calculating number of employee in ADMIN department
create procedure AdminCount(@ACount int OUTPUT)
as
Begin

	Select @ACount=count(WORKER_ID) from Worker where DEPARTMENT='Admin'
End

--execute the procedure with ouput parameter
Declare @Result int
exec AdminCount @Result OUTPUT
Print @Result



--3. Trigger to restrict DML access between 6:00PM to 10.00AM
select * from Bonus

create trigger dmlTrigger
on bonus -- table name
FOR INSERT, UPDATE, DELETE
as
begin
	if ((DATEPART(HH,GETDATE())>17) or (DATEPART(HH,GETDATE())<10))
	BEGIN
		print 'You cannot perform DML into the Bonus table between 6:00PM to 10.00AM'
		Rollback transaction 
	END
end

--Restricting the access for DML operations 
update Bonus set BONUS_AMOUNT=4500 where WORKER_REF_ID=1
insert into Bonus values(3,5500,'12/09/2022')
delete from Bonus where WORKER_REF_ID=3



--4. Server-scope trigger to restrict DDL access
create trigger server_ddl
on ALL Server
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End

--Inside same database
create table demo(
	tid int
)

--Change to another database
use employee

create table demo
(
id int
)
--disable trigger
Disable trigger server_ddl on ALL SERVER




--5. Working of explicit transaction with Save transaction
BEGIN TRANSACTION
	insert into trainee values(108,'Anna');
	update trainee set TName='Jane' where TID=115;
	--SAVEPOINT
	SAVE TRANSACTION insertUpdate
	delete from trainee where TID=100;
	ROLLBACK TRANSACTION insertUpdate
COMMIT TRANSACTION

select * from trainee



--6. Difference between throw and Raiserror in exception handling
create procedure DivideByZero
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	IF(@num2=0)
	BEGIN
		RAISERROR('Cannot Divide By Zero',16,127) --RaiseError
	END
	ELSE
	BEGIN
		SET @Result=@num1/@num2
		PRINT 'Value is:' + CAST(@Result as varchar)
	END
END

--execute a procedure
EXEC DivideByZero 10,0


create procedure DivideByZeroTryCatch
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@num2=0)
			THROW 50001,'Cannot Divide By Zero',1 -- Throw
			SET @Result=@num1/@num2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END
--execute
execute DivideByZeroTryCatch 10,0
