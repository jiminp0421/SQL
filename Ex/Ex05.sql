--단일행
--결과값을 출력하는게 아니라 이용해야 하기 때문에 필요한 것만 남겨두기 SUB
--'Den'보다 급여가 많은 사람의 이름과 급여는?
SELECT 
        salary
FROM
        employees
WHERE 
        first_name = 'Den';
        

SELECT
        employee_id, first_name,salary
FROM
        employees
WHERE
        salary > 11000;
        
-- SUB QUERY        
    
SELECT
        employee_id,
        first_name,
        salary
FROM    
        employees
WHERE   
        salary > (select salary
                  from employees
                  where first_name = 'Den');
                  
                  
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?

SELECT *
FROM employees
ORDER BY salary asc;

SELECT  first_name,
        salary, 
        employee_id
FROM 
        employees
WHERE 
     salary > (select salary
                from employees
                where first_name = 'TJ');



SELECT
        min(salary)
FROM
        employees;



SELECT 
        first_name,
        salary,
        employee_id
FROM 
        employees
WHERE 
        salary > (select min(salary)
                  from employees);
                  
                  
                  
--평균급여보다 적게 받는 사람의 이름, 급여를 출력하세요

SELECT avg(salary)
FROM employees;


/*SELECT *
FROM employees
where salary <6461;*/

SELECT first_name
        salary
FROM employees
WHERE salary <(SELECT avg(salary)
                     FROM employees);
                     
                     
--평균급여보다 많이 받는 사람의 이름, 급여를 출력하세요                 
                     
SELECT  first_name,
        salary
FROM employees
WHERE salary > (SELECT avg(salary)
                     FROM employees);

        

--다중행 row가 여러줄

--과정1

SELECT *
from employees
where department_id=110;

--과정2

SELECT *
FROM employees
WHERE salary = 12008
or salary = 8300;

SELECT *
FROM employees
WHERE salary in (12008,8300);



SELECT *
FROM employees
WHERE department_id = 110; --- 12008,8300

--과정3

SELECT
        employee_id,
        first_name,
        salary
FROM    
        employees
WHERE
        salary in (select salary
                   from employees
                   where department_id = 110);
                    
--각 부서별로 최고급여를 받는 사원을 출력하세요

-- (100 12008)
-- (30 11000)
-- (90 24000)

select department_id, max(salary)
from employees
group by department_id;


select *
from employees
where (department_id, salary) in((100, 12008), (30,11000));

select employee_id,
        first_name,
        department_id,
        salary
from employees
where (department_id, salary) in (select department_id, max(salary) --비교하는게 같아야한다 department_id, salary
                                  from employees  
                                  group by department_id);
                                  
                                  
--다중행 ANY                                  
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)


select *
from employees
where department_id = 110;

select salary
from employees
where department_id = 110;

select employee_id,
        first_name,
        salary
from employees
where salary > 12008
or salary >8300;


select employee_id,
        first_name,
        salary
from employees
where salary > any(select salary
                  from employees
                  where department_id = 110);
           
                  
--다중행 ALL

select *
from employees
where department_id = 110;

select salary
from employees
where department_id = 110;

select employee_id,
        first_name,
        salary
from employees
where salary > 12008
and salary >8300;


select employee_id,
        first_name,
        salary
from employees
where salary > all(select salary
                  from employees
                  where department_id = 110);
                  

--rownum

--1단계 : 정렬에서 문제발생
select  rownum,
        employee_id,
        first_name,
        salary
from employees
order by salary desc;

--2단계 : 정렬부터하고 rownum을 붙인다
select  employee_id,
        first_name,
        salary
from employees
order by salary desc;

----------------------------------------
--2단계 : 정렬부터하고 rownum을 붙인다 --> rownum 순서해결
select  rownum,
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date
from   (select  employee_id,
                first_name,
                salary,
                hire_date
        from employees
        order by salary desc) e; --e는 employees 줄인별명        
--hire_date를 넣고 싶다면 1번째 뿐만아니라 2번째 select에도 넣어주어야한다
        
--3단계
select  rownum,
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date
from   (select  employee_id,
                first_name,
                salary,
                hire_date
        from employees
        order by salary desc) e   
where rownum <= 5;


select  rownum,
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date
from   (select  employee_id,
                first_name,
                salary,
                hire_date
        from employees
        order by salary desc) e   
where rownum <= 5
and rownum >= 2;
--1부터는 되는데 row값이 2가 될수가 없다! 1234순서대로는 가능 근데 2부터는 불가능

--3단계 (페이지 만드는 기술)
select w.rn,
       w.employee_id,
       w.first_name,
       w.salary,
       w.hire_date
from    (select  rownum rn,
                 e.employee_id,
                 e.first_name,
                 e.salary,
                 e.hire_date
         from   (select  employee_id,
                         first_name,
                         salary,
                         hire_date
                 from employees
                 order by salary desc) e
         )w
where rn <= 5
and rn >= 3;



--07년에 입사한 직원중 급여가 가장 많은 직원중 3에서 7등의 이름 급여 입사일은?
--rownum 넣으니까 뒤죽박죽됨
select 
    rownum
    employee_id,
    first_name,
    salary,
    hire_date
from employees
where hire_date <= '07/12/31'
and hire_date >= '07/01/01'
order by salary desc;
  
--2단계
select  rownum,
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date
from (select 
            first_name,
            salary,
            hire_date
            from employees
            where hire_date <= '07/12/31'
            and hire_date >= '07/01/01'
            order by salary desc) e;
            
--3단계
select  rownum,
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date
from (select 
            first_name,
            salary,
            hire_date
            from employees
            where hire_date <= '07/12/31'
            and hire_date >= '07/01/01'
            order by salary desc) e
where rownum <= 7
  and rownum >=3;

--4단계
select  w.rn,
        w.employee_id,
        w.first_name,
        w.salary,
        w.hire_date
from    (select     rownum rn,
                    e.employee_id,
                    e.first_name,
                    e.salary,
                    e.hire_date
         from (select       employee_id,
                            first_name,
                            salary,
                            hire_date
                   from employees
                   where hire_date <= '07/12/31'
                   and hire_date >= '07/01/01'
                   order by salary desc) e
         )w
where rn <= 7
  and rn >=3;