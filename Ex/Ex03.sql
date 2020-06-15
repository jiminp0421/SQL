select salary, first_ame
from employees;

/* 그룹함수 */ 

select avg(salary), first_name
from employees;



select *
from employees;

--count 함수

select count(*) --null 포함
from employees;

select count(manager_id) --null 제외
from employees;

select count(*) 
from employees;

select count(commission_pct)
from employees;

select count(*), --전체는 107개
       count(manager_id) --manager id null값 1개 뺀 나머지 특정컬럼의 null값을 제외한 나머지
from employees;
        
--결과 값을 하나로 나타낼 수있다.
select count(*), count(commission_pct), avg(salary)
from employees;
--결과값이 107개 필요해서 오류가 난다
select count(*), count(commission_pct), avg(salary), salary
from employees;

-- salary > 16000인 사람이 몇 명인지 알고 싶다
select *
from employees
where salary > 16000;

select count(*)
from employees
where salary > 16000;

select count(manager_id), count(*)
from employees
where salary > 16000;



select sum(salary)
from employees
where salary > 16000;


select sum(salary), round(avg(salary),0), count(*)
from employees;

--avg() 함수 : 입력된 값들의 평균값을 구하는 함수

select avg(salary)
from employees;

select *
from employees
where salary > 16000;

--manager_id 테스트(논리적x manager id가 숫자라서;) 평균을 구하는데 3으로 나눌건지(null값이있음) 2로 나눌건지 시험!
--> avg() null값에 포함하지 않는다.
select avg(manager_id)
from employees
where salary > 16000;

select *
from employees
where salary > 16000;

select manager_id
from employees
where salary > 16000;

-- 임시결과생성에서 이미 0으로 변경되어있고!!!!!!!!!!!!!!! 중요 select부분에서는 그냥 컬럼만 선택되어진다.
select avg(nvl(manager_id, 0)) --> null 데이터를 0으로 변경 (실제 데이터 변경은 아니고 가상으로 데이터를 바꿨다)
from employees
where salary > 16000;


--max(), min() 함수: 입력된 값들중 가장 큰값, 작은값을 구하는 함수

select max(salary)
from employees;

select min(salary)
from employees;

select max(salary), min(salary), sum(salary)
from employees;

--group by절 논리적으로 생각해보자


select sum(salary), department_id
from employees;


--12개의 그룹이 있다
select sum(salary), department_id
from employees
group by department_id;


select department_id, avg(salary)
from employees
group by department_id
order by department_id asc;


--어느 부서의 어떤일의 어떤 급여의 합인지 몰라..
select sum(salary)
from employees
group by department_id, job_id;

--부서_id의 110번이 두개로 나뉘어졌고 job_id를 통해 어느 부서의 합계인지 알수있게 되었다
select sum(salary),department_id, job_id
from employees
group by department_id, job_id;


--예제 연봉의 합계가 20000 이상인 부서의 부서 번호와, 인원수, 급여합계를 출력하세요

select department_id, count(department_id), sum(salary)
from employees
where salary>=20000
group by salary, department_id;

select sum(salary) --sum(department_id)말고 다른 컬럼명으로 쓰일수있다
from employees
group by department_id;

--그룹함수에 있는 조건절 having
select department_id, count(department_id), sum(salary)
from employees
group by department_id
having sum(salary)>=20000;



select employee_id, 
        first_name,
        job_id,
        salary,
        CASE    when job_id = 'AC_ACCOUNT'  then salary + salary * 0.1
                when job_id = 'SA_REP'      then salary + salary * 0.2
                when job_id = 'ST_CLERK'    then salary + salary * 0.3
                else salary
        END realSalary --*에서 없는 컬럼명이 생길거야
from employees;



select employee_id, 
        first_name,
        job_id,
        salary,
        CASE    when salary >= 20000 then salary
                when salary >= 10000 and salary < 20000 then salary + salary * 0.1
                when salary < 15000 then salary + salary * 0.3
                else salary
        END realSalry
from employees;

--DECODE ==switch case같은 문법 잡 아이디가 acacount와 같으면 salary salary * 0.1 계산하고 어쩌구저쩌구

/*예제 직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 10~50이면 'A-TEAM'
60~100이면 'B-TEAM' 110~150이면 'C-TEAM' 나머지는 '팀없음'으로 출력하세요*/


select *
from employees;

select first_name, 
       department_id,
        CASE    when department_id >= 10 and department_id <=50 then 'A-TEAM'
                when department_id >= 60 and department_id <=100 then 'B-TEAM'
                when department_id >=110 and department_id <=150 then 'C-TEAM'
                else '팀없음'
        END team
from employees
order by team asc;





