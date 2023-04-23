use lesson4;

DROP TABLE IF EXISTS Products;
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
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),   
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
select * from Products;



-- создаем виртуальную копию нашей таблицы.
DROP VIEW IF EXISTS CopyProduct;
CREATE VIEW CopyProduct AS
SELECT Price, ProductCount, Manufacturer
FROM Products
WHERE Manufacturer = 'Apple';
SELECT * FROM CopyProduct;

ALTER VIEW CopyProduct AS
SELECT Price, ProductCount, Manufacturer, ProductName
FROM Products
WHERE Manufacturer = 'Apple';
SELECT * FROM CopyProduct;

