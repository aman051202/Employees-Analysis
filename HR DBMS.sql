CREATE DATABASE HR_Management;
GO
USE HR_Management;

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(25) DEFAULT NULL
);

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(40) DEFAULT NULL,
    postal_code VARCHAR(12) DEFAULT NULL,
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25) DEFAULT NULL,
    country_id CHAR(2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8,2) DEFAULT NULL,
    max_salary DECIMAL(8,2) DEFAULT NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT DEFAULT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20) DEFAULT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL(8,2) NOT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO regions (region_id, region_name)
VALUES 
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa');

INSERT INTO countries (country_id, country_name, region_id)
VALUES 
('AR', 'Argentina', 2),
('AU', 'Australia', 3),
('BE', 'Belgium', 1),
('BR', 'Brazil', 2),
('CA', 'Canada', 2),
('CH', 'Switzerland', 1),
('CN', 'China', 3),
('DE', 'Germany', 1),
('DK', 'Denmark', 1),
('EG', 'Egypt', 4),
('FR', 'France', 1),
('HK', 'HongKong', 3),
('IL', 'Israel', 4),
('IN', 'India', 3),
('IT', 'Italy', 1),
('JP', 'Japan', 3),
('KW', 'Kuwait', 4),
('MX', 'Mexico', 2),
('NG', 'Nigeria', 4),
('NL', 'Netherlands', 1),
('SG', 'Singapore', 3),
('UK', 'United Kingdom', 1),
('US', 'United States of America', 2),
('ZM', 'Zambia', 4),
('ZW', 'Zimbabwe', 4);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES 
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
(2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'),
(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES 
(1, 'Public Accountant', 4200.00, 9000.00),
(2, 'Accounting Manager', 8200.00, 16000.00),
(3, 'Administration Assistant', 3000.00, 6000.00),
(4, 'President', 20000.00, 40000.00),
(5, 'Administration Vice President', 15000.00, 30000.00),
(6, 'Accountant', 4200.00, 9000.00),
(7, 'Finance Manager', 8200.00, 16000.00),
(8, 'Human Resources Representative', 4000.00, 9000.00),
(9, 'Programmer', 4000.00, 10000.00),
(10, 'Marketing Manager', 9000.00, 15000.00),
(11, 'Marketing Representative', 4000.00, 9000.00),
(12, 'Public Relations Representative', 4500.00, 10500.00),
(13, 'Purchasing Clerk', 2500.00, 5500.00),
(14, 'Purchasing Manager', 8000.00, 15000.00),
(15, 'Sales Manager', 10000.00, 20000.00),
(16, 'Sales Representative', 6000.00, 12000.00),
(17, 'Shipping Clerk', 2500.00, 5500.00),
(18, 'Stock Clerk', 2000.00, 5000.00),
(19, 'Stock Manager', 5500.00, 8500.00);

INSERT INTO departments (department_id, department_name, location_id)
VALUES 
(1, 'Administration', 1700),
(2, 'Marketing', 1800),
(3, 'Purchasing', 1700),
(4, 'Human Resources', 2400),
(5, 'Shipping', 1500),
(6, 'IT', 1400),
(7, 'Public Relations', 2700),
(8, 'Sales', 2500),
(9, 'Executive', 1700),
(10, 'Finance', 1700),
(11, 'Accounting', 1700);

USE HR_Management;

INSERT INTO employees VALUES
(100, 'Steven', 'King', 'steven.king@sqltutorial.org', '515.123.4567', '1987-06-17', 4, 24000.00, NULL, 9),
(101, 'Neena', 'Kochhar', 'neena.kochhar@sqltutorial.org', '515.123.4568', '1989-09-21', 5, 17000.00, 100, 9),
(102, 'Lex', 'De Haan', 'lex.dehaan@sqltutorial.org', '515.123.4569', '1993-01-13', 5, 17000.00, 100, 9),
(103, 'Alexander', 'Hunold', 'alexander.hunold@sqltutorial.org', '590.423.4567', '1990-01-03', 9, 9000.00, 102, 6),
(104, 'Bruce', 'Ernst', 'bruce.ernst@sqltutorial.org', '590.423.4568', '1991-05-21', 9, 6000.00, 103, 6),
(105, 'David', 'Austin', 'david.austin@sqltutorial.org', '590.423.4569', '1997-06-25', 9, 4800.00, 103, 6),
(106, 'Valli', 'Pataballa', 'valli.pataballa@sqltutorial.org', '590.423.4560', '1998-02-05', 9, 4800.00, 103, 6),
(107, 'Diana', 'Lorentz', 'diana.lorentz@sqltutorial.org', '590.423.5567', '1999-02-07', 9, 4200.00, 103, 6),
(108, 'Nancy', 'Greenberg', 'nancy.greenberg@sqltutorial.org', '515.124.4569', '1994-08-17', 7, 12000.00, 101, 10),
(109, 'Daniel', 'Faviet', 'daniel.faviet@sqltutorial.org', '515.124.4169', '1994-08-16', 6, 9000.00, 108, 10),
(110, 'John', 'Chen', 'john.chen@sqltutorial.org', '515.124.4269', '1997-09-28', 6, 8200.00, 108, 10),
(111, 'Ismael', 'Sciarra', 'ismael.sciarra@sqltutorial.org', '515.124.4369', '1997-09-30', 6, 7700.00, 108, 10),
(112, 'Jose Manuel', 'Urman', 'jose.urman@sqltutorial.org', '515.124.4469', '1998-03-07', 6, 7800.00, 108, 10),
(113, 'Luis', 'Popp', 'luis.popp@sqltutorial.org', '515.124.4567', '1999-12-07', 6, 6900.00, 108, 10),
(114, 'Den', 'Raphaely', 'den.raphaely@sqltutorial.org', '515.127.4561', '1994-12-07', 14, 11000.00, 100, 3),
(115, 'Alexander', 'Khoo', 'alexander.khoo@sqltutorial.org', '515.127.4562', '1995-05-18', 13, 3100.00, 114, 3),
(116, 'Shelli', 'Baida', 'shelli.baida@sqltutorial.org', '515.127.4563', '1997-12-24', 13, 2900.00, 114, 3),
(117, 'Sigal', 'Tobias', 'sigal.tobias@sqltutorial.org', '515.127.4564', '1997-07-24', 13, 2800.00, 114, 3),
(118, 'Guy', 'Himuro', 'guy.himuro@sqltutorial.org', '515.127.4565', '1998-11-15', 13, 2600.00, 114, 3),
(119, 'Karen', 'Colmenares', 'karen.colmenares@sqltutorial.org', '515.127.4566', '1999-08-10', 13, 2500.00, 114, 3),
(120, 'Matthew', 'Weiss', 'matthew.weiss@sqltutorial.org', '650.123.1234', '1996-07-18', 19, 8000.00, 100, 5),
(121, 'Adam', 'Fripp', 'adam.fripp@sqltutorial.org', '650.123.2234', '1997-04-10', 19, 8200.00, 100, 5),
(122, 'Payam', 'Kaufling', 'payam.kaufling@sqltutorial.org', '650.123.3234', '1995-05-01', 19, 7900.00, 100, 5),
(123, 'Shanta', 'Vollman', 'shanta.vollman@sqltutorial.org', '650.123.4234', '1997-10-10', 19, 6500.00, 100, 5),
(126, 'Irene', 'Mikkilineni', 'irene.mikkilineni@sqltutorial.org', '650.124.1224', '1998-09-28', 18, 2700.00, 120, 5),
(145, 'John', 'Russell', 'john.russell@sqltutorial.org', NULL, '1996-10-01', 15, 14000.00, 100, 8),
(146, 'Karen', 'Partners', 'karen.partners@sqltutorial.org', NULL, '1997-01-05', 15, 13500.00, 100, 8),
(176, 'Jonathon', 'Taylor', 'jonathon.taylor@sqltutorial.org', NULL, '1998-03-24', 16, 8600.00, 100, 8),
(177, 'Jack', 'Livingston', 'jack.livingston@sqltutorial.org', NULL, '1998-04-23', 16, 8400.00, 100, 8),
(178, 'Kimberely', 'Grant', 'kimberely.grant@sqltutorial.org', NULL, '1999-05-24', 16, 7000.00, 100, 8),
(179, 'Charles', 'Johnson', 'charles.johnson@sqltutorial.org', NULL, '2000-01-04', 16, 6200.00, 100, 8),
(192, 'Sarah', 'Bell', 'sarah.bell@sqltutorial.org', '650.501.1876', '1996-02-04', 17, 4000.00, 123, 5),
(193, 'Britney', 'Everett', 'britney.everett@sqltutorial.org', '650.501.2876', '1997-03-03', 17, 3900.00, 123, 5),
(200, 'Jennifer', 'Whalen', 'jennifer.whalen@sqltutorial.org', '515.123.4444', '1987-09-17', 3, 4400.00, 101, 1),
(201, 'Michael', 'Hartstein', 'michael.hartstein@sqltutorial.org', '515.123.5555', '1996-02-17', 10, 13000.00, 100, 2),
(202, 'Pat', 'Fay', 'pat.fay@sqltutorial.org', '603.123.6666', '1997-08-17', 11, 6000.00, 201, 2),
(203, 'Susan', 'Mavris', 'susan.mavris@sqltutorial.org', '515.123.7777', '1994-06-07', 8, 6500.00, 101, 4),
(204, 'Hermann', 'Baer', 'hermann.baer@sqltutorial.org', '515.123.8888', '1994-06-07', 12, 10000.00, 101, 7),
(205, 'Shelley', 'Higgins', 'shelley.higgins@sqltutorial.org', '515.123.8080', '1994-06-07', 2, 12000.00, 101, 11);

INSERT INTO dependents (dependent_id, first_name, last_name, relationship, employee_id)
VALUES
(1, 'Penelope', 'Gietz', 'Child', 206),
(2, 'Nick', 'Higgins', 'Child', 205),
(3, 'Ed', 'Whalen', 'Child', 200),
(4, 'Jennifer', 'King', 'Child', 100),
(5, 'Johnny', 'Kochhar', 'Child', 101),
(6, 'Bette', 'De Haan', 'Child', 102),
(7, 'Grace', 'Faviet', 'Child', 109),
(8, 'Matthew', 'Chen', 'Child', 110),
(9, 'Joe', 'Sciarra', 'Child', 111),
(10, 'Christian', 'Urman', 'Child', 112),
(11, 'Zero', 'Popp', 'Child', 113),
(12, 'Karl', 'Greenberg', 'Child', 108),
(13, 'Uma', 'Mavris', 'Child', 203),
(14, 'Vivien', 'Hunold', 'Child', 103),
(15, 'Cuba', 'Ernst', 'Child', 104),
(16, 'Fred', 'Austin', 'Child', 105),
(17, 'Helen', 'Pataballa', 'Child', 106),
(18, 'Dan', 'Lorentz', 'Child', 107),
(19, 'Bob', 'Hartstein', 'Child', 201),
(20, 'Lucille', 'Fay', 'Child', 202),
(21, 'Kirsten', 'Baer', 'Child', 204),
(22, 'Elvis', 'Khoo', 'Child', 115),
(23, 'Sandra', 'Baida', 'Child', 116),
(24, 'Cameron', 'Tobias', 'Child', 117),
(25, 'Kevin', 'Himuro', 'Child', 118),
(26, 'Rip', 'Colmenares', 'Child', 119),
(27, 'Julia', 'Raphaely', 'Child', 114),
(28, 'Woody', 'Russell', 'Child', 145),
(29, 'Alec', 'Partners', 'Child', 146),
(30, 'Sandra', 'Taylor', 'Child', 176);

-- Get all rows and columns from the employees table

SELECT * FROM employees;

-- Get employee_id, first_name, last_name, and hire_date

SELECT employee_id, first_name, last_name, hire_date
FROM employees;

-- Get first_name, last_name, salary, and a new column New_Salary

SELECT first_name, last_name, salary, salary AS New_Salary
FROM employees;

-- Double the salary and name it New_Salary

SELECT first_name, last_name, salary, salary * 2 AS New_Salary
FROM employees;

-- Return employee_id, first_name, last_name, hire_date, and salary

SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;

-- Sort employees by first_name in alphabetical order

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name ASC;

-- Sort by first_name ascending and last_name descending

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name ASC, last_name DESC;

-- Sort employees by salary from high to low

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

-- Sort employees by hire_date from earliest to latest

SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date ASC;

-- Sort employees by hire_date from latest to earliest

SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;

-- Select salary data and sort from high to low

SELECT salary
FROM employees
ORDER BY salary DESC;

-- Select unique salary values only

SELECT DISTINCT salary
FROM employees;

-- Select job ID and salary

SELECT job_id, salary
FROM employees;

-- Remove duplicate combinations of job ID and salary

SELECT DISTINCT job_id, salary
FROM employees;

-- Return distinct phone numbers of employees

SELECT DISTINCT phone_number
FROM employees;

-- Return all rows sorted by first_name

SELECT *
FROM employees
ORDER BY first_name;

-- Return the first 5 rows

SELECT TOP 5 *
FROM employees;

-- Return five rows starting from the 4th row

SELECT *
FROM employees
ORDER BY employee_id
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;

-- Get top 5 employees with the highest salaries

SELECT TOP 5 first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

-- Get employees with the 2nd highest salary

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- Employees with salary > 14,000, sorted by salary descending

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 14000
ORDER BY salary DESC;

-- Employees in department ID 5

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = 5;

-- Employee whose last name is Chen

SELECT *
FROM employees
WHERE last_name = 'Chen';

-- Employees hired after January 1st, 1999

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1999-01-01';

-- Employees hired in 1999

SELECT first_name, last_name, hire_date
FROM employees
WHERE YEAR(hire_date) = 1999;

-- Employee whose last name is Himuro

SELECT *
FROM employees
WHERE last_name = 'Himuro';

-- Search for "Himuro" in last_name (partial match)

SELECT *
FROM employees
WHERE last_name LIKE '%Himuro%';

-- Employees without phone numbers

SELECT first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NULL;

-- Employees whose department ID is not 8

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id <> 8;

-- Employees whose department ID is not 8 or 10

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (8, 10);

-- Employees with salary > 10,000

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 10000;

-- Employees in department 8 with salary > 10,000

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 8 AND salary > 10000;

-- Employees with salary < 10,000

SELECT first_name, last_name, salary
FROM employees
WHERE salary < 10000;

-- Employees with salary ≥ 9,000

SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 9000;

-- Employees with salary ≤ 9,000

SELECT first_name, last_name, salary
FROM employees
WHERE salary <= 9000;

-- TABLE CREATED FOR Courses

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Add a new column named credit_hours

ALTER TABLE courses
ADD credit_hours INT;

-- Add fee and max_limit columns

ALTER TABLE courses
ADD fee DECIMAL(10,2),
    max_limit INT;

-- Change the fee column to NOT NULL

ALTER TABLE courses
ALTER COLUMN fee DECIMAL(10,2) NOT NULL;

-- Remove the fee column

ALTER TABLE courses
DROP COLUMN fee;

-- Remove both max_limit and credit_hours

ALTER TABLE courses
DROP COLUMN max_limit, credit_hours;

-- Create the projects Table

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create the project_milestones Table with a FOREIGN KEY

CREATE TABLE project_milestones (
    milestone_id INT PRIMARY KEY,
    project_id INT,
    milestone_name VARCHAR(100),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Add FOREIGN KEY to an Existing Table

ALTER TABLE project_milestones
ADD CONSTRAINT fk_project
FOREIGN KEY (project_id) REFERENCES projects(project_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

    ALTER TABLE project_milestones
ADD CONSTRAINT fk_project
FOREIGN KEY (project_id) REFERENCES projects(project_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

    SELECT 
    f.name AS ForeignKey,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    f.delete_referential_action_desc,
    f.update_referential_action_desc
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc
    ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'project_milestones';

-- Employees with salary > 5,000 and < 7,000 (AND operator)

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 5000 AND salary < 7000;

-- Employees with salary = 7,000 or 8,000 (OR operator)

SELECT first_name, last_name, salary
FROM employees
WHERE salary = 7000 OR salary = 8000;

-- Employees without a phone number (IS NULL + NOT logic)

SELECT first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NULL;

-- Employees with salary between 9,000 and 12,000 (BETWEEN operator)

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 9000 AND 12000;

-- . Employees in department 8 or 9 (IN operator)

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (8, 9);

-- Employees whose first name starts with "jo" (LIKE operator)

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'jo%';

-- Employees whose second character in first_name is "h" (LIKE with underscore)

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '_h%';

-- Employees whose salary is greater than all salaries in department 8 (ALL operator)

SELECT first_name, last_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 8
);

-- Employees whose salaries are greater than the average salary of every department

SELECT first_name, last_name, salary
FROM employees
WHERE salary > ALL (
    SELECT AVG(salary)
    FROM employees
    GROUP BY department_id
);

-- Employees who have dependents

SELECT DISTINCT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;

-- Employees with salaries between 2,500 and 2,900

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 2900;

-- Employees with salaries not between 2,500 and 2,900

SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 2500 AND 2900;

-- Employees who joined between Jan 1, 1999 and Dec 31, 2000

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31';

-- Employees who did not join between Jan 1, 1989 and Dec 31, 1999

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';

-- Employees who joined between 1990 and 1993

SELECT first_name, last_name, hire_date
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1993;

-- Employees whose first names start with Da

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Da%';

-- Employees whose first names end with er

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%er';

-- Employees whose last names contain an

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%an%';

-- First names that start with Jo and are followed by at most 2 characters

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Jo_' OR first_name LIKE 'Jo__';

-- First names that start with any characters and are followed by at most one character

SELECT first_name, last_name
FROM employees
WHERE LEN(first_name) = 2;

-- First names that start with S but not with Sh

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';

-- Employees who work in department ID 5

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = 5;

-- Employees in department ID 5 with salary not greater than 5000

SELECT first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 5 AND salary <= 5000;

-- Employees not working in departments 1, 2, or 3

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (1, 2, 3);

-- Employees whose first names do not start with the letter D

SELECT first_name, last_name
FROM employees
WHERE first_name NOT LIKE 'D%';

-- Employees whose salaries are not between 1,000 and 5,000

SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 1000 AND 5000;

-- Get employees who do not have any dependents

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.employee_id IS NULL;

-- Find employees who do not have phone numbers

SELECT employee_id, first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NULL;

-- Find employees who have phone numbers

SELECT employee_id, first_name, last_name, phone_number
FROM employees
WHERE phone_number IS NOT NULL;

-- Get employees who work in departments 1, 2, and 3

SELECT *
FROM employees
WHERE department_id IN (1, 2, 3);

-- Get information of departments with ID 1, 2, and 3

SELECT *
FROM departments
WHERE department_id IN (1, 2, 3);

--  to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3. 

SELECT 
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (1, 2, 3);

-- Query the country names of US, UK, and China

SELECT country_name
FROM countries
WHERE country_name IN ('US', 'UK', 'China');

-- Retrieve locations located in US, UK, and China

SELECT l.location_id, l.street_address, l.city, c.country_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name IN ('US', 'UK', 'China');

-- Join the countries table with the locations table

SELECT c.country_id, c.country_name, l.location_id, l.city
FROM countries c
JOIN locations l ON c.country_id = l.country_id;

-- Find countries that do not have any locations

SELECT c.country_id, c.country_name
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
WHERE l.country_id IS NULL;

-- join 3 tables: regions, countries, and locations

SELECT 
    r.region_name,
    c.country_name,
    l.city,
    l.state_province,
    l.street_address
FROM regions r
JOIN countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id;

-- Who reports to whom

SELECT 
    e.first_name + ' ' + e.last_name AS employee,
    m.first_name + ' ' + m.last_name AS manager
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

SELECT 
    e.first_name + ' ' + e.last_name AS employee,
    ISNULL(m.first_name + ' ' + m.last_name, 'No Manager') AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Create Tables

CREATE  TABLE  fruits ( 
fruit_id  INT PRIMARY KEY, 
fruit_name  VARCHAR (255) NOT NULL, 
basket_id  INTEGER 
); 
CREATE TABLE baskets ( 
basket_id  INT PRIMARY KEY, 
basket_name  VARCHAR (255) NOT NULL 
);

-- Insert data 

INSERT  INTO  baskets  (basket_id, basket_name) 
VALUES 
(1, 'A'), 
(2, 'B'), 
(3, 'C'); 
INSERT  INTO  fruits ( 
fruit_id, 
fruit_name, 
basket_id 
) 
VALUES 
(1, 'Apple', 1), 
(2, 'Orange', 1), 
(3, 'Banana', 2), 
(4, 'Strawberry', NULL); 

-- Return all fruits and baskets — including unmatched ones

SELECT 
    f.fruit_name,
    b.basket_name
FROM fruits f
FULL OUTER JOIN baskets b ON f.basket_id = b.basket_id;

-- Find baskets that do not store any fruit

SELECT b.basket_id, b.basket_name
FROM baskets b
LEFT JOIN fruits f ON b.basket_id = f.basket_id
WHERE f.fruit_id IS NULL;

-- Find fruits that are not in any basket

SELECT fruit_id, fruit_name
FROM fruits
WHERE basket_id IS NULL;

-- Create Table

CREATE  TABLE  sales_organization ( 
sales_org_id  INT PRIMARY KEY, 
sales_org  VARCHAR (255) 
); 
CREATE  TABLE  sales_channel ( 
channel_id  INT PRIMARY KEY, 
channel  VARCHAR (255) 
);

-- Insert Data 

INSERT INTO sales_organization (sales_org_id, sales_org) 
VALUES 
(1, 'Domestic'), 
(2, 'Export'); 

INSERT INTO sales_channel (channel_id, channel) 
VALUES 
(1, 'Wholesale'), 
(2, 'Retail'), 
(3, 'eCommerce'), 
(4, 'TV Shopping'); 

-- All Possible Sales Channels per Sales Organization

SELECT 
    so.sales_org,
    sc.channel
FROM sales_organization so
CROSS JOIN sales_channel sc;

-- Group values in department_id column of employees

SELECT department_id
FROM employees
GROUP BY department_id;

-- Count number of employees by department

SELECT department_id, COUNT(*) AS headcount
FROM employees
GROUP BY department_id;

-- Return names of departments with headcount > 10

SELECT d.department_name, COUNT(e.employee_id) AS headcount
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 10;

-- Sort departments by headcount

SELECT d.department_name, COUNT(e.employee_id) AS headcount
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY headcount DESC;

-- Find departments with headcount > 5

SELECT d.department_name, COUNT(e.employee_id) AS headcount
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 5;

-- Minimum, maximum, and average salary per department

SELECT department_id,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Total salary per department

SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Group by both department_id and job_id

SELECT department_id, job_id, COUNT(*) AS group_count
FROM employees
GROUP BY department_id, job_id;

-- Managers and their direct reports, grouped and counted

SELECT 
    m.employee_id AS manager_id,
    m.first_name + ' ' + m.last_name AS manager_name,
    COUNT(e.employee_id) AS direct_reports
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name;

-- Employees who have at least five direct reports

SELECT 
    m.employee_id AS manager_id,
    m.first_name + ' ' + m.last_name AS manager_name,
    COUNT(e.employee_id) AS direct_reports
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
HAVING COUNT(e.employee_id) >= 5;

-- Departments with total salary between 20,000 and 30,000

SELECT 
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;

-- Department with lowest salary > 10,000

SELECT 
    department_id,
    MIN(salary) AS min_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 10000;

-- Departments with average salary between 5,000 and 7,000

SELECT 
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;

-- Combine Full Names from Both Tables

SELECT first_name + ' ' + last_name AS full_name
FROM employees

UNION

SELECT first_name + ' ' + last_name AS full_name
FROM dependents;

SELECT first_name + ' ' + last_name AS full_name
FROM employees

UNION ALL

SELECT first_name + ' ' + last_name AS full_name
FROM dependents;

--  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order. 

SELECT department_id
FROM employees

INTERSECT

SELECT department_id
FROM departments

ORDER BY department_id DESC;

-- Find all employees who have at least one dependent

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name;

-- Find employees who do not have any dependents

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.employee_id IS NULL;

-- Work anniversaries using CASE (assuming current year is 2000)

SELECT 
    first_name,
    last_name,
    hire_date,
    CASE 
        WHEN 2000 - YEAR(hire_date) = 1 THEN '1st Anniversary'
        WHEN 2000 - YEAR(hire_date) = 5 THEN '5th Anniversary'
        WHEN 2000 - YEAR(hire_date) = 10 THEN '10th Anniversary'
        ELSE 'No Milestone'
    END AS work_anniversary
FROM employees;

-- Salary category using CASE

SELECT 
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 3000 THEN 'Low'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END AS salary_category
FROM employees;

-- Update Sarah Bell’s last name to Lopez

UPDATE employees
SET last_name = 'Lopez'
WHERE employee_id = 192;

-- Ensure dependents' last names match their parent's last name

UPDATE dependents
SET last_name = e.last_name
FROM dependents d
JOIN employees e ON d.employee_id = e.employee_id;

-- Departments where location id is 1700

SELECT  
* 
FROM 
departments 
WHERE 
location_id = 1700;

--  find all employees that belong to the location 1700 by using the department id list of the previous query

SELECT  
employee_id, first_name, last_name 
FROM 
employees 
WHERE 
department_id IN (1 , 3, 8, 10, 11) 
ORDER BY first_name , last_name; 

-- Employees in departments located at location 1700 (using subquery)

SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
)
ORDER BY first_name, last_name;

-- Employees not in location 1700

SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

-- Employees with the highest salary

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Employees with salary greater than average

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Departments with at least one employee earning > 10,000

SELECT DISTINCT department_id
FROM employees
WHERE salary > 10000;

SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 10000;

-- Departments with no employee earning > 10,000

SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (
    SELECT department_id
    FROM employees
    WHERE salary > 10000
);

-- Lowest salary by department

SELECT department_id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;

-- Employees whose salary is greater than the lowest salary of every department

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > ALL (
    SELECT MIN(salary)
    FROM employees
    GROUP BY department_id
);

-- Employees whose salary is greater than or equal to the highest salary of every department

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= ALL (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id
);

-- Average salary by department

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Average of average salaries across departments

SELECT AVG(avg_salary) AS overall_avg
FROM (
    SELECT AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg;

-- Salaries, average salary, and difference from average

SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary,
    salary - (SELECT AVG(salary) FROM employees) AS salary_difference
FROM employees;









































































