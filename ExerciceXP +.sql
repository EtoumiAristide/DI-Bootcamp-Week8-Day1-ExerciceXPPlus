/*========= CREATE ===========*/
-- 1) Create a database called bootcamp.
CREATE DATABASE bootcamp
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
    
-- 2) Create a table called students.
/*
	3) Add the following columns:
		id
		last_name
		first_name
		birth_date
		The id must be auto_incremented.
		Make sure to choose the correct data type for each column.
		To help, here is the data that you will have to insert. (How do we insert a date to a table?)
*/
CREATE TABLE students(
	id SERIAL PRIMARY KEY,
	last_name VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	birth_date DATE NOT NULL
)

/*====== INSERT ========*/
-- 1)Insert the data seen above to the students table. Find the most efficient way to insert the data.
INSERT INTO students(first_name, last_name, birth_date)
VALUES ('Marc', 'Benichou', '02/11/1998'),
		 ('Yoan', 'Cohen', '03/12/2010'),
		 ('Lea', 'Benichou', '27/07/1987'),
		 ('Amelia', 'Dux', '07/04/1996'),
		 ('David', 'Grez', '14/06/2003'),
		 ('Omer', 'Simpson', '03/10/1980')
		 
-- 2)Insert your last_name, first_name and birth_date to the students table (Take a look at the id given)
INSERT INTO students(first_name, last_name, birth_date)
VALUES ('Aristide', 'ETOUMI', '06/10/1998');

/*========== SELECT =============*/

-- 1) Fetch all of the data from the table.
SELECT * FROM students

-- 2) Fetch all of the students first_names and last_names.
SELECT students.first_name, students.last_name
FROM students

-- 3)For the following questions, only fetch the first_names and last_names of the students.
	-- 1) Fetch the student which id is equal to 2. 
SELECT students.first_name, students.last_name
FROM students
WHERE students.id = 2
	
	-- 2) Fetch the student whose last_name is Benichou AND first_name is Marc.
SELECT students.first_name, students.last_name
FROM students
WHERE students.first_name = 'Marc' AND students.last_name = 'Benichou'

	-- 3) Fetch the students whose last_names are Benichou OR first_names are Marc.
SELECT students.first_name, students.last_name
FROM students
WHERE students.first_name = 'Marc' OR students.last_name = 'Benichou'

	-- 4) Fetch the students whose first_names contain the letter a.
SELECT students.first_name, students.last_name
FROM students
WHERE students.first_name ILIKE '%a%'

	-- 5) Fetch the students whose first_names start with the letter a.
SELECT students.first_name, students.last_name
FROM students
WHERE students.first_name ILIKE 'a%'

	-- 6) Fetch the students whose first_names end with the letter a.
SELECT students.first_name, students.last_name
FROM students
WHERE students.first_name ILIKE '%a'

	-- 7) Fetch the students whose second to last letter of their first_names are a
SELECT students.first_name, students.last_name
FROM students
WHERE SUBSTRING(students.first_name, LENGTH(students.first_name)-1, 1) ILIKE 'a'

	-- 8) Fetch the students whose id’s are equal to 1 AND 3 .
SELECT students.first_name, students.last_name
FROM students
WHERE students.id = 1 OR students.id = 3

-- 4)Fetch the students whose birth_dates are equal to or come after 1/01/2000. (show all their info).
SELECT students.first_name, students.last_name
FROM students
WHERE students.birth_date >= '1/01/2000'
	