--Display last name, job title of employees who have commission percentage and belongs to department 30.
SELECT JOB_TITLE, LAST_NAME,  MAX_SALARY-SALARY DIFFERENCE ,DEPARTMENT_ID FROM EMPLOYEES RIGHT JOIN JOBS ON DEPARTMENT_ID = 30 ;

--Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
SELECT DEPARTMENT_NAME, FIRST_NAME, SALARY 
          FROM DEPARTMENTS DEP 
                  JOIN EMPLOYEES EMP ON (DEP.MANAGER_ID=EMP.MANAGER_ID) 
                           WHERE (SYSDATE-HIRE_DATE) / 365 > 5;
                           
--Display employee name if the employee joined before his manager.                           
SELECT FIRST_NAME FROM EMPLOYEES E1 
         JOIN EMPLOYEES E2 ON (E1.MANAGER_ID=E2.EMPLOYEE_ID) 
                WHERE E1.HIRE_DATE < E2.HIRE_DATE;
                
--Display employee name, job title for the jobs, employee did in the past where the job was done less than six months.                
            SELECT FIRST_NAME, JOB_TITLE FROM EMPLOYEES EMP 
    JOIN JOB_HISTORY JH ON (JH.EMPLOYEE_ID = EMP.EMPLOYEE_ID) 
    JOIN JOBS J ON( JH.JOB_ID = J.JOB_ID) 
            WHERE MONTHS_BETWEEN(END_DATE,START_DATE) < 6 ;
--Display department name, average salary and number of employees with commission within the department.
SELECT department_name, ROUND(AVG(salary)), COUNT(commission_pct) 
	FROM departments 
		JOIN employees USING (department_id) 
GROUP BY department_name;
--6. Display employee name and country in which he is working.
SELECT FIRST_NAME, COUNTRY_NAME 
    FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID) 
        JOIN LOCATIONS USING( LOCATION_ID) JOIN COUNTRIES USING ( COUNTRY_ID);