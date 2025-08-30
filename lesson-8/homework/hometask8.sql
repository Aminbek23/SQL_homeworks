--task 1 Products jadvalidan har bir kategoriya bo‘yicha mavjud mahsulotlar umumiy sonini toping.
select Category , sum (StockQuantity) as Total from Products
group by Category

--task 2 
select category , avg(price)  as avg_price  from Products
where   Category ='Electronics'
group by Category

--task 3  
select *from Customers
where city like 'L%'

--task 4 
select*From Products
where ProductName like '%er'

--task 5 
select*from Customers
where Country like '%A'

--task 6 
select top 1*from Products
order by price desc

--taksk 7 
select*,
 case when  stockquantity< 30 then 'LowStock' 
  else 'Sufficient' end as StockStatus
from Products

--task 8 
select country, count(CustomerID) as total from  customers
group by Country

--task 9  
select min(TotalAmount) as Min_totalAmount,  max(TotalAmount) as Max_totalAmount from Orders

--task 10
select distinct o.CustomerID
from Orders o
where o.OrderDate >= '2023-01-01'
and o.OrderDate < '2023-02-01'
and not exists (select 1 from Invoices i
where i.CustomerID = o.CustomerID
and i.InvoiceDate >= '2023-01-01'
and i.InvoiceDate < '2023-02-01'
)

--task 11 
 select ProductName from Products 
 union all
 select ProductName from Products_Discounted 

--task 12 
 select ProductName from Products 
 union  
 select ProductName from Products_Discounted 

--task 13 
select year(orderdate) as years , avg(totalamount) as avg_total from Orders
group by year(orderdate)

--task 14 
select productname ,
case when price < 100 then 'Low' 
     when price between 100 and 500 then 'Mid'
	 when price > 500 then 'High' end as Pricegroup
	 from Products

--task 15 
select district_name, [2012], [2013]
from (
    select district_name, year, population
    from City_Population
) as SourceTable
PIVOT (
    sum(population) from year in ([2012], [2013])
) as PivotTable;

--task 16 
select ProductID ,sum(SaleAmount) as total from sales
group by ProductID
 
--task 17
 select ProductName from Products
 where ProductName like '%oo%'
 
--task 18 
select year , [Bektemir], [Chilonzor],[Yakkasaroy]
from (
    select district_name, year, population
    from City_Population
) as SourceTable
PIVOT (
    sum(population) for district_name in ([Bektemir], [Chilonzor],[Yakkasaroy])
) as PivotTable;

--task 19
select  top 3 CustomerID , sum(TotalAmount) as TotalSpent from Invoices
group by customerID
order by TotalSpent desc

--task 20 
select district_name, year, population
from Population_Each_Year
unpivot (
    population for year IN ([2012],  [2013])
) as Unpvt

--task 21 
select p.ProductName, count(s.SaleID) aS TotalSales
from Products p
join Sales s 
    on p.ProductID = s.ProductID
group by p.ProductName
order by TotalSales desc

--task 22 
select district_name, year, population
from dbo.Population_Each_City
unpivot (
    population for district_name IN ([Bektemir], [Chilonzor],[Yakkasaroy])
) as Unpvt
