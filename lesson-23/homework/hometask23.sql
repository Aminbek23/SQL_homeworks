--task 1
select*,
case when month(dt)<10 then CONCAT('0','',cast(MONTH(dt) as char))
else cast(MONTH(dt) as char) end  as d
from Dates

--task 2
;with cte as(
select id,rID, max(vals) as max_vals from MyTabel
group by id,rID)
select count(distinct id) as distinct_id, rID,  sum(max_vals) as sum_max_sales  from cte
group by rID

--task 3
select*from TestFixLengths
where LEN(Vals)  between  6 and  10

--task 4
;with cte as(
select*,max(vals) over(partition by id) max_vals from TestMaximum)
select id,item, vals from cte
where max_vals=Vals

--task 5
;with cte as(
select id, DetailedNumber, max(vals) max_vals from SumOfMax
group by id, DetailedNumber)
select id, sum(max_vals) vals_max_id from cte
group by id

--task 6
select*,
case when a-b=0 then ''
else cast(a-b as varchar(10)) end
from TheZeroPuzzle

--task 7  Barcha savdolardan olingan jami daromad qancha?
select sum(QuantitySold*UnitPrice) total_profit from Sales

--task 8  Mahsulotlarning o‘rtacha dona (birlik) narxi qancha?
select avg(UnitPrice)  avg_price from Sales

--task 9  Nechta savdo operatsiyasi (bitimi) qayd etilgan?
select count(SaleID) operation_amount from Sales

--task 10 Bitta savdoda sotilgan birliklar soni bo‘yicha eng katta miqdor qancha?
select max(QuantitySold) max_quantitysold from Sales

--task 11 Har bir toifada nechta mahsulot sotilgan?
select Category, sum(QuantitySold)  total_category from Sales
group by Category

--task 12 Har bir mintaqa (region) bo‘yicha jami daromad qancha?
select Region, sum(UnitPrice*QuantitySold) as sum_amount_region from Sales
group by Region
--task 13 Qaysi mahsulot eng ko‘p jami daromad keltirgan?
;with cte as(
select Product, sum(UnitPrice*QuantitySold) as sum_unit_price from Sales
group by Product)
select top 1  * from cte
order by sum_unit_price desc

--task 14 Savdo sanasiga qarab daromadning ketma-ket yig‘indisini (running total) hisoblang.
select*,sum(UnitPrice*QuantitySold)over(order by saledate) running_total from Sales

--task 15 Har bir mahsulot toifasi jami savdo daromadiga qancha hissa qo‘shganini aniqlang.
;WITH cte AS (
    SELECT 
        Category,
        SUM(UnitPrice * QuantitySold) AS sum_category
    FROM Sales
    GROUP BY Category
)
SELECT 
    c.Category,
    c.sum_category,
    t.total_sales,
    ROUND( (c.sum_category * 100.0 / t.total_sales), 2) AS percent_of_total
FROM cte AS c
CROSS JOIN (
    SELECT SUM(UnitPrice * QuantitySold) AS total_sales 
    FROM Sales
) AS t;

--task 16
--vazifalarda kursatilmagan

--task 17
select*from Customers c
inner join Sales s
on s.CustomerID=c.CustomerID

--task 18
select c.*from Customers c
left join Sales s
on s.CustomerID=c.CustomerID
where s.CustomerID is null

--task 19
select c.CustomerID,c.CustomerName, SUM(s.UnitPrice * s.QuantitySold) total_profit from Customers c
join Sales s
on s.CustomerID=c.CustomerID
group by c.CustomerID,c.CustomerName

--task 20 
select top 1  CustomerName, total_revenue from Customers c
join (select *, SUM(UnitPrice * QuantitySold) over(partition by customerid) total_revenue from Sales) s
on c.CustomerID=s.CustomerID
order by total_revenue desc

--task 21
select c.CustomerName, SUM(s.UnitPrice * s.QuantitySold) as total_revenue
from Customers c
join Sales s on c.CustomerID = s.CustomerID
group by c.CustomerName


 CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);

--task 22
select*from Products
where exists (select 1 from Sales where Products.ProductName=Sales.Product)

--task 23
select * from  Products
where SellingPrice = (select max(SellingPrice) from Products)

--task 24
;with cte as(
select*,AVG(sellingprice)over(partition by category) as avg_price_category from Products)
select*from cte
where SellingPrice>avg_price_category
