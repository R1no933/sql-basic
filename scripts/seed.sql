INSERT INTO instructors (name, certification, specialization, schedule)
VALUES ('Ivan Ivanov', 'advanced', 'kids', 'mn-fr 9:00 - 18-30'),
       ('Anna Petrova', 'expert', 'adult', 'th-sat 9:00 - 21-00'),
       ('Michail Orlov', 'professional', 'adult', 'fr-sun 8:00 - 22-00'),
       ('Dmitriy Bobrov', 'expert', 'jun/kids', 'all week 12:00 - 20-00'),
       ('Ekaterina Melnikova', 'professional', 'kids', 'mn-fr 9:00 - 19-00'),
       ('Olga Vasnetsova', 'expert', 'adult', 'mn-sun 10:30 - 21:30'),
       ('Igor Kisevel', 'advanced', 'junior', 'mn-fr 15:00 - 21-30');

INSERT INTO students (name, level, preferences, medical_info)
VALUES ('Ignat Petrov', 'beginner', 'individual', 'not restrictions'),
       ('Svetlana Sergeeva', 'advanced', 'group', 'knee injury on 2022/2023 season'),
       ('Semen Semenov', 'beginner', 'individual/group', 'asthma, do not give heavy loads'),
       ('Petr Pervarov', 'intermediate', 'individual', 'no restrictions'),
       ('Bogdan Borovoy', 'advanced', 'group', 'poor eyesight, wear glasses'),
       ('Irina Shekhove', 'beginner', 'individual/group', 'no restrictions'),
       ('Alexey Kondratiyev', 'intermediate', 'individual', 'no restrictions'),
       ('Gelya Azunova', 'beginner', 'group', 'no restrictions');

INSERT INTO slopes (name, difficult)
VALUES ('Green Hill', 'Green'),
       ('Blue Wind', 'Blue'),
       ('Red Challenge', 'Red'),
       ('Black Rock', 'Black'),
       ('Slalom championship slope', 'Black');

INSERT INTO lessons (instructor_id, student_id, slope_id, lesson_type, datetime, price)
VALUES (1, 1, 1, 'individual', '2025-01-15', 2500),
       (2, 2, 2, 'group', '2025-01-16' , 3500),
       (3, 4, 5, 'individual', '2025-01-17', 5500),
       (2, 6, 2, 'group', '2025-01-16', 3500),
       (4, 8, 5, 'individual', '2025-01-18', 5500),
       (7, 3, 4, 'group', '2025-01-21', 2500),
       (5, 7, 3, 'individual', '2025-01-23', 4500),
       (6, 5, 2, 'individual', '2025-01-23', 6000),
       (4, 8, 4, 'individual', '2025-01-24', 5500),
       (7, 1, 1, 'group', '2025-01-27', 3500);

INSERT INTO progress (student_id, lesson_id, skills_learned, instructor_notes, next_goal)
VALUES (1, 1, 'carving', 'nice technic', 'work on carving fast turns'),
       (2, 2, 'base trick in park', 'bs50-50 + bs done', 'ns + ts'),
       (4, 3, 'speed control', 'stoped afraid of speed', 'work on balance'),
       (6, 4, 'parallel turns', 'make good parallel turns but not enough', 'steel work on parallel turns'),
       (8, 5, 'free ride', 'nice technic and good balance', 'work on base trick on free ride'),
       (3, 6, 'turns on steep slopes', 'not good turns on steep slopes', 'steel work'),
       (7, 7, 'free ride and base tricks on free ride', 'make base tricks on free ride', 'work on advanced tricks'),
       (5, 8, 'base carving and base on steep slopes', 'good carving! skill up', 'steel work on speed'),
       (8, 9, 'balance control', 'stoped afraid snowboarding)', 'strat to base elements for carving'),
       (1, 10, 'speed and balance control on carving', 'good speed and balance', 'work on turns on steep slopes');

INSERT INTO lesson_slopes (lesson_id, slope_id)
VALUES (1, 1),
       (2, 2),
       (3, 5),
       (4, 2),
       (5, 5),
       (6, 4),
       (7, 3),
       (8, 2),
       (9, 4),
       (10, 1);

-- UPDATE --
UPDATE lessons
SET price = 4500
WHERE instructor_id = 1;

-- DELETE --
INSERT INTO slopes (name, difficult)
VALUES ('Slope for delete', 'awesome');

DELETE FROM slopes
WHERE name = 'Slope for delete';

-- INCORRECT DELETE --
/*
Невозможно удаление, так как в таблице lessons
есть FK на таблицу progress
*/
DELETE FROM lessons
WHERE instructor_id = 4;

-- ALTER TABLE --
ALTER TABLE lessons
ADD COLUMN description TEXT;