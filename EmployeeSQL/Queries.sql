--1. List the following details of each employee: employee number, last name, 
--first name, sex, and salary.

SELECT "Employees".emp_no, 
"Employees".last_name,
"Employees".first_name,
"Employees".sex,
"Salaries".salary
FROM "Employees"
LEFT JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no
ORDER BY emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT "Employees".last_name,
"Employees".first_name,
"Employees".hire_date
FROM "Employees"
WHERE DATE_PART('year',hire_date)= 1986;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name.

SELECT "Dept_manager".dept_no, 
"Departments".dept_name,
"Dept_manager".emp_no,
"Employees".last_name, 
"Employees".first_name
FROM "Dept_manager"
LEFT JOIN "Departments"
ON "Dept_manager".dept_no = "Departments".dept_no
LEFT JOIN "Employees"
ON "Dept_manager".emp_no = "Employees".emp_no
ORDER BY emp_no;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT "Departments".dept_name,
"Employees".emp_no,
"Employees".last_name, 
"Employees".first_name
FROM "Employees"
INNER JOIN "Dept_Employees" 
ON "Employees".emp_no = "Dept_Employees".emp_no
INNER JOIN "Departments"
ON "Employees".emp_no = "Dept_Employees".emp_no
ORDER BY emp_no;


--5. List first name, last name, and sex for employees whose
--first name is "Hercules" and last names begin with "B."

SELECT "Employees".last_name,
"Employees".first_name,
"Employees".sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name like 'B%';


--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT "Employees".last_name,
"Employees".first_name,
"Employees".emp_no,
"Departments".dept_name
FROM "Employees"
LEFT JOIN "Dept_Employees" 
ON "Employees".emp_no = "Dept_Employees".emp_no
INNER JOIN "Departments"
ON "Departments".dept_no = "Dept_Employees".dept_no
WHERE "Departments".dept_name = 'Sales'
Order By emp_no;


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name,
--and department name.

SELECT "Employees".last_name,
"Employees".first_name,
"Employees".emp_no,
"Departments".dept_name
FROM "Employees"
LEFT JOIN "Dept_Employees" 
ON "Employees".emp_no = "Dept_Employees".emp_no
INNER JOIN "Departments"
ON "Departments".dept_no = "Dept_Employees".dept_no
WHERE "Departments".dept_name = 'Sales'
OR "Departments".dept_name = 'Development'
Order By emp_no;


--8. In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.

Select "Employees".last_name,
COUNT(*) AS name_count
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY name_count ASC;