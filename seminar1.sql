-- comment
# comment
/*
comment
*/
USE seminar1;


SELECT * FROM student;

SELECT name FROM student;


SELECT * FROM student
WHERE name = 'Hgj';


SELECT name, phone_number FROM student;


-- % любая подстрока (сколько угодно символов либо ничего)   Galaxy S5, Galaxy S8s, Galaxy S10, Galaxy A10
-- LIKE 'Galaxy S%'  -> Galaxy S5, Galaxy S8, Galaxy S10
--  _  одиноячный смволalter
-- LIKE 'Galaxy S_'  -> Galaxy S5
SELECT * FROM student
WHERE name LIKE 'H%';

SELECT * FROM student
WHERE name LIKE '%g';

SELECT * FROM student
WHERE name LIKE '%H%';

SELECT * FROM student
WHERE name LIKE 'H%' OR name LIKE '_I_';
