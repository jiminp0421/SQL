--문제1번
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM
    employees e, departments d
WHERE 
    e.department_id = d.department_id
ORDER BY d.department_id asc, e.employee_id desc;

--문제2번

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.department_id,
    e.job_id,
    d.department_id,
    d.department_name,
    j.job_id,
    j.job_title
FROM
    employees e, jobs j, departments d
WHERE e.department_id = d.department_id
and e.job_id = j.job_id
ORDER BY employee_id asc;

--문제 2-1 다시 풀기

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.department_id,
    e.job_id,
    d.department_id,
    d.department_name,
    j.job_id,
    j.job_title
FROM
    jobs j, employees e, departments d
WHERE e.department_id = d.department_id
and e.job_id = j.job_id
ORDER BY employee_id asc;


SELECT
FROM
WHERE


--문제3

SELECT
    l.location_id,
    l.city,
    d.location_id,
    d.department_name,
    d.department_id
FROM 
    locations l, departments d
WHERE 
    l.location_id = d.location_id
ORDER BY l.location_id asc;

SELECT
    l.location_id,
    l.city,
    d.location_id,
    d.department_name,
    d.department_id
FROM 
    locations l, departments d
WHERE 
    l.location_id = d.location_id
ORDER BY l.location_id asc;


--문제3-1번

SELECT
    l.location_id,
    l.city,
    d.location_id,
    d.department_name,
    d.department_id
FROM 
    locations l left outer join departments d
on 
    l.location_id = d.location_id
ORDER BY l.location_id asc;

--문제4번


SELECT
    r.region_name,
    r.region_id,
    c.country_name,
    c.region_id
FROM
    regions r, countries c
WHERE 
    r.region_id = c.region_id
ORDER BY
    r.region_id asc, c.region_id desc;

--문제5번 다시풀기 자신의 매너보다 채용일이 빠른사원의 에서 막힘

select *
from employees;


SELECT emp.employee_id,
       emp.first_name,
       emp.hire_date "employees",
       man.first_name "managerName",
       man.hire_date "managerDate"
FROM 
    employees emp, employees man
WHERE 
    emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;



--문제6번

SELECT c.country_name,
       c.country_id,
       l.city,
       l.location_id,
       d.department_name,
       d.department_id
FROM
    countries c, departments d, locations l
WHERE
    d.location_id = l.location_id 
and l.country_id = c.country_id
ORDER BY country_name asc;




--문제7번 문제를 이해 못함
SELECT
    CASE e.job_id = 'AC_ACCOUNT' then employee_id,
    CASE e.job_id = 'AC_ACCOUNT' then first_name || last_name,
    CASE e.job_id = 'AC_ACCOUNT' then job_id,
    CASE j.job_id = 'AC_ACCOUNT' then start_day,
    CASE j.job_id = 'AC_ACCOUNT' then end_day,
END "realName"
FROM
    job_history j, employees e
WHERE j.employees_id = e.employees_id;


-- 재학이가 푼 문제
SELECT
    e.employee_id,
    e.first_name || e.last_name 이름,
    e.employee_id,
    j.start_date,
    j.end_date
FROM
    job_history j, employees e
where
    j.job_id = e.job_id and j.job_id = 'AC_ACCOUNT';
    
    

--문제 8번 못풀었음

select *
from employees;

SELECT 
       --emp.employee_id,
       --emp.first_name,
       --emp.manager_id,
       --man.first_name manager,
       d.department_id,
       d.department_name,
       e.first_name, --추가
       l.city,
       c.country_name,
       r.region_name
FROM departments d, employees e, locations l, countries c, regions r, --employees emp, employees man
WHERE
    d.manager_id = e.manager_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id;

SELECT
    emp.employee_id,
    emp.first_name,
    emp.manager_id,
    man.first_name manager
FROM
    employees emp, employees man
WHERE 
    emp.manager_id = man.employee_id;
    

--각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
--매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.

SELECT
    d.department_id, d.department_name, e.first_name, l.city, c.country_name, r.region_name
FROM
    departments d, employees e, locations l, countries c, regions r
where
    d.manager_id = e.employee_id and d.location_id = l.location_id and l.country_id = c.country_id and c.region_id = r.region_id;
    
    
--문제9번

SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    e.first_name
FROM
    employees e left outer join departments d
on
    d.manager_id = e.employee_id;
    
    
    
SELECT
    e.employee_id, e.first_name, d.department_name, man.first_name
FROM
    employees e, departments d, employees man
where
    e.department_id = d.department_id(+) and e.manager_id = man.employee_id;
    


