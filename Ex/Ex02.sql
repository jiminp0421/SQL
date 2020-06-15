--단일행 함수

--문자열 함수

--initcap() 첫 글자만 대문자로
select email, initcap(email)
from employees;

--한줄만 표현이 아니라 row갯수만큼 반복 
select  initcap('aaaaa')
from    dual; --dual은 가상테이블 대충 어떻게나오나 시험해보고싶을때

--employees테이블에서 department_id = 100; 부서 아이디가 100인 것중 email, initca(email) (email표기법 2개) 부서아이디를 출력하시오
select email, initcap(email), department_id
from employees
where department_id = 100;


--LOWER(컬럼명)/UPPER(컬럼명) 소문자/대문자로 바꿔준다
select lower('ABCD'), upper('aHAhahahAHaaaaa')
from dual;


select first_name, lower(first_name), upper(first_name)
from  employees
where department_id = 100;

--SUBSTR(컬럼명, 시작위치, 글자수)
select substr('abcdefg', 3, 3), substr('abcdefg', -3, 3)
from dual;

select  first_name, substr(first_name, 1, 3),
        substr(first_name, -3,2)
from    employees
where   department_id = 100;

--LPAD(컬럼명, 자리수, '채움문자') /RPAD(컬럼명, 자리수, '채울문자')
select  first_name,
        lpad(first_name, 10, '*^') --왼쪽에서 *을 채운다
from employees; 

select  first_name,
        rpad(first_name, 10, '*') --왼쪽에서 *을 채운다
from employees;

--REPLACE(컬럼명, 문자1, 문자2) --문자1을 문자2로 바꿔치기한다
select first_name,
       replace(first_name, 'a', '*') 
from employees
where department_id = 100;

select first_name,
       replace(first_name, 'a', '*'), 
       substr(first_name, 2, 3),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100; 

--TRIM (헷갈리니 찾아볼것)
select ltrim('     aaaa     ') || '------',
       rtrim('     aaaa     ') || '------',
       trim('     aaaa     ') || '------'
from dual;

---------------------------------------------------------------------
--숫자함수
--ROUND(숫자, 출력을 원하는 자리수) ""가 없으면 별명 r2를 R2로 반영 ""가 붙으면 r2를 그대로 반영
select round(123.346, 2) r2,
       round(123.956, 0) as "r0",
       round(123.456, -1) as "r-1"
from dual; 

--TRUNC(숫자, 출력을 원하는 자리수) 반올림 안하고 소숫점 둘째 이후엔 다 버림
select trunc(123.346, 2) as "r2",
       trunc(123.956, 0) as "r2"
from dual;

--날짜함수 가상의 컬럼이기때문에 어느테이블이건 나온다 가상의 컬럼, 가상의 데이터
select sysdate, first_name
from employees;

--날짜함수 MONTH_BETWEEN(d1, d2)
select sysdate,
       hire_date,
        months_between(sysdate, hire_date)
from employees
where department_id = 110;


--변환함수 TO_CHAR(n,fnt) 헷갈리니까 해볼것
select  first_name,
        salary,
        to_char(salary * 12, '$999,999'),
        to_char(salary * 12, '$999999.99'),
        to_char(salary * 12, '$99999')
from employees
where department_id = 110;

--왜 결과가 2개가 나올까?? 순서표 찾아보기
select first_name, to_char(9876, '99999')
from employees
where department_id = 110;


select to_char(9876, '9999')
from dual;
select to_char(9876, '999') --오류뜬다 4글자를 3글자로 바꿀순 없으니까
from dual;

select to_char(9876, '999999'),
       to_char(9876, '09999'),
       to_char(9876, '$9999'),
       to_char(9876, '9999.99'),
       to_char(9876, '99,999')
from dual;

--TO_CHAR(n, fmt)
select sysdate, 
        to_char(sysdate, 'YYYY-MM') --/로 표시하고 싶으면 -제거하고 /로 바꾸면 된다
from dual;

select sysdate, 
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select  first_name,  
        commission_pct, --null 아니면 0
        nvl(commission_pct, 0), --null값을 0으로 바꿔줘라
        salary * commission_pct,
        salary * nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;

