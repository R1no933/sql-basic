-- SELECT c WHERE (цена от 3000 до 5000)--
SELECT lesson_id, price, instructor_id, lesson_type
FROM lessons
WHERE price > 3000 AND price < 5000;

-- ORDER BY (по сертификации и по имени все ро убыванию)--
SELECT instructor_id, name, certification, specialization
FROM instructors
ORDER BY certification asc, name asc;

-- GROUP BY (кол-во учеников по уровням)--
SELECT level,
    COUNT(*) AS level_count
FROM students
GROUP BY level;

-- HAVING (показать максимальную цену типа урока group) --
SELECT lesson_type,
       MAX(price)
FROM lessons
GROUP BY lesson_type
HAVING lesson_type = 'group';

-- JOINы --
-- INNER JOIN (объединение таблиц instructors и lessons по instructor_id из обеих таблиц)--
SELECT i.instructor_id,
       i.name,
       l.lesson_type,
       l.price
FROM instructors AS i
JOIN lessons AS l ON i.instructor_id = l.instructor_id;

-- LEFT JOIN (левое объединение таблиц progress и students по student_id)--
SELECT p.skills_learned,
       s.name,
       s.level
FROM progress AS p
LEFT JOIN students AS s ON p.student_id = s.student_id;

-- FULL OUTER JOIN (фулл объединение 3 таблиц через вспомогательную таблицу с названием трасс, сложностью, датой тренировки, цены и типом)--
SELECT ls.lesson_id,
       ls.slope_id,
       s.name,
       s.difficult,
       l.datetime,
       l.price,
       l.lesson_type
FROM lesson_slopes AS ls
FULL JOIN slopes AS s ON s.slope_id = ls.slope_id
FULL JOIN lessons AS l ON ls.lesson_id = l.lesson_id;


