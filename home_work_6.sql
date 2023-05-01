CREATE DATABASE home_work_6;
USE home_work_6;

/*
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER //
CREATE FUNCTION time_example(n INT)
RETURNS VARCHAR(255)
BEGIN
DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds_remaining INT;
    DECLARE formatted_time VARCHAR(255);
    
    SET days = FLOOR(n / 86400);
    SET seconds_remaining = n MOD 86400;  -- MOD выражает операцию получения остатка при делении
    SET hours = FLOOR(seconds_remaining / 3600);
    SET seconds_remaining = seconds_remaining MOD 3600;
    SET minutes = FLOOR(seconds_remaining / 60);
    SET seconds_remaining = seconds_remaining MOD 60;
    
    SET formatted_time = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds_remaining, ' seconds ');
    
    RETURN formatted_time;
END //
DELIMITER ;

SELECT time_example(123456);




/*
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
DROP  PROCEDURE digits;

DELIMITER //
CREATE PROCEDURE digits()
BEGIN

DECLARE x INT DEFAULT 0;
DECLARE res VARCHAR(50) DEFAULT '';
WHILE x < 10 DO
SET x = x + 2;
SET res = CONCAT(res, ' ', x);
END WHILE;
SELECT res;

END //
DELIMITER ;

CALL digits();

