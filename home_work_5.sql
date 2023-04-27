CREATE DATABASE home_work_5;
USE home_work_5;


DROP TABLE IF EXISTS Cars;
CREATE TABLE  Cars 
(       
	id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(10), 
	Cost INT NOT NULL
);
INSERT INTO Cars (Name, Cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 2900),
('Bentley', 35000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);
SELECT * FROM Cars;
/*
1
Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
*/
DROP VIEW IF EXISTS CopyCars;
CREATE VIEW CopyCars AS
SELECT * FROM Cars WHERE Cost < 25000;
SELECT * FROM CopyCars;

/*
2
Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
*/
ALTER VIEW CopyCars AS
SELECT * FROM Cars WHERE Cost < 30000;
SELECT * FROM CopyCars;

/*
3
Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/
DROP VIEW IF EXISTS Only_Skoda_Audi;
CREATE VIEW Only_Skoda_Audi AS
SELECT * FROM Cars WHERE Name IN ('Skoda', 'Audi');
SELECT * FROM Only_Skoda_Audi;






-- Есть таблица анализов Analysis:
DROP TABLE IF EXISTS Analysis;
CREATE TABLE  Analysis
(
	an_id INT AUTO_INCREMENT PRIMARY KEY, -- ID анализа
    an_name VARCHAR(20), -- название анализа
    an_cost INT NOT NULL, -- себестоимость анализа
    an_price INT NOT NULL, -- розничная цена анализа
    an_group INT NOT NULL -- группа анализов
);
INSERT INTO Analysis (an_name, an_cost, an_price, an_group)
VALUES
('Баралиоз', 1000, 2000, 5),
('Маралиоз', 500, 3000, 6),
('Фаралиоз', 100, 4000, 4);
SELECT * FROM Analysis;
-- Есть таблица групп анализов Groups:
DROP TABLE IF EXISTS Groups_s;
CREATE TABLE  Groups_s
(
	gr_id INT AUTO_INCREMENT PRIMARY KEY, --  ID группы
    gr_name VARCHAR(20), -- название группы
    gr_temp INT NOT NULL -- температурный режим хранения
);
INSERT INTO Groups_s (gr_name, gr_temp)
VALUES
('Первоцвет', 50),
('Нервоцвет', 10),
('Гервоцвет', 2);
SELECT * FROM Groups_s;
-- Есть таблица заказов Orders:
DROP TABLE IF EXISTS Orders;
CREATE TABLE  Orders
(
	ord_id INT AUTO_INCREMENT PRIMARY KEY, --  ID заказа
    ord_datetime DATE NOT NULL, -- дата и время заказа
    ord_an INT NOT NULL -- ID анализа
);
INSERT INTO Orders (ord_datetime, ord_an)
VALUES
('2020-02-4', 1),
('2020-02-10', 2),
('2021-12-10', 3);
SELECT * FROM Orders;
/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
*/
SELECT * FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_an 
WHERE Orders.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';





DROP TABLE IF EXISTS Train_timetable;
CREATE TABLE  Train_timetable 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT NOT NULL,
	staition VARCHAR(20), 
	staition_time TIME(0)
);
INSERT INTO Train_timetable (train_id, staition, staition_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');
SELECT * FROM Train_timetable;
/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар 
смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это 
сделать с помощью оконной функции LEAD . Эта функция сравнивает 
значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце 
«время» для станции со станцией сразу после нее.
*/
SELECT *,
LEAD(staition_time, 1, NULL) OVER (PARTITION BY train_id ORDER BY staition_time)
AS time_to_next_staition
FROM Train_timetable;

