--Stored Procedure syntax
GO
use TestDB
GO

-- =============================================
-- Author:		Kamaljeet
-- Create date: 22-01-2026
-- Description:	Procedure to retrieve Order details by OrderId
-- =============================================
create or alter procedure myPractice
    --optional or parameters
    @OrderId int
as begin
    select *
    from Orders
    where OrderId = @OrderId
end;
exec myPractice 5001
go


-- =============================================
-- Description:	Procedure to retrieve customer details by their name and city
-- =============================================
create or alter procedure SP_GetCustomer_By_NameAndCity
    --optional or parameters
    @FullName varchar(100),
    @City varchar(50)
as begin
    select *
    from Customers
    where FullName = @FullName and City = @City
end;
exec SP_GetCustomer_By_NameAndCity 'Gopi Suresh', 'Coimbatore'
go
-- Go sepearates the queries 



-- =============================================
-- Description:	Procedure to Update User details by their name
-- =============================================
create or alter PROCEDURE SP_Update_NameAndAge_by_name
    @Name char(50)
as BEGIN
    update TestTbl 
set Name='Kamal',Age=26 
where Name=@Name
end;
exec SP_Update_NameAndAge_by_name 'Rahu'
go


-- =============================================
-- Description:	Procedure to insert User details in TestTbl
-- =============================================
create or alter  PROCEDURE  SP_Insert_data_in_TestTbl
    @Name char(50),
    @Age INT
as
begin
    INSERT INTO TestTbl
        (Name, Age)
    VALUES
        (@Name, @Age)
    --now to retrive the data  : check whether data is inserted or not
    select *
    from TestTbl
END
exec SP_Insert_data_in_TestTbl 'kamal' , '23'
go

-- =============================================
-- Description:	Procedure to CREATE User Table
-- =============================================
create or alter procedure SP_Create_UserTable
as
begin
    CREATE TABLE Users
    (
        UserId INT NOT NULL PRIMARY KEY,
        -- Manual PK
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Email NVARCHAR(255) NOT NULL UNIQUE,
        PhoneNumber NVARCHAR(15)
    );
end
exec SP_Create_UserTable
go


-- =============================================
-- Description:	Procedure to INSERT record in User Table
-- =============================================
create or alter PROCEDURE SP_Insert_into_UserTable
    @UserId int ,
    @FullName varchar(100),
    @LastName varchar(100),
    @Email varchar(510),
    @PhoneNumber varchar(30)
as
begin
    INSERT INTO Users
        (UserId,FirstName, LastName, Email, PhoneNumber)
    VALUES
        (@UserId, @FullName, @LastName, @Email, @PhoneNumber)
end
exec SP_Insert_into_UserTable '109','Rohan','singh','asfinds@gamil.com','2342123141'
go

select * from Users
go


-- =============================================
-- Description:	Procedure to UPDATE User details by their name
-- =============================================
create or alter PROCEDURE SP_Update_user_email_by_ID
    @UserId int,
    @Email varchar(510)
as BEGIN
    update Users 
set Email=@Email 
where UserId=@UserId
end;
exec SP_Update_user_email_by_ID '101', 'demo@gamil.com'
go


-- =============================================
-- Description:	Procedure to DELETE User details by their Id
-- =============================================
create or alter  PROCEDURE SP_delete_user_by_id
@UserId int
as begin
delete from Users where UserId = @UserId
END
exec SP_delete_user_by_id '109'
go
