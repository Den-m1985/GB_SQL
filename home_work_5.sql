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


/*
2
Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
*/

/*
3
Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/







-- Есть таблица анализов Analysis:
DROP TABLE IF EXISTS Analysis;
CREATE TABLE  Analysis
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	an_id INT NOT NULL, -- ID анализа
    an_name VARCHAR(20), -- название анализа
    an_cost INT NOT NULL, -- себестоимость анализа
    an_price INT NOT NULL, -- розничная цена анализа
    an_group VARCHAR(20) -- группа анализов
);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES
(10, 'Баралиоз', 1000, 2000, 'V'),
(20, 'Маралиоз', 500, 3000, 'VI'),
(30, 'Фаралиоз', 100, 4000, 'IV');
SELECT * FROM Analysis;
-- Есть таблица групп анализов Groups:
DROP TABLE IF EXISTS Groups_s;
CREATE TABLE  Groups_s
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	gr_id INT NOT NULL, --  ID группы
    gr_name VARCHAR(20), -- название группы
    gr_temp INT NOT NULL -- температурный режим хранения
);
INSERT INTO Groups_s (gr_id, gr_name, gr_temp)
VALUES
(5, 'Первоцвет', 50),
(15, 'Нервоцвет', 10),
(25, 'Гервоцвет', 2);
SELECT * FROM Groups_s;
-- Есть таблица заказов Orders:
DROP TABLE IF EXISTS Orders;
CREATE TABLE  Orders
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	ord_id INT NOT NULL, --  ID заказа
    ord_datetime DATE NOT NULL, -- дата и время заказа
    ord_an INT NOT NULL -- ID анализа
);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
(1, '1990-03-10', 50),
(2, '1990-05-10', 40),
(3, '1990-12-10', 30);
SELECT * FROM Orders;
/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
*/





DROP TABLE IF EXISTS Train_timetable;
CREATE TABLE  Train_timetable 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT NOT NULL,
	staition VARCHAR(20), 
	staition_time TIME(0),
    time_to_next_station TIME(0)
);
INSERT INTO Train_timetable (train_id, staition, staition_time, time_to_next_station)
VALUES
(110, 'San Francisco', '10:00:00', '00:54:00'),
(110, 'Redwood City', '10:54:00', '00:08:00'),
(110, 'Palo Alto', '11:02:00', '01:33:00'),
(110, 'San Jose', '12:35:00', ''),
(120, 'San Francisco', '11:00:00', '01:49:00'),
(120, 'Palo Alto', '12:49:00', '01:49:00'),
(120, 'San Jose', '13:30:00', '');
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
