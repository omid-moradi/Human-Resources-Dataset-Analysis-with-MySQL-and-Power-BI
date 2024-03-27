CREATE DATABASE IF NOT EXISTS humanresources;

ALTER TABLE `human_resources`
	CHANGE COLUMN ï»¿id employee_id VARCHAR(15) NOT NULL;

UPDATE `human_resources`
	SET birthdate = 
		CASE
			WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
			WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
		ELSE NULL
	END;

ALTER TABLE `human_resources`
MODIFY COLUMN birthdate DATE;

UPDATE `human_resources`
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE `human_resources`
MODIFY COLUMN hire_date DATE;

UPDATE `human_resources`
SET termdate = NULL
WHERE termdate = '';

UPDATE `human_resources`
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

ALTER TABLE `human_resources`
MODIFY COLUMN termdate DATE;

ALTER TABLE `human_resources`
	ADD COLUMN age INT;

UPDATE `human_resources`
SET age = timestampdiff(YEAR, birthdate, curdate());

DELETE FROM human_resources
	WHERE age < 18;
