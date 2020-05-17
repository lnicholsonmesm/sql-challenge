DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	 DepartmentNum 		VARCHAR(4) 		Primary Key
	,DepartmentName 	VARCHAR(30)		NOT NULL
)
;

DROP TABLE IF EXISTS EmployeeTitles;
CREATE TABLE EmployeeTitles (
	 TitleId 		VARCHAR(5) 			Primary Key
	,Title 			VARCHAR(30)			NOT NULL
)
;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	 EmployeeNum 		INT 			Primary Key
	,TitleId 			VARCHAR(5)
	,BirthDate			DATE
	,FirstName			VARCHAR(20)		NOT NULL
	,LastName 			VARCHAR(30)		NOT NULL
	,Sex				VARCHAR(1)
	,HireDate			DATE
	,FOREIGN KEY (TitleId) REFERENCES EmployeeTitles(TitleId)
)
;

DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
	 EmployeeNum 	INT 			NOT NULL
	,Salary 		VARCHAR(30)
	,FOREIGN KEY (EmployeeNum) REFERENCES Employee(EmployeeNum)
)
;

DROP TABLE IF EXISTS ManagerDeptMatch;
CREATE TABLE ManagerDeptMatch (
	 DepartmentNum 	VARCHAR(4)			
	,EmployeeNum 	INT 
	,FOREIGN KEY (EmployeeNum) REFERENCES Employee(EmployeeNum)
	,FOREIGN KEY (DepartmentNum) REFERENCES Department(DepartmentNum)
)
;

DROP TABLE IF EXISTS EmployeeDeptMatch;
CREATE TABLE EmployeeDeptMatch (
	 EmployeeNum 	INT		
	,DepartmentNum 	VARCHAR(4)	
	,FOREIGN KEY (EmployeeNum) REFERENCES Employee(EmployeeNum)
	,FOREIGN KEY (DepartmentNum) REFERENCES Department(DepartmentNum)
)
;