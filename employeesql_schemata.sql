-- EmployeeSQL
drop table managers
drop table employeedept
drop table salaries
drop table employee
drop table departments
drop table title

-- Title Table
CREATE TABLE title (
	id varchar NOT NULL PRIMARY KEY, 
	titlename varchar NOT NULL
);

-- Departments Table
CREATE TABLE departments (
	id VARCHAR NOT NULL PRIMARY KEY,
	departname VARCHAR NOT NULL
);

-- Employee Table
CREATE TABLE employee (
    id VARCHAR NOT NULL PRIMARY KEY,
    titleid varchar NOT NULL,
    birthdate varchar NOT NULL,
    firstname varchar NOT NULL,
    lastname varchar NOT NULL,
    sex varchar NOT NULL,
    hiredate varchar NOT NULL
);

-- Salaries Table
CREATE TABLE salaries (
	id VARCHAR NOT NULL PRIMARY KEY, 
	salary VARCHAR NOT NULL,
	FOREIGN KEY (id) REFERENCES employee(id)
);

-- Employee Departments Table
CREATE TABLE employeedept (
	empid VARCHAR NOT NULL, 
	deptid VARCHAR NOT NULL,
	FOREIGN KEY (empid) REFERENCES employee(id),
	FOREIGN KEY (deptid) REFERENCES departments(id)
);

-- Managers Table
CREATE TABLE managers (
	id VARCHAR NOT NULL,
	managerid VARCHAR NOT NULL, 
	FOREIGN KEY (id) REFERENCES departments(id)
);

-- Review Data Import 
SELECT * FROM title 
SELECT * FROM departments 
SELECT * FROM employee 
SELECT * FROM salaries
SELECT * FROM employeedept
SELECT * FROM managers 