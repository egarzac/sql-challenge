--EmployeeSQL
-- Queries

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.id, e.lastname, e.firstname, e.sex, s.salary 
FROM employee as e
INNER JOIN salaries AS s   
ON s.id = e.id;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.firstname, e.lastname, e.hiredate
FROM employee as e
WHERE e.hiredate LIKE '%1986'

--3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT m.id, d.departname, m.managerid, e.firstname, e.lastname 
FROM managers as m
INNER JOIN departments AS d   
ON m.id = d.id
INNER JOIN employee AS e
ON m.managerid = e.id

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.id, e.lastname, e.firstname, d.departname 
FROM employee as e
INNER JOIN employeedept AS ed   
ON e.id = ed.empid
INNER JOIN departments AS d
ON ed.deptid = d.id

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT e.firstname, e.lastname, e.sex
FROM employee as e
WHERE e.firstname LIKE 'Hercules' AND e.lastname LIKE 'B%'

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT id, firstname, lastname, 'Sales' AS "Department"
FROM employee 
WHERE id IN 
	(
	SELECT empid 
	FROM employeedept
	WHERE deptid IN
	(
		SELECT id 
		FROM departments
		WHERE departname = 'Sales'
		)
	)
	
--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT id, firstname, lastname, 'Sales' AS "Department"
FROM employee 
WHERE id IN 
	(
	SELECT empid 
	FROM employeedept
	WHERE deptid IN
	(
		SELECT id 
		FROM departments
		WHERE departname = 'Sales'
		)
	)
UNION 
SELECT id, firstname, lastname, 'Development' AS "Department"
FROM employee 
WHERE id IN 
	(
	SELECT empid 
	FROM employeedept
	WHERE deptid IN
	(
		SELECT id 
		FROM departments
		WHERE departname = 'Development'
		)
	)
	
--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT lastname, COUNT(lastname) AS "Last Name Count"
FROM employee
GROUP BY lastname
ORDER BY "Last Name Count" DESC;

--EPILOGUE "Search your ID number." You look down at your badge to see that your employee ID number is 499942.
SELECT * FROM employee
WHERE ID = '499942'