

-- SQL ASSIGNMENT 1ST PART -- 

 
-- QUES 1
 SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;


-- QUES 2  
SELECT HIRE_DATE, CONCAT(FIRST_NAME,'',LAST_NAME) AS EMPLOYEE_NAME FROM EMPLOYEES;


--   QUES 3 
SELECT concat(FIRST_NAME,'',LAST_NAME,'',JOB_ID) AS EMPLOYEE_TITLE FROM EMPLOYEES;


-- QUES 4 
SELECT HIRE_DATE,DEPARTMENT_ID,FIRST_NAME FROM EMPLOYEES WHERE JOB_ID LIKE '%CLERK%';

-- 5 NUMBER PENDING --

  
-- QUES 6 
 SELECT  CONCAT(FIRST_NAME,'', LAST_NAME) AS FULL_NAME FROM EMPLOYEES WHERE SALARY > 2000;
 
 
 -- QUES 7 
 SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS NAMES,  HIRE_DATE  AS START_DATE FROM EMPLOYEES;
 
 
 -- QUES 8
 SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS NAMES,  HIRE_DATE AS START_DATE  FROM EMPLOYEES   ORDER BY HIRE_DATE;
 
 
 -- QUES 9
 SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS NAMES, SALARY  FROM EMPLOYEES ORDER BY SALARY DESC;
 
 
 -- QUES 10
 SELECT SALARY, CONCAT(FIRST_NAME,'',LAST_NAME) AS FULL_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC;
 
 
 -- QUES 11
 SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
 

 
 -- QUES 12
 SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY NOT IN  (2500,3500,5000) AND
 JOB_ID IN ("SA_REP","ST_CLERK");
 
 
 
 
 
 
 
 
 
 -- **** HR TABLE***** 2ND PART --
 
 
 -- QUES 1
 
SELECT EMPLOYEE_ID, COMMISSION_PCT, max(SALARY), MIN(SALARY), AVG(SALARY) FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL GROUP BY EMPLOYEE_ID;


-- QUES 2
SELECT DEPARTMENT_ID,SUM(SALARY) AS TOTAL_SALARY, SUM(COMMISSION_PCT) AS TOTAL_COMMISSION FROM EMPLOYEES group by DEPARTMENT_ID;


-- QUES 3
SELECT DEPARTMENT_ID , SUM(EMPLOYEE_ID) as total_employees FROM EMPLOYEES group by department_ID;

-- QUES 4
SELECT DEPARTMENT_ID , SUM(salary) as total_salary FROM EMPLOYEES group by department_ID;

-- QUES 5
select first_name , commission_pct from employees where commission_pct is null order by 1;

-- QUES  6
select first_name,
department_id, 
coalesce (commission_pct, 'no commission') as commission 
from employees;

 -- QUES 7
select first_name,
salary,
department_id, 
coalesce (commission_pct * 2, 'no commission') as commission 
from employees;

 
 -- QUES 8
 select e1.first_name, e1.department_id
 from employees e1
 join employees e2
				on e1.department_id = e2.department_id
 where e1. employee_id <> e2. employee_id
 and e1.first_name = e2.first_name;
 
 
 -- QUES 9
 select manager_id, sum(salary) 
 from employees
 group by manager_id;

 
 -- QUES 10
select e1.first_name, e2. department_id, 
count(*) 
from employees e1
join employees e2
				on e1.department_id = e2.department_id
                where e1.employee_id = e2.manager_id
group by e2.manager_id;


-- QUES 11 
select concat(m.first_name,'',m.last_name) as manager_name,
e.first_name as employee_name,
e.department_id, 
e.salary
from employees e
join employees m
			on e.manager_id = m.manager_id
where e.last_name like '_a%'
group by manager_name, employee_name, e.department_id, e.salary; 



-- QUES 12
select department_id, avg(salary) as SALARY_SUMAVG
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;
 

-- QUES 13
 SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
 
 
 -- QUES 14
 SELECT FIRST_NAME,
	CASE 
		WHEN COMMISSION_PCT IS NOT NULL THEN SALARY * 10/100
        ELSE 1
	END AS COMMISSION
    FROM EMPLOYEES;
        
        
        
        
        
        
	
 --   *********** 3RD PART******* --  -- 
 
 
 -- QUES 1 
 
 SELECT 
       concat(
      UPPER(SUBSTRING(LAST_NAME,2,1)), 
      LOWER(SUBSTRING(LAST_NAME,3,5))) AS FORMATING_LAST_NAME
      
      FROM EMPLOYEES;
 
 
 
 -- QUES 2
 
 SELECT  CONCAT(FIRST_NAME,'-',LAST_NAME) AS EMP_FULL_NAME, MONTH(HIRE_DATE) AS JOINED_MONTH FROM EMPLOYEES;
 
 
 
 --  QUES 3
 
 SELECT LAST_NAME,
 CASE SALARY
         WHEN SALARY /2 > 10000 THEN SALARY + SALARY * 10 / 100 + 1500
         ELSE SALARY + SALARY*11.5/100 + 1500
         END AS NEW_SALARY_OF_EMP
         FROM EMPLOYEES;
 
 
 
 -- QUES 4
  select employee_id, concat(substring(employee_id,1,1),'00', 
  replace(substring(employee_id,3,1), 
  substring(employee_id,3,1),'E')) as E_id,
  department_id, salary, first_NAME from employees;
 
 

 -- QUES 5
 
 SELECT 
 CONCAT( 
		UPPER(SUBSTRING(LAST_NAME,1,1)),
		lower(SUBSTRING(LAST_NAME,2,9))) AS EMP_FULL_NAME 
        FROM EMPLOYEES  WHERE FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%' order by LAST_NAME;
        
	
    -- QUES 13	
    
    SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS FULL_NAME, SALARY
    FROM EMPLOYEES 
    ORDER BY SALARY 
    LIMIT 1;
    
    
    -- QUES 6 
    SELECT LAST_NAME, lpad(salary, '15','$') as SALARY
    FROM EMPLOYEES;
    
    
    
    -- QUES 7
    
    SELECT FIRST_NAME 
    FROM EMPLOYEES
    WHERE FIRST_NAME = REVERSE (FIRST_NAME);
        
        
    -- QUES 8
    
    SELECT CONCAT(UPPER(SUBSTRING(FIRST_NAME,1,1)),
    LOWER(SUBSTRING(FIRST_NAME,2,20))) AS F_NAME
    FROM EMPLOYEES; 
    
    
    
    -- QUES 9
    
    SELECT
    substring_INDEX(substring_index(STREET_ADDRESS,'',2),'',-1) AS SUN_NAME
    FROM LOCATIONS;
    
    
    
    
    -- QUES 10
    SELECT 
    LOWER(CONCAT(SUBSTRING(FIRST_NAME,1,1),
    LOWER(LAST_NAME), "@SYSTECHUSA.COM")) AS EMAIL_ADDRESS 
    FROM EMPLOYEES;
    
 
 -- QUES 11
 SELECT FIRST_NAME, LAST_NAME, JOB_ID
 FROM EMPLOYEES
 WHERE JOB_ID =
 (SELECT JOB_ID
 FROM EMPLOYEES
 WHERE FIRST_NAME = 'TRENNA');
 
 
 
 -- QUES 12
 
 SELECT E.FIRST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D ON E. DEPARTMENT_ID = D.DEPARTMENT_ID
 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID WHERE L.CITY in
 (SELECT L2.CITY FROM LOCATIONS L2 JOIN DEPARTMENTS D2 ON L2.LOCATION_ID = D2.LOCATION_ID
 JOIN EMPLOYEES E2 ON E2.DEPARTMENT_ID = D2.DEPARTMENT_ID WHERE E2.FIRST_NAME LIKE 'TRENNA');
 
 
 
   -- QUES 14
   
SELECT FIRST_NAME,
	CASE
		WHEN COMMISSION_PCT IS NOT NULL THEN 
        SALARY * 10/100
	ELSE 1
    END AS COMMISSION
    FROM EMPLOYEES;
    
    
    
    --   *******  4TH PAGE (PART) ****** --
    
-- ques 1

select e.last_name, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

-- ques 2  

SELECT DISTINCT(j.job_title), l.street_address, l.postal_code, l.city, l.country_id, d.department_id
from jobs j
join employees e on j.job_id = e.job_id
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where d.department_id = 40;

-- ques 3 


select e.last_name, d.department_name, d.location_id, l.city
from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id 
	where commission_pct is not null;
    
-- ques 4 



select e.last_name, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where last_name like '%a%';

-- ques 5

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id 
join locations l on d.location_id = l.location_id
     where l.city = 'ATLANTA';
     
-- ques 6 

select m.last_name as manager_name,
m.employee_id as employee_id,
e.last_name as employee_name,
e.manager_id as manager_id
from employees e
join employees m on e.manager_id = m.employee_id;

-- ques 7  
 
SELECT 
    e.last_name AS employee_last_name,
    e.employee_id AS employee_number,
    m.last_name as manager_name,
    COALESCE(m.employee_id, 'No Manager') AS manager_number
FROM employees e
left JOIN employees m ON e.manager_id = m.employee_id;

-- ques 8 

select e.last_name, d.department_id
from employees e
join departments d on e.department_id = d.department_id; 

-- ques 9

select e.first_name, e.last_name, e.job_id, e.salary, d.department_name,
case 
	when salary >= 50000 then 'A'
    when salary >= 30000 then 'B'
else 'C'
end as salary_grade
from employees e
join departments d on e.department_id = d.department_id;

-- ques 10
select
e.last_name as employee_name,
e.manager_id as manager_id,
e.hire_date as emp_hire_date
from employees e
join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;




-- ****** page 6 (PART) ****** 

-- ques 1 

select last_name, hire_date, job_id
from employees
where department_id =
(select department_id
from departments
where department_name = 'Sales');

-- ques 2 

select last_name, employee_id
from employees
where salary >
(select avg(salary)
from employees)
order by salary;

-- ques 3

select last_name, employee_id from employees where last_name like '%u%';

-- ques 4  

select last_name, job_id, department_id
from employees
where department_id =
(select department_id
from departments
where location_id =
(select location_id
from locations
where city = "ATLANTA"));

select e.last_name, e.job_id, e.department_id
from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
where city = 'ATLANTA';

-- ques 5 

select last_name, salary
from employees
where manager_id =
(select employee_id
from employees
where last_name = 'FILLMORE');

-- ques 6 

select last_name, job_id, department_id
from employees
where department_id =
(select department_id
from departments
where department_name = 'OPERATION');

-- ques 7 

select last_name, employee_id, salary
from employees
where salary >
(select avg(salary)
from employees
where concat(first_name, last_name) like '%U%');

 -- ques 8 


-- ques 9

SELECT 
    employee_id,
    salary, department_id,
    CASE
        WHEN department_id IN (10, 30) THEN '5%'
        WHEN department_id = 20 THEN '10%'
        WHEN department_id IN (40, 50) THEN '15%'
        WHEN department_id = 60 THEN 'No raise'
    END AS raise_percentage
FROM employees;	

-- 10 ques
select last_name, salary from employees order by salary desc limit 3;

-- ques 11 

SELECT 
    first_name,
    salary,
    COALESCE(commission_pct, 'O') AS commission
FROM employees;

-- ques 12

select m.first_name, m.last_name, m.salary, e.salary, e.department_id
from employees m
left join employees e on m.employee_id = e.manager_id
order by m.salary desc; -- (problem)--

select concat(first_name,' ', last_name) as full_name, department_id, salary from employees where employee_id in
(select manager_id from employees) order by salary desc limit 3;

    
 
 
 
 
 
 