
--task 1
select sale_cnt.ProductID, sale_cnt.TotalQuantity, sale_cnt.TotalRevenue 
from 
(
select s.ProductID, sum(s.quantity) as TotalQuantity,
sum(s.quantity*p.price) as TotalRevenue  
from sales s
join Products p
on s.ProductID=p.ProductID
group by s.ProductID
) as sale_cnt


--task 2
select 
Products.ProductID,Products.ProductName,Products.Category,
(Products.Price*total_quantity) as TotalQuantitySold
from Products
join (select Productid, sum(quantity) as total_quantity from  Sales
group by ProductID) as t
on Products.ProductID=t.ProductID

--task 3
create  function fn_GetTotalRevenueForProduct(@ProductID INT)  
returns decimal(10,2)
as
begin
 declare @total  decimal(10,2)
 select @total=sum(sales.Quantity*Products.Price) from dbo.Sales
 join dbo.Products on Products.ProductID=Sales.ProductID
 where @ProductID=Products.ProductID
 return @total
end

--task 4
create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table
as
return
( select Products.ProductName,
sum(sales.Quantity) as TotalQuantity,
sum(sales.Quantity*Products.Price) as TotalRevenue
 from Products
 join Sales 
 on Sales.ProductID=Products.ProductID
 where Products.Category=@Category
 group by products.ProductName)

 --task 5
create function dbo.fn_IsPrime (@Number INT)
Returns varchar(5) 
as
begin 
 declare @i int =2
 declare @result varchar(3)='yes'
 if @Number<2
 return 'no'
 while @i*@i<=@Number
 begin 
 if @number%@i=0
 begin set @result = 'no'
 break
 end
 set @i=@i+1
 end
 return @result
end
 
--task 6
create function dbo.fn_GetNumbersBetween(@start int, @end int)
returns @numbers table (number int)
as
begin
declare @i int = @start
while @i<=@end
begin 
insert into @numbers(number) values (@i)
set @i=@i+1
end
return
end

--task 7
create function dbo.getNthHighestSalary(@num int)
returns int
as 
begin
declare @result int
select
@result =salary
from
(select salary, DENSE_RANK() over (order by  salary desc) as rnk
from employee) as ranked
where rnk =@num
return @result
end


--task 8






--task 9
;with cte as
(
select customer_id, count(customer_id) as total_orders, sum(amount) as total_amount, max(order_date) as last_order_date from orders
group by customer_id
)
select cte.customer_id, customers.name,cte.total_orders, cte.total_amount,cte.last_order_date from cte
inner join  customers
on  customers.customer_id=cte.customer_id

--task 10
select 
g.RowNumber,
isnull(g.TestCase, prev.LastValue) as Workflow
FROM Gaps g
outer apply
(
select   top 1 TestCase as LastValue
from Gaps g2
where g2.RowNumber <= g.RowNumber
and g2.TestCase is not null
order by g2.RowNumber desc
) prev
order by  g.RowNumber
