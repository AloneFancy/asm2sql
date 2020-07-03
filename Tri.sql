--------------------Thu tuc insert----------------------------------
Create proc productmodel_Add( @id int (11), @name varchar(40), @discription varchar(1000), @status int(1),@deatailedInfo varchar(1000), @brand char(10),@type varchar(40))
AS
	Begin
	IF (dbo.checkStatus(@id)<>@status)
		Print N'Sai thong tin trang thai san pham'
	Insert into productmodel(id,name,discription,status,detailedinfo,brand,type) VALUES (@id,@name,@status,@deatailedInfo,@brand,@type)
	End
--------------------Ham kiem tra tinh trang --------------------------
create function dbo.checkStatus(@id int(11))
Returns bit as
Begin
	Declare @bitRetVal as Bit 
	Set @bitRetVal=0
	Declare @Count int
	Set @Count=(Select	Count(Product.STT)--,Dept_locations.dnumber
				From	Productmodel inner join product on Productmodel.id=product.id
				Where	product.id=@id
				Group by product.id)
	If (@Count>0) Set @bitRetVal=1
	Return @bitRetval
End
-----------------------Trigger-----------------------------------------
Create trigger productmodel_add
on dbo.productmodel
For	insert
as
Begin
	Declare @status int
	Declare @id		int
	Select @status=status,@id=id from inserted
	if(dbo.checkStatus(@id)<>@status) Rollback tran	
End




--------------Ham kiem tra khoa ngoai--------------------
--CREATE FUNCTION dbo.checkDnoInEmp ( @dno int)
--Returns bit as
--begin
--	Declare @bitRetVal as Bit
--	Set @bitRetVal=1
--	Declare @dnoCheck int
--	Declare cursordno CURSOR FOR
--	Select dnumber from Department 
--	Open cursordno
--	Fetch next from cursordno
--		INTO @dnoCheck
--	WHILE @@FETCH_STATUS = 0
--	BEGIN
--		if (@dnoCheck = @dno) set @bitRetVal =0 
--		Fetch next from cursordno
--		INTO @dnoCheck
--	end
--	close cursordno
--	DEALLOCATE cursordno
--	Return @bitRetVal
--end

--Select dbo.checkDnoInEmp(1)
--Select * from Employee

--Declare @boolean int
--Select @boolean=dbo.checkDnoInEmp(1)
--print @boolean
--------------END-----------------------------
-------------------Thu tuc them vao employee co kiem tra khoa ngoai----------------------------------
--Select * from Employee
--Drop proc emp_Add
--Alter PROC emp_Add (@fname varchar(15),@minit  char(1),@lname varchar(15),@ssn char(9), @bdate DATE, @address char(30) , @sex char(1), @salary decimal(10,2),@superssn char(9), @dno int)
--AS
--	Begin
--		if (dbo.checkAge(YEAR(GETDATE())-YEAR(@bdate))=0)
--			print N'Tuoi < 18'
--		insert into Employee(fname,minit,lname,ssn,bdate,address,sex,salary,superssn,dno) values (@fname,@minit,@lname,@ssn,@bdate,@address,@sex,@salary,@superssn,@dno)	
--	End

--emp_Add 'Tri','D','Minh','01235673','2000-01-14','68 Hung Vuong','M',50000,'333445555','6'
--------------------end------------------------------------------------------------------------------

-------------------Ham kiem tra email co hop le hay ko-----------------------------------------------
--CREATE FUNCTION dbo.vaValidEmail(@EMAIL varchar(100))

--RETURNS bit as
--BEGIN     
--  DECLARE @bitRetVal as Bit
--  IF (@EMAIL <> '' AND @EMAIL NOT LIKE '_%@__%.__%')
--     SET @bitRetVal = 0  -- Invalid
--  ELSE 
--    SET @bitRetVal = 1   -- Valid
--  RETURN @bitRetVal
--END 
--Select dbo.vaValidEmail('minhtri1412000@gmail.com')
-------------------------end------------------------------------------------------------------------

------------------Ham kiem tra >18 tuoi-------------------------------------------------------------
--Alter function dbo.checkAge(@Age int)
--Returns bit as
--Begin
--	Declare @bitRetval as Bit
--	IF (@Age >=18)
--		set @bitRetval=1 -- valid
--	Else
--		set @bitRetval=0 -- invalid
--	Return @bitRetval
--End
--Select dbo.checkAge(YEAR(GETDATE())-YEAR(bdate)) from Employee
----------------------------------------------------------------------------------------------------

----------------------Ham Kiem tra co trung khoa chinh----------------------------------------------
--Drop function dbo.checkPrimaryKey
--Create function dbo.checkPrimaryKey(@Key char(9))
--Returns bit as
--Begin
--	Declare @bitRetVal as Bit 
--	Set @bitRetVal=1
--	Declare @ssnCheck char(9)
--	Declare cursorssn CURSOR FOR
--	Select ssn from Employee 
--	Open cursorssn
--	Fetch next from cursorssn
--		INTO @ssnCheck
--	WHILE @@FETCH_STATUS = 0
--	BEGIN
--		if (@ssnCheck = @Key) set @bitRetVal =0 
--		Fetch next from cursorssn
--		INTO @ssnCheck
--	end
--	close cursorssn
--	DEALLOCATE cursorssn
--	Return @bitRetVal
--end
--Select ssn from Employee
--Select dbo.checkPrimaryKey('01234568')
----------------------End--------------------------------------------------------------------------

--Select  Employee.fname, Employee.minit, Employee.lname
--From	Works_on,(Employee
--Inner Join Department On Employee.dno=Department.dnumber)
--Where	Department.dname='Research' And Works_on.hours in (Select sum(hours),pno From Works_on Where hours>10 Group by pno) 

--Alter trigger insertEmp
--ON dbo.Employee
--For insert
--AS
--Begin
--	Declare @Count int =0
--	Select @Count= Count(*) From inserted
--	Where Year(GetDate())- YEAR(inserted.bdate) <18
--	IF @Count >0
--	Begin
--		Rollback tran
--	End
--End

--Select * from Employee
--emp_Add 'Tri','D','Minh','01235173','2003-01-14','68 Hung Vuong','M',50000,'333445555','1'




--Declare @Count int
--Set @Count=		(Select	Count(Dept_locations.dlocation)--,Dept_locations.dnumber
--				From	Department inner join Dept_locations on Department.dnumber=Dept_locations.dnumber
--				Where	Dept_locations.dnumber=1
--				Group by Dept_locations.dnumber)
--IF @Count >0 print N'True'
--Select	Count(Dept_locations.dlocation)--,Dept_locations.dnumber
--				From	Department inner join Dept_locations on Department.dnumber=Dept_locations.dnumber
--				Where	Dept_locations.dnumber=1
--				Group by Dept_locations.dnumber)