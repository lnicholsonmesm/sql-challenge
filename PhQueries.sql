-- PhQuery

--check import of tables
SELECT * FROM Department;
SELECT * FROM EmployeeTitles;
SELECT * FROM Employee; --birthdate needs updating
	SELECT max(hiredate) from Employee; --hiredatelooksok
SELECT * FROM Salaries;
SELECT * FROM ManagerDeptMatch;
SELECT * FROM EmployeeDeptMatch;

/* FIX BIRTHDAY ISSUE -------------------- */
--fix birthdate
SELECT min(birthdate) from employee; -- all birthdates look wrong
SELECT birthdate from Employee -- make sure it's sorting the way I think
order by birthdate;
SELECT date(birthdate - interval '100 year') FROM Employee
; -- check conversion
UPDATE employee
SET birthdate = date(birthdate - interval '100 year')
; -- change 2000's to 1900's
SELECT * FROM employee
; --verify fixed


-- ******* 
/* List the following details of each employee: 
employee number, last name, first name, sex, and salary. */
SELECT em.employeenum
	  ,em.lastname
	  ,em.firstname
	  ,em.sex
	  ,sal.salary
FROM Employee 								em
LEFT JOIN Salaries							sal
	ON em.employeenum = sal.employeenum
;

/* List first name, last name, and hire date for employees 
who were hired in 1986. */
SELECT em.employeenum
	  ,em.lastname
	  ,em.firstname
	  ,em.hiredate
FROM Employee 								em
where hiredate >= '1986-01-01'
	AND hiredate <='1986-12-31'
;
/* List the manager of each department with the following information: 
department number, department name, the manager’s employee number, 
last name, first name. */
SELECT dp.departmentnum
	  ,dp.departmentname
	  ,mn.employeenum as managernum --looks like managemum in the tbl
	  ,em.lastname
	  ,em.firstname
FROM Department 							dp
LEFT JOIN managerdeptmatch  				mn
	ON mn.departmentnum = dp.departmentnum
LEFT JOIN employee 							em
	ON mn.employeenum = em.employeenum
; -- well, they asked for "THE" manager, but clearly there are >1 mngr/dept

/* List the department of each employee with the following information: 
--employee number, last name, first name, and department name. */

SELECT dp.employeenum
	  ,em.lastname
	  ,em.firstname
	  ,dp.departmentname
FROM DepartmentName							dp
LEFT JOIN Employee							em
	ON dp.employeenum = em.employeenum

/* List first name, last name, and sex for employees whose first name 
is “Hercules” and last names begin with “B.” */
SELECT firstname
	  ,lastname
	  ,sex
FROM Employee
WHERE firstname = 'Hercules'
	AND lastname LIKE 'B%'
;
	
/* List all employees in the Sales department, including their 
employee number, last name, first name, and department name. */
SELECT em.employeenum
	  ,em.lastname
	  ,em.firstname
	  ,dpt.departmentname
FROM employee									em
LEFT JOIN employeedeptmatch 					edm
	ON edm.employeenum = em.employeenum
LEFT JOIN department							dpt
	ON dpt.departmentnum = edm.departmentnum
WHERE dpt.departmentname = 'Sales'
;

/* List all employees in the Sales and Development departments, including 
their employee number, last name, first name, and department name. */
SELECT em.employeenum
	  ,em.lastname
	  ,em.firstname
	  ,dpt.departmentname
FROM employee									em
LEFT JOIN employeedeptmatch 					edm
	ON edm.employeenum = em.employeenum
LEFT JOIN department							dpt
	ON dpt.departmentnum = edm.departmentnum
WHERE dpt.departmentname in ('Sales', 'Development')
--WHERE dpt.departmentname = 'Sales' OR dpt.departmentname = 'Development'
;
--checking that there aren't other depts i should be looking at:
select departmentname from department -- all good
;

/* In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.
*/
SELECT lastname, count(lastname)
FROM employee
GROUP BY lastname
ORDER BY count desc
;