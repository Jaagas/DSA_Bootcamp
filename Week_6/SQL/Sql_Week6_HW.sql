--1. Display employees who joined in the month of May.
SELECT *
  FROM employees
       WHERE to_char(hire_date, 'mon')='may';
    
    
--2. Display employees who joined in the current year.
SELECT *
           FROM EMPLOYEES
                     WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE, 'YYYY');
                     
                     select to_char(max(hire_date))
                     from employees;          --2008 is max year in dataset
                     
--3.Display the number of days between system date and 1st January 2011.
SELECT        round( SYSDATE  - to_date('01-jan-2011'))
  FROM DUAL;
  
--4. Display maximum salary of employees.
SELECT JOB_ID, MAX(SALARY)
  FROM employees
   GROUP BY JOB_ID;
--5. Display number of employees in each department.
SELECT COUNT (*), department_id
      FROM EMPLOYEES 
           GROUP BY department_id;
--6. Display number of employees who joined after 15th of month.
SELECT count(*), hire_date
           FROM EMPLOYEES
                     WHERE TO_CHAR(HIRE_DATE,'dd')>15
                       group by hire_date;
--7. Display average salary of employees in each department who have commission percentage.
SELECT DEPARTMENT_ID, round(AVG(SALARY))
    FROM EMPLOYEES 
            WHERE COMMISSION_PCT IS NOT NULL GROUP BY DEPARTMENT_ID;
--8. Display job ID for jobs with average salary more than 10000.            
SELECT JOB_ID, AVG(SALARY) 
          FROM EMPLOYEES 
                    GROUP BY JOB_ID 
                               HAVING AVG(SALARY)>10000;
--9. Display job ID, number of employees, sum of salary, and difference between the highest salary and the lowest salary of the employees for all jobs.    
SELECT JOB_ID, COUNT(*),SUM(SALARY),MAX(SALARY)-MIN(SALARY)
 FROM employees
  GROUP BY JOB_ID;
  --10.Display manager ID and number of employees managed by the manager.
SELECT MANAGER_ID, COUNT(*) 
         FROM EMPLOYEES 
            GROUP BY MANAGER_ID;
--11.Search for the key differences between CHAR and VARCHAR data types.
--The fundamental difference between CHAR and VARCHAR is that the CHAR data type is fixed in length, while the VARCHAR data type supports variable-length columns of data. But they are also similar. They both can store alphanumeric data.