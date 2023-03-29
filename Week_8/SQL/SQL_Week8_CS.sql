--Q1
CREATE TABLE ACTIVITIES (
  A_ID NUMBER PRIMARY KEY,
  A_NAME VARCHAR2(50) NOT NULL,
  COST NUMBER(10,2) NOT NULL
);

CREATE TABLE STUDENTS (
  S_ID NUMBER PRIMARY KEY,
  FIRST_NAME VARCHAR2(50),
  LAST_NAME VARCHAR2(50),
  PHONE_NUMBER VARCHAR2(20),
  EMAIL VARCHAR2(50)
);

CREATE TABLE SCHEDULE (
  S_ID NUMBER REFERENCES STUDENTS(S_ID),
  A_ID NUMBER REFERENCES ACTIVITIES(A_ID),
  S_DATE DATE
);

--Q2
INSERT INTO students (s_id, first_name, last_name, phone_number, email)
SELECT employee_id, first_name, last_name, phone_number, email
FROM hr.employees;


--Q3
UPDATE students
SET phone_number = '***'
WHERE s_id > 200;

--Q4
UPDATE students
SET first_name = UPPER(first_name), last_name = UPPER(last_name);

--Q5
UPDATE STUDENTS
SET EMAIL = 'DSA'
WHERE S_ID > 150;

--Q6
CREATE TABLE PROGRAMMERS AS
SELECT *
FROM hr.EMPLOYEES
WHERE JOB_ID LIKE '%PROG%';

--Q7
DELETE FROM STUDENTS
WHERE S_ID BETWEEN 150 AND 160;

--Q8
INSERT INTO SCHEDULE(S_ID, A_ID, S_DATE)
VALUES (1, 1, '2023-03-08');

SELECT * FROM SCHEDULE; 

TRUNCATE TABLE SCHEDULE;

SELECT * FROM SCHEDULE; 
DROP TABLE SCHEDULE;

--Q9
SELECT TRUNC(TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'YEAR') + INTERVAL '1' YEAR AS NEXT_YEAR_START,
       TRUNC(TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'YEAR') + INTERVAL '1' YEAR - INTERVAL '1' DAY AS NEXT_YEAR_END
FROM DUAL;

SELECT TRUNC(TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'MONTH') + INTERVAL '1' MONTH AS NEXT_MONTH_START,
       LAST_DAY(TO_DATE('2022-03-05', 'YYYY-MM-DD') + INTERVAL '1' MONTH) AS NEXT_MONTH_END
FROM DUAL;

SELECT TRUNC(TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'MONTH') - INTERVAL '1' MONTH AS PREV_MONTH_START,
       LAST_DAY(TO_DATE('2022-03-05', 'YYYY-MM-DD')) - INTERVAL '1' DAY AS PREV_MONTH_END
FROM DUAL;

--Q10
CREATE TABLE PARTICIPANTS(
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    SALARY NUMBER(10,2) CHECK (SALARY > 10000)
);
