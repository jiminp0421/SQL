--문제1번
--평균 급여보다 적은 급여를 받는 직원은 몇명인지 구하시오
select avg(salary)
from employees;

select count(employee_id)
from employees
where salary < (select avg(salary)
                from employees);
               
                
--문제2번

SELECT MAX(SALARY), AVG(SALARY)
FROM EMPLOYEES;

select e.employee_id,
       e.first_name,
       e.salary,
       s.ms,
       s.a_s
from employees e,(SELECT MAX(SALARY) ms, round(AVG(SALARY),0)a_s
                FROM EMPLOYEES)s
where e.salary >= s.a_s and e.salary <= s.ms                
order by salary asc;



--문제3번
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고한다.
select e.department_id,
        e.first_name,
        e.last_name,
       d.department_name
from employees e, departments d
where e.department_id = d.department_id
and first_name = 'Steven'
and last_name = 'King';


select 
       l.location_id,
       l.street_address,
       l.postal_code,
       l.city,
       l.state_province,
       l.country_id
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and first_name = 'Steven'
and last_name = 'King';


--문제4번

select employee_id, first_name, salary, job_id
from employees
where job_id = 'ST_MAN';

select employee_id,
        first_name,
        salary
from employees
where salary < ANY ( select salary
                    from employees
                    where job_id = 'ST_MAN')
order by salary desc;


--문제5번

select department_id, max(salary)
from employees
group by department_id;

select e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
from employees e, (select department_id, max(salary)
                   from employees
                   group by department_id)d 
where e.department_id = d.department_id
order by salary desc;


select employee_id, first_name, salary, department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees 
                                  group by department_id)
order by salary desc;



--문제 6번

--SELECT
--    j.job_title,
--    select_job.sum_salary
--FROM
--    jobs j,
--    (select e.job_id job_id, 
--        sum(e.salary) sum_salary
--        from jobs j, employees e
--        where j.job_id = e.job_id
--        group by e.job_id
--        order by sum(e.salary) desc) select_job
--where
--    j.job_id = select_job.job_id;

SELECT
    j.job_title,
    select_job.sum_salary
FROM
    jobs j,
    (select e.job_id job_id, 
        sum(e.salary)sum_salary
        from jobs j, employees e
        where j.job_id = e.job_id
        group by e.job_id) select_job
where
    j.job_id = select_job.job_id
order by select_job.sum_salary desc;


select sum(salary), job_id
from employees
group by job_id;

select 
from jobs j, employees e
where jobs ;

--문제7번

select department_id, avg(salary)
from employees
group by department_id, salary;

select  e.employee_id,
        e.first_name,
        e.salary
from employees e, (select department_id, avg(salary) salary
                                      from employees
                                      group by department_id) g

where e.department_id = g.department_id and e.salary > g.salary
order by e.employee_id desc;

--문제8번
select  rownum
        employee_id,
        first_name,
        salary,
        hire_date
from employees
order by hire_date asc;
--2단계
select rn,
       employee_id,
       first_name,
       salary,
       hire_date
from   (select  rownum rn,
                       employee_id,
                       first_name,
                       salary,
                       hire_date
        from    (select  
                       employee_id,
                       first_name,
                       salary,
                       hire_date
                 from employees
                 order by hire_date asc))
where rn >= 11 and rn <=15;
