-- 1) Write a query in SQL to display job Title, the difference between minimum and maximum salaries for those jobs which max salary within the range 12000 to 18000.
Select job_title , max_salary-min_salary
    from hr . jobs
         where max_salary 
                between 12000 and 18000;
                
--2) Display the details of the employees who have no commission percentage and whose salary is within the range 7000 to 12000 for those employees who are not working in the departments 50,30 and 80.                
Select *
   from hr.employees 
       where commission_pct is null 
           and salary 
             between 7000 and 12000
               and department_id 
                 not in (50 ,30,80);
                 
--3) Write a query in SQL to display the full name (first name and last name), hire date, commission percentage, email and telephone separated by '-', and salary for those employees whose salary is above 11000 and make the result set in a descending order by the full name.                 
 Select
   first_name ||' '|| last_name full_name,
      commission_pct, 
          hire_date,
               EMAIL || '-' ||  PHONE_number contact_details
                     from hr . employees
                           where salary >11000 ORDER BY    1 desc;
  -- 4) Write a query in SQL to display the first and last name, and salary for those employees whose first name is ending with the letter “m” and they have been hired before June 5th, 2010.                         
SELECT FIRST_NAME, LAST_NAME, SALARY,HIRE_DATE
       from hr.employees
                WHERE FIRST_NAME LIKE 'm%' 
                      AND HIRE_DATE<'05-JUN-10' ;
                      
                      
    --5) Display the full name (first and last), the phone number and email separated by hyphen, and salary, for those employees whose salary is not within the range of 9000 and 17000 and commission is not null. The column headings assign with Full_Name, Contact _Details and Remuneration respectively.
 SELECT
          first_name ||' '|| last_name full_name,commission_pct,hire_date,
               EMAIL || '-' ||  PHONE_number contact_details
                  from employees 
                       where salary not between  9000 and 17000
                           and  commission_pct is not  null ;
  --6) Write a query in SQL to display all the information about the department Marketing.                    
SELECT * 
    FROM HR.departments
          WHERE DEPARTMENT_ID = 20; 
          
   --7) Write a query to display data from job_history and make the result set in descending order by the epmloyee_id and ascending order by start date.         
 SELECT *
    FROM JOB_HISTORY 
       ORDER BY  employee_id DESC, START_DATE ASC;
       
-- 8) Write a query to display job_id and salary of employees whose phone number starts with 515 or 590 and was hired after 2003 by sorting hire_date and salary in ascending way.  
SELECT JOB_ID, SALARY 
   FROM HR.employees 
      WHERE (PHONE_NUMBER LIKE '590%' OR PHONE_NUMBER LIKE '515%')
            AND HIRE_DATE > '31-DEC-03' ;
   
 --9) Write a query to display employees who were hired in 2001.           
SELECT * 
    FROM employees
        WHERE  HIRE_DATE LIKE '%-01%';
        
--10) Write a query to display employees’ first and last name who were not hired in 2006 and 2007.        
SELECT * 
    FROM employees
        WHERE  HIRE_DATE NOT LIKE '%-06%' AND HIRE_DATE NOT  LIKE '%-07%';
        
--11) Write a query to display email, job_id and first name of employees whose hired year was 2007 or hired month was 1.
SELECT * 
    FROM employees
        WHERE  HIRE_DATE LIKE '%-07%' OR HIRE_DATE LIKE '%-01-%';
        
 --12) Write a query to display details of employees who was hired after 2007 or salary is less than 10000.       
  SELECT * 
    FROM employees
        WHERE  HIRE_DATE > '31-DEC-07' AND SALARY < 10000;
        
        
        