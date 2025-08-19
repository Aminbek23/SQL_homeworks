--task 1
SQL Server’da BULK INSERT ko‘p miqdordagi ma’lumotlarni (odatda .csv, .txt) fayldan jadvalga tez yuklash uchun ishlatiladi.

--task 2
SQL Server’da odatda CSV, TXT, XML, JSON fayllari import qilinadi.

--task 3
CREATE TABLE products
  ( ProductID INT PRIMARY KEY , ProductName varchar(50), Price decimal(10,2))
 
 --task 4
 INSERT INTO products VALUES 
  (1, 'iPhone 14', 899.99),
  (2, 'Smartwatch', 300),
  (3, 'Airpods3', 250);

--task 5
NULL da qiymat malumot yuq yoki aniqlanmagan buladi qiymat kiritish majburiy emas.
NOT NULL da qiymat kiritish majburiy buladi kiritilmasa xatolik beradi.

--task 6
ALTER TABLE products
ADD CONSTRAINT UQ_Product_Name UNIQUE (ProductName);
                                                                                        
--task 7
SELECT * FROM products  -- bu surov products jadvalidan barcha malumotlarni oladi

--task 8
 ALTER TABLE products
 ADD  CategoryID INT;

 --task 9
 CREATE TABLE Categories( CategoryID INT PRIMARY KEY, CategoryName varchar(50) UNIQUE)

 --task 10
IDENTITY ustunining asosiy maqsadi har safar jadvalga yangi yozuv qo‘shilganda,
IDENTITY ustuni o‘zi avtomatik ravishda yangi qiymat hosil qiladi.

--task 11
BULK INSERT Products
FROM 'C:\Users\Public\table.txt'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR  = ',',
ROWTERMINATOR = '\n'
)
--task 12
 ALTER TABLE products
 ADD CONSTRAINT  FK_Products_Categories
 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);                 

 --task 13
PRIMARY KEY jadvaldagi asosiy identifikator, NULL bulishi mumkin emas va faqat bitta bo‘ladi.
UNIQUE KEY faqat qiymatlarning takrorlanmasligini taminlaydi, 
NULL qiymat bulishi mumkin va bir nechta UNIQUE ustun bulishi mumkin. 

--task 14
ALTER TABLE Products
ADD CONSTRAINT  price check (price>0);

--task 15
ALTER TABLE products
ADD stock INT NOT NULL DEFAULT 0 ;

--task 16
select
ProductID,
ProductName,
ISNULL (Price, 0) As Prices
From Products;

--task 17
FOREIGN KEY orqali jadvaldagi malumotlarning bogliqligi va yaxlitligi taminlanadi
Malumotlar yaxlitligini taminlash, boglanishni taminlash, xatoliklarning oldini olish.

--task 18 
 CREATE TABLE customers ( customerID int primary key , customer_name varchar (50), age int) 
  ALTER TABLE customers
  ADD CONSTRAINT age check(age>18)

 --task 19
  CREATE TABLE Students(StudentID INT IDENTITY (100,10) PRIMARY KEY, Fullname varchar(50));

--task 20
CREATE TABLE OrderDetails( 
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL (10,2) NOT NULL,
PRIMARY KEY (OrderID, ProductID)
);

--task 21
ISNULL birinchi argument NUll bulsa ikkinchi argumentni qaytaradi.
COALESCE berilgan qiymatlar ichidan birinchi NULL bulmaganini qaytaradi.

--task 22
CREATE TABLE  Employes(
EmpID INT PRIMARY KEY,
Email VARCHAR (50) UNIQUE 
);

--task 23
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Customers
FOREIGN KEY (OrderID)
REFERENCES Customers(CustomerID)
ON DELETE CASCADE
ON UPDATE CASCADE;
