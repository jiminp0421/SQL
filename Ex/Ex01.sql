select * from employees;

select * from departments;

select employee_id, first_name, last_name from employees;

-- 사원의 이름과 전호번호 입사일 연봉을 출력하세요 (한줄주석)
select first_name, phone_number, hire_date, salary from employees;

/* 사원의 이름과 성, 급여, 전화번호, 이메일, 입사일을 출력하세요 컬럼명이 많을경우 세로로 표기한다*/
select first_name, 
       last_name, 
       phone_number, 
       email, 
       hire_date 
from   employees; --테이블순서와 상관없이 내가 나열한 순서대로 나온다.

--select 문 별명
select employee_id as empNo, 
       first_name "E-name", 
       salary as "급여"
from   employees;

--사원의 이름(first_name)과 전화번호 입사일 급여로 표기되도록 출력하세요

select  first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from    employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표기되도록 출력하세요

select  first_name as 이름,
        last_name as "성",
        salary as 급여,
        phone_number as "전화번호",
        email as "이메일",
        hire_date as "입사일"
from    employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기

--두칸으로 나눠져있다 
select first_name, last_name  
from employees;

--두개의 데이터를 하나로 보고싶다 두개를 합쳤다.
select first_name || last_name
from employees;

--알아보기 쉽게 공백을 넣고싶다.
select first_name || ' ' || last_name
from employees;

--문장을 추가하고싶다.
select first_name || ' hire date is ' || hire_date
from employees;

--select문 별명을 바꾸고 싶다.
select first_name || ' hire date is ' || hire_date as "emp_info"
from employees;

--따옴표를 쓰고 싶다
select first_name || ' "hire date is" ' || hire_date
from employees;

--홑따옴표 쓰기
select first_name || ' ''hire date is'' ' || hire_date
from employees;

--산술 연산자 사용하기
select first_name, salary
from employees;

--급여를 연봉으로 바꾸기
select first_name, salary*12
from employees;

--급여도 보고싶고 연봉도 보고싶다
select first_name, salary, salary*12
from employees;

--급여를 세번 보고싶다
select first_name, salary, salary, salary
from employees;

--수식이 가능하다
select first_name, salary, salary*12, (salary+300)*12, salary/30 --한달동안 일할때 하루에 얼마받는지 알고싶다
from employees;

--job_id가 숫자가 아니기 때문에 에러가 난다 문자열은 산술연산 안됌
select job_id*12
from employees;

select  first_name|| '-' ||last_name as fullname,
        salary as "급여",
        salary*12 as "연봉",
        salary*12+500 as "연봉2",
        phone_number as "전화번호"
from employees;

select  first_name
from    employees
where   department_id =10; -- =같다 자바랑 다르다

--연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary >= 15000;

--where first_name = Lex; 쳤는데 오류가 나온다 lex에 ''를 붙여서 오류를 없앴다.
select salary
from employees
where first_name = 'Lex';

--07/01/01일 이후에 입사한 사원들의 이름과 입사일을 출력하세요.
select first_name, hire_date
from employees
where hire_date >= '07/01/01';

--연봉이 14000이하이거나 17000이상인 사원의 이름과 연봉을 출력하세요 이거나니까 or
--select문 where 절 조건 여러개 (동시에 만족해야할때 and연산자 사용)
select first_name, salary --colum갯수 결정
from employees
where salary <= 14000 --row 갯수결정
or salary >= 17000; 

--연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하시오 (between 연산자 사용)
select first_name, salary
from employees
where salary between 14000 and 17000;

--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요 에서니까 and (에서=부터)
select first_name, hire_date 
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';
--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요 (between 연산자 사용)
select first_name, hire_date 
from employees
where hire_date between '04/01/01' and '05/12/31';

-- in 연사자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--안에 데이터들은 꼭 대소문자가 맞아야한다
select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'lex'
or first_name = 'John';


--연봉이 2100,3100,4100,5100인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select first_name, salary
from employees
where salary in (2100,3100,4100,5100);

--Like 연산자로 비슷한것들 모두 찾기
select first_name, last_name, salary
from employees
where first_name like 'L%';

--_(언더바)L로시작하는 글자자리수가 맞는 사람 언더바가 3개면 L로시작하고 뒷자리가 3개가 나오는 사람 ex) Lisa, Luis
select first_name, last_name, salary
from employees
where first_name like 'L___';

--이름에 am을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';

--이름에 두번째 글자가 a인 사원의 이름과 연봉을 출력하세요 '_a'를 쓰면 이름이 두글자고 마지막 글자가a인사람이다
select first_name, salary
from employees
where first_name like '_a%';

--이름에 네번째 글자가 a인 사원의 이름과 연봉을 출력하세요 '___a'면 이름이4글자이고 마지막 글자가 a인사람이다 ex)Lisa
select first_name, salary
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_';

--NULL michael의 commission_pct가 0이 아닌 이유는 데이터가 들어가지 않았기 때문이다.
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요 커미션 퍼센트가 널인 아이들만 가져와라
select first_name, salary, commission_pct, salary*commission_pct
from employees
where commission_pct is not null; -- is not null은 null이 없는것 is null은 있는것

--담당매니저가 없고 커미션 비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null 
and commission_pct is null;

--salary 정렬
select first_name, salary
from employees
where salary >=9000
order by salary desc, first_name asc; --큰거부터 작은거 asc는 작은거부터 큰거 salary가 동률일때 이름으로 비교 abcdefg...

부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요 --where은 조건이기때문에 있을수도 있고 없을수도 있다
select department_id, salary, first_name
from employees
order by department_id asc;

급여가 1000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 1000
order by salary desc; 

부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id, salary, first_name
from employees
order by department_id asc, salary desc;



