SELECT * FROM departments; --27개


SELECT * FROM employees; --107개


--107개가 나와야하는데 2889가 나왔다
SELECT count(*)
FROM employees, departments;

SELECT * FROM employees; --107
SELECT * FROM departments; --27

SELECT employees.employee_id, 
       employees.first_name, 
       employees.department_id, --컬럼 이름이 똑같아서 오류가 난다 그래서 em이랑 de로 이름을 나눠줬더니 오류가 풀렸다
       departments.department_id,
       departments.department_name
FROM employees, departments; --테이블엔 as를 쓰면 오류가 난다

--department_id가 같기 때문에 하나는 department_id가 나오고 다른 하나는 department_id_1이 나와서 컬럼에 별명을 붙여주었다.
SELECT em.employee_id, 
       em.first_name, 
       em.department_id edid, --반드시 테이블명(별명) 
       de.department_id did,
       de.department_name
FROM employees em, departments de; --경우의수를 다 가져와서 2889가 나옴 107*27


SELECT em.employee_id, 
       em.first_name, 
       em.department_id edid,
       de.department_id did,
       de.department_name
FROM employees em, departments de
WHERE em.department_id = de.department_id; --두개가 같은 데이터만 가져와라 employees는 107갠데 106개가 나왔다 이유는 employees테이블에 부서가 없는 사람(null)이 있기 때문에 제외시켜버렸다

--직원을 기준으로 다시 뽑아줘 (null값도 포함시켜)
SELECT  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
FROM employees e left outer join departments d
on e.department_id = d.department_id;




SELECT count(*)
FROM employees, jobs;

SELECT first_name, job_title
FROM   employees, jobs;

SELECT  em.employee_id,
        em.first_name,
        em.job_id,
        jo.job_id,
        jo.job_title
FROM employees em, jobs jo
WHERE em.job_id = jo.job_id;

--모든 직원이름, 부서이름, 업무명을 출력하세요
SELECT *
FROM employees, departments, jobs; -- 경우의 수 54891 = 107*27*19

SELECT * FROM employees; --107
SELECT * FROM jobs; --19
SELECT * FROM departments; --27

select  e.employee_id,
        e.first_name,
        e.department_id, --확인용
        d.department_id, --확인용
        d.department_name,
        e.job_id, --확인용
        j.job_id, --확인용
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;


--내가 한것
SELECT  em.employee_id,
        em.first_name,
        em.job_id,
        jo.job_id,
        jo.job_title,
        em.department_id,
        de.department_id,
        de.department_name
FROM employees em, jobs jo, departments de
WHERE de.department_id =em.department_id
and em.job_id = jo.job_id; --and를 안써줬다.





select count(*) 
from employees, departments;

select count(*)
from departments;


select  em.first_name,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id;


--모든 직원이름, 업무명 출력 직원이름 employees, jobs
select count(*)
from employees, jobs; --2033


select  em.first_name,
        em.job_id,
        jo.job_id,
        jo.job_title
from employees em, jobs jo --별명 지어주기
where em.job_id = jo.job_id; --fk와 pk찾기 찾고싶은 컬럼명과 pk,fk를 select에 쓰기

--모든 직원이름, 부서이름, 업무명을 출력 employees, departments, jobs

select count(*) --54891
from employees, departments, jobs;

select count(*) --107
from employees;

select count(*) --27
from departments;

select count(*) --19
from jobs;

select count(*) --54891 =107*27*19
from employees, departments, jobs;


select  e.first_name ,
        e.department_id,
        e.job_id,
        d.department_id,
        d.department_name,
        j.job_id,
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;



--right outer join ~ on
select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;


select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id,
        d.department_name 
from departments d left outer join employees e
on e.department_id = d.department_id;



--self join

SELECT  emp.employee_id,
        emp.first_name,
        emp.salary,
        emp.manager_id,
        man.employee_id,
        man.first_name,
        man.salary
FROM employees emp, employees man
where emp.manager_id = man.employee_id;

---------------------------------------------------------ppt맨마지막장
select salary
from employees;

select location_id
from locations;


select * 
from employees e, locations i
where e.salary = i.location_id;