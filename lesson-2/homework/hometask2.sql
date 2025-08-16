--task 1
CREATE TABLE employees( EmpID int , name varchar(50), salary decimal(10,2))

--task 2
INSERT INTO employees VALUES 
(1, 'Karl', 500.95),
(2, 'Tony', 499.65),
(3, 'Edorson', 705.40);
                                   
--task 3
UPDATE employees
SET salary = 7000
WHERE EmpID = 1

--task 4
DELETE FROM employees
WHERE EmpID=2

--task 5
/*delete-DML buyruqlar turiga kiradi , examples: DELETE FROM Employees WHERE Age < 18;  jadvladagi malumotlar uchadi lekin jadval tuzilmasi saqlanib qoladi   
truncate DDl   buyuqlar turiga kiradi, esxamples:TRUNCATE TABLE Employees;  jadavaldagi malumotlar uchadi bunda ham jadval tuzilmasi saqlanib qoladi,
truncate ni delete dan farqi truncate tezroq ishlaydi, truncateda jadvalni qayta tiklasa buladi delete buyrug'ida esa yuq, 
where buyrug'ini deleteda ishlatsa buladi  truncateda esa yuq.
drop DDL buyruqlar turiga kiradi,  examples: DROP TABLE Employees; jadvaldagi malumotlar ham tuzilishi ham butunlay uchadi, where buyurg'ini ishlatib bumaydi, qayta tiklab bulmaydi. */

--task 6
alter table employees
alter column  name varchar(60)

--task 7
alter table employees
add departments varchar(50)

--task 8
alter table employees
alter column salary float

--task 9
create table Departments ( DepartmentID int primary key, DepartmentName varchar(50) ) 

--task 10
truncate table employees

--task 11
 insert into Departments ( DepartmentID,  DepartmentName)
 select 1,  'HR'
 union all
 select 2, 'Management'
 union all
 select 3, 'Finance'
 union all
 select 4, 'Marketing'
 union all
 select 5, 'IT'

 --task 12
 UPDATE Employees
SET Departments = 'Management'
WHERE Salary > 5000;

--task 13
delete from  employees

--task 14
alter table employees
drop column departments

--task 15
exec sp_rename 'employees', 'StaffMembers';

--task 16
drop table Departments

--task 17
create table Products (ProductID int primary key, ProductName varchar(50), Category varchar (30), price decimal (10,2))
drop table Products
--task 18
alter table Products
add constraint price check ( price>0);

--task 19
alter table Products
add  StockQuantity  int default 50

--task 20
exec sp_rename 'Products.Category', 'ProductCategory', 'column';

--task 21
insert into Products  values
(11, 'iPhone 14', 'smartphone', 700.99, 56),
(12, 'Nike Air Max', 'shoes', 45.34, 45),
(13, 'Potato', 'vegetables', 3.99, 34),
(14, 'Toyota', 'car', 5000, 10),
(15, 'T-shirt', 'clothing', 6.59, 100);

--task 22
select *into Products_Backup
from Products;

--task 23
exec sp_rename 'Products', 'Inventory';

--task 24
ALTER TABLE Inventory
DROP CONSTRAINT price;
alter table Inventory
alter column  price float;

--task 25
alter table inventory
add  ProductCode int identity (1000,5);
