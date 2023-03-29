-- 1.Display first name and last name as full name, salary, commission pct, and hire date for employees with salary less than 10000.


SELECT
FIRST_NAME ||' '||LAST_NAME as " ischinin_adisoyadi ",
SALARY  as " ischinin maashi ",
COMMISSION_PCT as "faiz",
HIRE_DATE  " ischinin_muddeti "
FROM hr.employees where salary <= 10000 ;


-- 2. Display city names (without repeated names) in ascending order from locations table.

SELECT
DISTINCT City
FROM LOCATIONS;


--3. Display the first name, hire date and job ID of the employees who is either IT Programmer or Sales Manager, and hired between 2002 and 2005.

SELECT first_name, last_name, hire_date,JOB_ID
	FROM employees
		WHERE job_id IN ('IT_PROG', 'SA_MAN') ;
        
SELECT first_name, last_name, hire_date,JOB_ID
	FROM employees
		WHERE job_id = 'IT_PROG' or job_id = 'SA_MAN' ;
        
--4. Display details from jobs table in the descending order of the job title.
 SELECT * 
	FROM jobs 
		ORDER BY job_title DESC;
        
-- 5. Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department id is 30.
        
 SELECT *
     FROM hr.employees
           WHERE COMMISSION_PCT IS NULL AND SALARY
                BETWEEN 5000 AND 10000 AND DEPARTMENT_ID=30;
                
-- 6. Display employees who joined after 1st January 2008.                
                
 SELECT *
     FROM EMPLOYEES  
           where hire_date > '01-jan-2008';                

--7. Display details of employees with ID 150, 160 or 170.
SELECT * 
     FROM EMPLOYEES 
            WHERE EMPLOYEE_ID in (150,160,170);
            
--8. Display employees where the first name or last name starts with S.
SELECT FIRST_NAME, LAST_NAME 
        FROM EMPLOYEES 
               WHERE  FIRST_NAME  
                       LIKE 'S%' OR LAST_NAME LIKE 'S%' ;          
    
--9. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE INSTR(LAST_NAME,'B') > 3;