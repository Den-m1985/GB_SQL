USE new_schema1;

-- CREATE TABLE  создаем таблицу
/*
CREATE TABLE Customer
(
	Id INT primary key auto_increment,
    Age int,
    FirstName varchar(20),
    LastName varchar(20)
);

select * from Customer;

select 3+5;
select 3-5;
*/


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

select * from Products;

-- update Products
-- set Price = Price + 3000;

select * from Products
where Manufacturer in ('Aple', 'Samsung');


select * from Products
where not Manufacturer in ('Aple', 'Samsung');