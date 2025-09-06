--task 1
select ord.OrderID,concat( cust.FirstName,' ',cust.LastName) as CustomerName,
year(orderdate) as year from Orders as ord
inner join Customers as cust
on ord.CustomerID=cust.CustomerID
where  year(orderdate)>2022

-- task 2
select emp.Name as EmployeeName ,dep.DepartmentName from Employees as emp
inner join Departments as dep
on emp.DepartmentID= dep.DepartmentID
where dep.DepartmentName = 'Sales'
or dep.DepartmentName ='Marketing'

--task 3
select  dep.DepartmentName, max(emp.Salary) as max_salary from Departments dep
inner join Employees as emp
on dep.DepartmentID= emp.DepartmentID
group by dep.DepartmentName

--task 4
select concat( Customers.FirstName,'  ',Customers.LastName) as CustomerName, 
Orders.OrderID,Orders.OrderDate from Customers
inner join  Orders 
on Customers.CustomerID=Orders.CustomerID
where  Orders.OrderDate like '2023%'
and Customers.Country = 'USA'

--task 5
select concat(Customers.FirstName,' ',Customers.LastName) as CustomerName,sum(orders.quantity) as TotalOrders from Orders
inner join  Customers
on Orders.CustomerID=Customers.CustomerID
group by concat(Customers.FirstName,' ',Customers.LastName)

--task 6 
select Products.ProductName,Suppliers.SupplierName from Products
inner join  Suppliers
on Products.SupplierID=Suppliers.SupplierID
where Suppliers.SupplierName='Gadget Supplies' or
Suppliers.SupplierName='Clothing Mart'

--task 7
select concat(Customers.FirstName,' ',Customers.LastName) as CustomerName,
max(Orders.OrderDate) as MostRecentOrderDate
from Customers
left join Orders
on Customers.CustomerID=Orders.CustomerID
group by concat(Customers.FirstName,' ',Customers.LastName)

--task 8
select concat(Customers.FirstName,' ',Customers.LastName) as CustomerName,
sum(Orders.TotalAmount) as OrderTotal
from Orders
inner join  Customers
on Customers.CustomerID=Orders.CustomerID
group by concat(Customers.FirstName,' ',Customers.LastName)
having sum(Orders.TotalAmount )>500

--task 9
select Products.ProductName,Sales.SaleDate,Sales.SaleAmount from Products
inner join  Sales
on Products.ProductID=Sales.ProductID
where Sales.SaleDate like '2022%' or
Sales.SaleAmount >400

--task 10
select Products.ProductName, sum(Sales.SaleAmount) as TotalSalesAmount from Sales
inner join Products
on Products.ProductID=Sales.ProductID
group by Products.ProductName

--task 11
 select Employees.Name as EmployeeNAme , Departments.DepartmentName,Employees.Salary from Employees
 inner join  Departments
 on Employees.DepartmentID=Departments.DepartmentID
 where Departments.DepartmentName = 'Human Resources' and
 Employees.Salary>60000
 
--task 12
select Products.ProductName, year(Sales.SaleDate) as year,Products.StockQuantity from Products
inner join Sales
on Products.ProductID=Sales.ProductID
where year(Sales.SaleDate)= 2023 and Products.StockQuantity>100

--task 13
select Employees.Name as EmployeeName, Departments.DepartmentName,year(Employees.HireDate) as year from Employees
inner join  Departments
on Employees.DepartmentID=Departments.DepartmentID
where  Departments.DepartmentName='Sales' or
year(Employees.HireDate)>2020


--task 14
 select concat(Customers.FirstName,' ',Customers.LastName) as CustomerName,
 Orders.OrderID, Customers.Address, Orders.OrderDate
 from Customers
inner join Orders
on Customers.CustomerID=Orders.CustomerID
where Customers.Address like '[0-9][0-9][0-9][0-9]%' and Customers.Country ='USA'

--task 15. Qaytarish: ProductName, Category, SaleAmount
--Topshiriq: Elektronika toifasidagi mahsulotlarning sotuvlarini yoki summasi 350 dan katta bo‘lgan sotuvlarni ko‘rsating.
--Jadvallar: Products, Sales
 select Products.ProductName,Products.Category,Sales.SaleAmount from Products
 inner join Sales
 on Products.ProductID=Sales.ProductID


--task 16
 select Categories.CategoryName, sum(Products.StockQuantity) as ProductCount from Products
 inner join Categories
 on Products.Category=Categories.CategoryID
 group by Categories.CategoryName

--task 17
select concat(Customers.FirstName,' ',Customers.LastName) as CustomerName,
Customers.City,Orders.OrderID,Orders.TotalAmount as Amount
from Customers
inner join Orders
on Customers.CustomerID=Orders.CustomerID
where Customers.City='Los Angeles' and Orders.TotalAmount>300 

--task 18. 
select Employees.Name as EmployeeName, Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName='Human Resources' or Departments.DepartmentName='Finance'

--task 19
select Employees.Name as EmployeeName, Departments.DepartmentName, Employees.Salary from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName='Sales' or Departments.DepartmentName='Marketing' 
and Employees.Salary>60000
