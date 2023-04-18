USE lesson_3;


CREATE TABLE Products
(
	Id INT primary key auto_increment,
	ProductName varchar(30) not null,
    Manufacturer varchar(20) not null,
    ProductCount int default 0,
    Price decimal
);

insert into Products (ProductName, Manufacturer, ProductCount, Price)
values
('iPhone X', 'Aple', 3, 76000),
('iPhone 8', 'Aple', 2, 51000),   
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

select * from Products
order by Price;  -- сортируем цену по возрастанию

select * from Products
order by Price desc;  -- сортируем цену по убыванию

select count(*) from Products;   -- возвращает кол-во строк

select * from Products
limit 5;  -- возвращает перые 5 строк

select * from Products
limit 1,2;  -- пропускает первую строчку, возвращает следующие 2 строки

select sum(Price) from Products; -- возвращает сумму столбца Price

select min(Price) from Products
where Manufacturer = 'Aple';


select min(Price), max(Price), avg(Price) from Products
where Manufacturer = 'Aple';

