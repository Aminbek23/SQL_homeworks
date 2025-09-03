
--task 1
select ProductName, SupplierName from Products
cross join 
Suppliers

--task 2
select DepartmentName, Name from Departments
cross join 
Employees

--task 3
select Suppliers.SupplierName, Products.ProductName from Suppliers
inner join  Products
on Suppliers.SupplierID=Products.SupplierID

--task 4
select Orders.OrderID,Customers.FirstName,Customers.LastName from orders
inner join Customers
on Customers.CustomerID=Orders.CustomerID

--task 5
select Students.Name, Courses.CourseName from Students
cross join  Courses

--task 6
select Products.ProductName  , Orders.OrderID from Products
inner join  Orders
on Products.ProductID=Orders.ProductID

--task 7
select Employees.Name ,Departments.DepartmentName from Employees
inner join Departments
on Departments.DepartmentID=Employees.DepartmentID

--task 8
select Students.Name, Enrollments.CourseID from Students
inner join Enrollments
on Students.StudentID=Enrollments.EnrollmentID

--task 9
select*from Payments
inner join Orders
on Payments.OrderID=Orders.OrderID

--task 10
select*from Products
inner join  Orders
on Products.ProductID=Orders.ProductID
where Products.Price>100

--task 11  
select*from Departments
cross join Employees
  where Employees.DepartmentID<>Departments.DepartmentID 

 --task 12
 select*from Products
 inner join Orders
 on Products.ProductID=Orders.ProductID
 where Orders.Quantity>Products.StockQuantity

 --task 13
select Customers.FirstName, 
Sales.ProductID,
sum(SaleAmount) as  total_amount
from Customers
inner join  Sales
on Customers.CustomerID=Sales.CustomerID
group by Customers.FirstName,Sales.ProductID
having sum(SaleAmount)>=500

--task 14
select Students.Name, Courses.CourseName from Courses
inner join Enrollments
on Courses.CourseID=Enrollments.CourseID 
inner join Students
on Enrollments.StudentID=Students.StudentID

--task 15
select Products.ProductName,Suppliers.SupplierName from Products
inner join Suppliers
on Products.SupplierID=Suppliers.SupplierID
where SupplierName like '%tech%'

--task 16
select*from Orders 
inner join Payments
on Orders.OrderID=Payments.OrderID
where Payments.Amount<Orders.TotalAmount

--task 17
select Employees.Name,Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID

--task 18
select * from Products
inner join Categories
on Products.Category=Categories.CategoryID
where CategoryName = 'Electronics' 
or CategoryName= 'Furniture'

--task 19
 select*from Sales
 inner join Customers
 on Sales.CustomerID=Customers.CustomerID
 where Country= 'USA'

--task 20
 select*from Orders
 inner join Customers
 on Orders.CustomerID=Customers.CustomerID
 where Country= 'Germany'
 and TotalAmount>100

--task 21
select 
    e1.EmployeeID   as Emp1_ID,
    e1.Name         as Emp1_Name,
    e1.DepartmentID as Dept1,
    e2.EmployeeID   as Emp2_ID,
    e2.Name         as Emp2_Name,
    e2.DepartmentID as Dept2
from Employees e1
join Employees e2
    on e1.EmployeeID < e2.EmployeeID      
   and e1.DepartmentID <> e2.DepartmentID
order by  e1.EmployeeID, e2.EmployeeID;


--task 22
select Products.ProductName, (Products.Price*Orders.Quantity) as total from Payments
inner join Orders
on Payments.OrderID=Orders.OrderID
inner join Products
on Products.ProductID=Orders.ProductID
where (Products.Price*Orders.Quantity)<>Payments.Amount

--task 23
select students.Name,Courses.CourseName from  Students
left join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Courses.CourseID=Enrollments.CourseID
where CourseName is null

--task 24
select 
    m.EmployeeID   as ManagerID,
    m.Name         as ManagerName,
    m.Salary       as ManagerSalary,
    e.EmployeeID   as EmployeeID,
    e.Name         as EmployeeName,
    e.Salary       as EmployeeSalary
from Employees m
join Employees e
    on m.EmployeeID = e.ManagerID
where m.Salary <= e.Salary;

--task 25
select*from Orders
left join Payments
on Orders.OrderID=Payments.OrderID
left join Customers
on Orders.CustomerID=Customers.CustomerID
where Payments.OrderID IS NULL
