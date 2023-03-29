-- 1. Display the first promotion year for each employee
SELECT FIRST_NAME, LAST_NAME, PY.PR_DATE 
     FROM HR.EMPLOYEES EMP 
                     LEFT JOIN  (SELECT min(end_date) PR_DATE , employee_id from hr.job_history   GROUP BY EMPLOYEE_ID) PY 
                                   ON EMP.EMPLOYEE_ID=PY.EMPLOYEE_ID;
--2. Display location, city and department name of employees who have been promoted more than once
SELECT EMP.FIRST_NAME, EMP.LAST_NAME , DEP.DEPARTMENT_NAME, LOC.CITY
      FROM HR.EMPLOYEES EMP 
LEFT JOIN HR.DEPARTMENTS DEP ON EMP.DEPARTMENT_ID=DEP.DEPARTMENT_ID
LEFT JOIN HR.LOCATIONS LOC ON DEP.LOCATION_ID=LOC.LOCATION_ID
        WHERE EMP.EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM HR.JOB_HISTORY
               GROUP BY EMPLOYEE_ID 
                     HAVING COUNT(*)>1);
                     
--3. Display minimum and maximum “hire_date” of employees work in IT and HR departments.
SELECT MIN(HIRE_DATE),MAX(HIRE_DATE) ,DEPARTMENT_ID
    FROM HR.EMPLOYEES EMP
            WHERE EMP.DEPARTMENT_ID IN (40,60)
                    GROUP BY DEPARTMENT_ID;
--4. Find difference between current date and hire dates of employees after sorting them by hire date, then show difference in days, months and years.
SELECT ROUND(SYSDATE-HIRE_DATE) ,
        ABS(EXTRACT (DAY FROM HIRE_DATE) - EXTRACT(DAY FROM SYSDATE)) DAY_DIFF,
         ABS(EXTRACT (MONTH FROM HIRE_DATE) - EXTRACT(MONTH FROM SYSDATE)) MONTH_DIFF,
          ABS(EXTRACT (YEAR FROM HIRE_DATE) - EXTRACT(YEAR FROM SYSDATE)) YEAR_DIFF
    FROM HR.EMPLOYEES  ORDER BY HIRE_DATE;

--5. Find which departments used to hire earliest/latest.    
 SELECT DISTINCT DEP. DEPARTMENT_NAME, HIRE_DATE FROM HR.EMPLOYEES EMP 
 LEFT JOIN  HR.DEPARTMENTS DEP ON EMP.DEPARTMENT_ID=DEP.DEPARTMENT_ID
 WHERE
HIRE_DATE =(SELECT MIN(HIRE_DATE) from hr.employees ) OR
HIRE_DATE =(SELECT MAX(HIRE_DATE) from HR.EMPLOYEES);
--6. Find the number of departments with no employee for each city.
SELECT EMP.FIRST_NAME, EMP.LAST_NAME, DEP.DEPARTMENT_NAME, LOC.CITY
    FROM HR.DEPARTMENTS DEP
    LEFT JOIN HR.EMPLOYEES EMP ON  EMP.DEPARTMENT_ID=DEP.DEPARTMENT_ID
    LEFT JOIN HR.LOCATIONS LOC ON DEP.LOCATION_ID=LOC.LOCATION_ID
    WHERE FIRST_NAME IS NULL ;
--7. Create a category called “seasons” and find in which season most employees were hired.
SELECT COUNT(*) EMP_NUMBERS , SEASONS
    FROM 
        (SELECT FIRST_NAME, CASE
            WHEN TO_CHAR(HIRE_DATE, 'MON' ) IN ('DEC','JAN','FEB') THEN 'WINTER'
            WHEN TO_CHAR(HIRE_DATE, 'MON' ) IN ('MAR', 'APR ', 'MAY' ) THEN 'SPRING'
            WHEN TO_CHAR(HIRE_DATE , 'MON' ) IN ('JUN','JULY','AVG') THEN 'SUMMER'
                    ELSE 'AUTMN'
                                END SEASONS FROM EMPLOYEES)
                                        GROUP BY SEASONS;
--8. Find the cities of employees with average salary more than 5000.
select loc.city, round(avg(salary)) from hr.employees emp
left join hr.departments dep on emp.department_id= dep.department_id
left join hr.locations loc on dep.location_id= loc.location_id 
group by loc.city  having avg(salary)>5000