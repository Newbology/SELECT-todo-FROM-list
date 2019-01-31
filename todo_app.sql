DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app; 
\connect todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks DROP COLUMN completed,
ADD COLUMN completed_at timestamp DEFAULT NULL, 
ALTER COLUMN updated_at SET NOT NULL, 
ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks
(title, description)
VALUES 
('Study SQL', 'Complete this exercise'),
('Study postgresSQL', 'Read all the documentation');

SELECT title FROM tasks 
WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description FROM tasks
WHERE completed_at IS NULL;

SELECT *  FROM tasks 
ORDER BY created_at DESC;

INSERT INTO tasks 
(title, description)
VALUES 
('mistake 1', 'a test entry'),
('mistake 2', 'another test entry'),
('third mistake', 'another test entry');

SELECT title FROM tasks
WHERE title ~ 'mistake';

DELETE FROM tasks 
WHERE title = 'mistake 1';

SELECT title,description FROM tasks
WHERE title ~ 'mistake';

DELETE FROM tasks 
WHERE title ~ 'mistake';

SELECT * FROM tasks
ORDER BY title ASC;
