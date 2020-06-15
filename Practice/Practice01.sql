--문제1

SELECT  first_name || last_name 이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
FROM 
        employees
ORDER BY 
        hire_date asc;


--문제2

SELECT
     job_title 업무명,
     max_salary 최고월급
FROM jobs
ORDER BY 
    max_salary desc;
    
--문제3

SELECT 
    first_name || last_name,
    manager_id,
    commission_pct,
    salary
FROM employees
WHERE   
    manager_id is not null 
and commission_pct is null
and salary > 3000;

--문제4

SELECT
    job_title,
    max_salary
FROM 
    jobs
WHERE 
    max_salary >= 10000
ORDER BY
    max_salary desc;
    
--문제5


SELECT  first_name,
        salary,
        nvl(commission_pct, 0)
FROM
        employees
WHERE 
    salary between 10000 and 14000
ORDER BY 
    first_name, salary desc;
    

--문제6

SELECT  first_name || last_name,
        salary,
        to_char(hire_date, 'YYYY-MM'), hire_date,
        department_id
FROM
        employees
WHERE
        department_id in (10,90,100);
        
--문제7

SELECT
        first_name,
        salary
FROM    
        employees
WHERE
        first_name like 'S%' 
or      first_name like 's%';

--문제8

SELECT 
        department_name
FROM 
        departments
ORDER BY
        length(department_name) desc;
        
--문제9

SELECT 
        upper(country_name),
        country_name
FROM
        countries
ORDER BY
        upper(country_name) asc;
        
--문제10

SELECT
        first_name||last_name,
        salary,
        replace(phone_number, '.', '-'), 
        phone_number,
        hire_date
FROM
        employees
WHERE 
        hire_date <= '03/12/31';