--Task 1.  Data - bu har qanday malumotlar va axborot buladi data deyiladi. Database bu tartiblangan malumotlar  bazasi .  Relational database esa database turi hisoblanadi unda malumotlar jadval kuirnishida saqlanadi. Table bu jadval  databasedagi asosiy tuzilsa  u satrlar va ustunlardan iborat buladi

--Task 2. Malumotlar ishonchli saqlash va boshqarish va katta hajmdagi malumotlarni xavfsiz saqlash tezkor qidirish va uzgartirish imkonini beradi.   Malumotlar yo'qolsa yo buzilsa tiklash qobilyatiga ega.  Foydalanuvchi autenfitikatsiya shifrlsh orqali malumotlarni himoya qiladi . Relational database  qo‘llab-quvvatlashi bu ma’lumotlar jadvallar ko‘rinishida saqlanadi va ular o‘zaro  kalitlar bn bog‘lanadi.  Har xil ma’lumot turlari bilan ishlasa ham buladi , oddiy matn va sonlardan tashqari JSON, XML, grafik ma’lumotlar, hatto geo-ma’lumotlarbilan ham ishlay oladi.

--Task 3.Windows Authentication
--SQL Server foydalanuvchini Windows tizimidagi login va paroli orqali tekshiradi. Foydalanuvchi alohida SQL Server paroli kiritmaydi — tizim avtomatik aniqlaydi.
 --SQL Server Authentication
 --Foydalanuvchi SQL Server’ga maxsus login va parol bilan ulanadi. Windows tizimidan mustaqil ishlaydi.
--Mixed Mode Authentication
--Bu Windows Authentication va SQL Server Authentication ni birgalikda ishlatish rejimi. Administrator Windows foydalanuvchilari va SQL loginlarini bir vaqtda ishlata oladi

--Task 4
CREATE DATABASE  SchoolDB
    
--Task 5
CREATE DATABASE  SchoolDB
    use  SchoolDB
      create table  Students(
        StudentID  int primary key ,
      name varchar (50), 
      age int
   );

--Task 6. SQL server  bu  malumotlarni saqlash boshqarish qidirish va qayta ishlash.  Katta omborxonaga uxshaydi  ichida barcha ma’lumotlar tartib bilan joylashtirilishi shunga uxshaydi
--SSMS   bu SQL serverdagi malumotlar bazasini qulay boshqarish jadval yaratish  so’rovlar yozish va boshqa amallani qilish. Bu omborxonani boshqarish uchun kompyuterdagi maxsus dasturiy panelga uxshaydi 
--SQL bu malumotlar bazasi bilan ishlash uchun buyruqlar tili. Select , create, uptade ,delete degandek . Bu esa xuddi xodimga buyruq berish uchun ishlatiladi

--Task 7.
--DQL – bazadan malumotlar olish  tili deyiladi  select , where, from  keywordlardan foydalanishladi
--Examples
Select last_name , first_name , age
From students
Where age>18
--DML  - ma’lumotlarni boshqarish tili deyiladi  update ,insert, delete keywordlaridan foydalaniladi  
--examples
INSERT INTO Students (FirstName, LastName, Age)
VALUES ('Karl', 'Mark', 20);
UPDATE Students
SET Age = 20
WHERE StudentID = 3;
DELETE FROM Students
WHERE Age < 24;
--DDL - ma’lumotlarni strukturasini bekgilash tili deyiladi  create , alter, drop, truncate keywordlardan foydalanishladi
--examples 
Create table students(
Id int primary key,
Name varchar (30),
Age int
);
--DCL – ma’lumotlarni boshqarish tili  foydalanuvchiga huquq beradi va oladi grant va revoke keywordlaridan foydalaniladi. 
--examples
Grant select on students to user1;
Revoke select on students from user1;
--TCL –Tranzaksiyalarni boshqarish tili  commit ,rollback ,savepoint  keywordlardan foydalanishladi
--examples
Begin transaction;
Update students set age = age +1;
Commit;

    
--Task 8.
INSERT INTO Students (Name, Age, Major) 
VALUES ('Mark', 20, 'History'),
('Karl', 21, 'Mathematics'),
('Tony', 22, 'Physics');

--Task 9. 
/*Telegramdan  AdventureWorks2020.bak   ustiga sichqonchani ung tugmasini bosamiz keyin bizdan qayerga saqlashimizni suraydi   C diskga kiramiz  papkalar ichidan promram filesga kiramiz  va u yerdan Microsoft SQL Serverga kiramiz  keyin   MSSQL16.MSSQLSERVER papkasiga kiramiz keyin MSSQLGA  kiramiz va u yerdan Backupga kirganimizda  ekranda kichik bildirishnoma chiqadi  “You don’t currently have permission to acces this folder”  kurinishida va otida continue va cancel  tugmasi turadi continueni bosamiz  va undan kn pasda ung tarafda save tugmasini bosamiz va faylimiz saqlanadi backup papkamizga. SQL Servar Management studioga utamiz   chap tarafda database dgan yozuv ustiga sichqonchani oborib ung tugmasini bosamiz  va bosganimizdan kn ung yana bir menyu chiqadi u yerdan restore database sichqoncani oborib chap tarafini bossak menyu ochiladi.  Sourse qismidan deviceni tanlaymiz kn … ni utiga bosammiz keyin add ni bosamiz va telegramdan saqlagan fayilimizni ustiga bosib  ok tugmasini bosamiz va undan keyin  pastda turgan ok tugmasini bosamiz jarayon muvaffaqiyatli yakunlansa   database AdventureWorks2022 restored successfully deb chiqadi. */
