--1. Show minimum, average and maximum salary in last 15 years according to job id
SELECT 
    MIN(SALARY), MAX(SALARY), ROUND(AVG(SALARY)), JOB_ID
             FROM employees 
                      GROUP BY JOB_ID;
            
--2. How many employees hired after 2005 for each department?
SELECT count(*), department_id
   FROM employees
       WHERE HIRE_DATE > TO_DATE('31-DEC-05','DD.MM.YYYY')
            GROUP BY department_id;
            
--3. Write a query to show departments in which the dierence between maximum and minimum salary is greater than 5000.
SELECT MAX(SALARY),MIN(SALARY),department_id
   FROM employees 
         GROUP BY department_id
                     HAVING MAX(SALARY)-MIN(SALARY)>5000;
                     
--4. Display sum salaries of employees who has not commission pact according to departments (without using where and having).

SELECT department_id , SUM(
    CASE
        WHEN  COMMISSION_PCT IS NULL THEN  SALARY 
           ELSE 0 
              END )
     FROM employees GROUP BY department_id;
     
     
--5. How many people has job id with average salary between 3000 and 7000?
SELECT JOB_ID , ROUND(AVG(SALARY))
   FROM employees 
         GROUP BY job_id
                     HAVING AVG(SALARY) > 3000 AND AVG(SALARY) <7000 ;
                     
--6. Find number of employees with same name.
SELECT FIRST_NAME , COUNT (*)
  FROM EMPLOYEES 
     GROUP BY FIRST_NAME 
        HAVING COUNT(*) > 1;
       
--7. How many people with the same phone code work in departments 50 and 90?
SELECT COUNT (*),  SUBSTR(PHONE_NUMBER,1,3) 
  FROM EMPLOYEES 
    WHERE DEPARTMENT_ID IN (50,90)
     GROUP BY SUBSTR(PHONE_NUMBER,1,3) ;
     
 --8. Display departments with sum salary of employees more than 5 in spring and autumn.
 
 
 --?maile ata bilersiniz bunun hellini zehmet olmazsa
 
 
 
 --9. How many employees work in departments which has maximum salary more than 5000?
 SELECT COUNT(*),DEPARTMENT_ID
   FROM employees
      GROUP BY DEPARTMENT_ID 
          HAVING MAX(SALARY) > 5000;
        
        
 --10.Change second letter of employees’ names with the last letter and display.
 SELECT FIRST_NAME ,
 SUBSTR (FIRST_NAME ,1,1) | | 
 SUBSTR (FIRST_NAME ,-1,1) | |
 SUBSTR (FIRST_NAME, 3 LENGTH (FIRST_NAME)-3)| |
 SUBSTR (FISRT_NAME ,2 ,1)
FROM  employees;