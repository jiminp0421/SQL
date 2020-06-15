--계정 전체 테이블 보기
select * from tabs;

--테이블 생성
create table book(
    book_id     number(5),
    title       varchar2(50),
    author      varchar2(10),
    pub_date    date
);



--컬럼 추가 

alter table book add (
    pubs    VARCHAR2(50)
);

--컬럼수정
alter table book modify (
    title   varchar2(100)
);
alter table book rename column title to subject;

--컬럼삭제

alter table book drop (author);

--테이블 명 수정
rename book to article;

--테이블 삭제
--drop table article;