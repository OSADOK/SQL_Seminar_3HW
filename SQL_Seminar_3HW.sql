CREATE SCHEMA seminar_3_homework;
USE seminar_3_homework;

CREATE TABLE customers 
(
cnum INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
cname VARCHAR(45) NOT NULL,
city VARCHAR(45) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL
);
INSERT INTO customers 
(cnum ,  cname , city  ,rating, snum) VALUES 
(2001,'Hoffman','London',100,1001),
(2002,'Giovanni','Rome',200,1003),
(2003,'Liu','SanJose',200,1002),
(2004,'Grass','Berlin',300,1002),
(2006,'Clemens','London',100,1001),
(2008,' Cisneros','SanJose',300,1007),
(2007,'Pereira','Rome',100,1004);

CREATE TABLE salespeople (
snum INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
sname VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
comm TEXT NOT NULL
); 
INSERT INTO `seminar_3_homework`.`salespeople`
(snum , sname , city  ,comm) VALUES 
(1001,'Peel','London','.12'),
(1002,'Serres','San Jose','.13'),
(1004,'Motika','London','.11'),
(1007,'Rifkin','Barcelona','.15'),
(1003,'Axelro','New York','.10');

CREATE TABLE orders ( 
onum INT NOT NULL,
amt DOUBLE NOT NULL,
odate VARCHAR(100) NOT NULL, -- дата записывается иначе YYYY-MM-DD, но даже записав по правилам типа DATE выдает 
-- Error Code: 1292. Incorrect date value: '1977' for column 'odate' at row 1	0.000 sec. поэтому использовал VARCHAR
cnum INT NOT NULL,
snum INT NOT NULL);
INSERT INTO `seminar_3_homework`.`orders` VALUES
(3001,18.69,'10-03-1990',2008,1007),
(3003,767.19,'10-03-1990',2001,1001),
(3002,1900.10,'10-03-1990',2007,1004),
(3005,5160.45,'10-03-1990',2003,1002),
(3006,1098.16,'10-03-1990',2008,1007),
(3009,1713.23,'10-04-1990',2002,1003),
(3007,75.75,'10-04-1990',2004,1002),
(3008,4723.00,'10-05-1990',2006,1001),
(3010,1309.95,'10-06-1990',2004,1002),
(3011,9891.88,'10-06-1990',2006,1001);

CREATE TABLE part_2 
( id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(100) NOT NULL,
surname VARCHAR(100) NOT NULL,
specialty VARCHAR(100) NOT NULL,
srnorty INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL);
INSERT INTO part_2  (id, name, surname, specialty, srnorty, salary, age) 
VALUES (1, 'Вася', 'Васькин',  'начальник', 40, 100000, 60),
(2, 'Петя', 'Петькин',  'начальник', 8, 70000, 30),
(3, 'Катя', 'Катькин',  'инженер', 2, 70000, 25),
(4, 'Саша', 'Сашкин',  'инженер', 12, 50000, 35),
(5, 'Иван', 'Иванов',  'рабочий', 40, 30000, 59),
(6, 'Сидор', 'Сидоров',  'рабочий', 20, 25000, 40),
(7, 'Антон', 'Антонов',  'рабочий', 10, 20000, 35),
(8, 'Юра', 'Юркин',  'рабочий', 8, 19000, 28),
(9, 'Максим', 'Воронин',  'рабочий', 5, 15000, 25),
(10, 'Юра', 'Галкин',  'рабочий', 2, 11000, 22),
(11, 'Люся', 'Галкиин',  'рабочий', 3, 12000, 24),
(12, 'Вася', 'Люськин',  'рабочий', 10, 10000, 49);

-- 1.Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
-- city, sname, snum, comm. (к первой или второй таблице, используя SELECT):
SELECT city, cname, snum FROM customers;
-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), 
-- сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”):
SELECT rating, cname FROM customers WHERE city = 'SanJose';
-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов
-- без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”):
SELECT DISTINCT snum FROM salespeople;
-- 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
-- Используется оператор "LIKE": (“заказчики”):
SELECT cnum ,  cname , city  ,rating, snum FROM customers WHERE cname LIKE  'G%';
-- 5. Напишите запрос, который может дать вам все заказы
-- со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма):
SELECT * FROM orders WHERE amt >= 1000;
-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT min(amt) FROM orders;
-- 7. Напишите запрос к таблице “Заказчики”,
-- который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers WHERE city = 'Rome' ORDER BY rating >=100;

-- Часть2 

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT salary FROM part_2 ORDER BY salary;
SELECT salary FROM part_2 ORDER BY  salary DESC;
-- 2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк 
-- с наибольшей заработной платой (возможен подзапрос)
SELECT salary FROM part_2 ORDER BY  salary DESC LIMIT 5;
-- 3. Выполните группировку всех сотрудников по специальности , 
-- суммарная зарплата которых превышает 100000
SELECT specialty, sum(salary) FROM part_2 GROUP BY specialty, salary > 100000; 