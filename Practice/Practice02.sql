--문제 1번

select count(manager_id) as "haveMngCnt"
from employees;


--문제 2번

select  max(salary) "최고임금",
        min(salary) "최저임금",
        (max(salary)-min(salary)) "최고임금 - 최저임금"
from employees;

--문제 3번

select to_char(max(hire_date), 'YYYY"년"MM"월"DD"일"')
from employees;

--문제 4번

select *
from employees;

select round(avg(salary),0), max(salary), min(salary),department_id
from employees
group by department_id
order by department_id desc;

--문제 5번

select *
from jobs;


select  
        round(avg(salary),0),
        max(salary),
        min(salary),
        job_id
from    
        employees
group by job_id
order by min(salary) desc, round(avg(salary),0) asc;

--문제6번

select to_char(min(hire_date), 'YYYY-MM-DD DAY')
from employees;

--문제7번

select 
        department_id "부서",
        round(avg(salary),0) "평균임금",
        round(min(salary),0) "최저임금",
        avg(salary)-min(salary)
from employees
group by department_id 
--having department_id(avg(salary)-min(salary)) >2000
order by avg(salary) - min(salary) desc;

--문제8번

select
    job_id,
    max(max_salary) - min(min_salary)
from
    jobs
group by job_id
order by max(max_salary)-min(min_salary) desc;


--문제9번

select 
        manager_id,
        round(avg(salary),0),
        min(salary),
        max(salary)
from employees
where hire_date > '2005.12.31' and manager_id is not null
group by manager_id
having round(avg(salary),0) >=5000 
order by round(avg(salary),0), min(salary) desc;

--문제10

select hire_date,
        CASE
            when hire_date <= '02/12/31' then '창립멤버'
            when hire_date >= '03/01/01' and hire_date <= '03/12/31' then '03년 입사'
            when hire_date >= '04/01/01' and hire_date <= '04/12/31' then '04년 입사'
            else '상장이후입사'
        END optDate
from employees
order by hire_date asc;

