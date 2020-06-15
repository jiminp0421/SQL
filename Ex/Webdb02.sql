--작가 테이블 생성
create table author(
    author_id   number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    PRIMARY KEY(author_id)
);


--북 테이블 생성
create table book(
    book_id     number(10),
    title       varchar2(100) not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    PRIMARY KEY(book_id),
    CONSTRAINT c_book_fk foreign key(author_id) -- 본인 테이블의 author_id 두줄이 한 명령어다.
    REFERENCES author(author_id) --author 테이블의 author_id
);


--작가 데이터 추가
insert into author
values (1, '박경리', '토지 작가');


insert into author(author_id, author_name)
values(2, '이문열');

insert into author
values(3, '기안84', '');

--작가 데이터 수정(줄을 수정)
update  author
set     author_name = '기안85', 
        author_desc = '웹툰작가'
where   author_id = 3; --정말정말정말정말정말 중요하다 이걸 안써주면 모든 데이터가 똑같이 바뀌어버림



--작가 데이터 삭제 
delete from author;
where author_id = 1;



--마지막 번호가 뭐니? sequence 은행번호표같은느낌(안겹치게 번호줌)
create sequence seq_author_id
increment by 1
start with 1;


--작가정보 추가 --물어보기
insert into author
values (seq_author_id.nextval, '박경리', '토지 작가');

insert into author(author_id, author_name)
values (2,'이문열');
--seq_author_id가 2번에 들어가야하는데 이미 누가 2번을 넣어버렸음 오류가 뜬다 또 건드리면 3번을 알아서 부여해줌.
insert into author
values (seq_author_id.nextval, '이문열', '삼국지 작가');

select * from author;

--시퀀스 명령어
select * from user_sequences; --시퀀스들의 정보를 볼 수 있다
--현재 시퀀스 조회
select seq_author_id.currval --currval은 현재 몇번이냐
from dual;
--다음 시퀀스 조회
select seq_author_id.nextval 
from dual;
--시퀀스 삭제
drop sequence seq_author_id;

--sysdate 사용예제
insert into book
values(1, '첫번째 글입니다', '본문내용이.', sysdate, 1);


select book_id, title, pubs, pub_date, b.author_id, a.author_name
from book b, author a
where b.author_id = a.author_id;



select * from author;





--작가 테이블 생성 author2
create table author2(
    author2_id   number(10),
    author2_name varchar2(100) not null,
    author2_desc varchar2(500),
    PRIMARY KEY(author2_id)
);
select * from author2;

--작가 테이블 생성 book2
create table book2(
    book2_id    number(10),
    title       varchar2(100) not null,
    pubs        varchar2(50),
    pub_date    date,
    authora_id  number(10),
    PRIMARY KEY(book2_id),
    CONSTRAINT c_book2_fk foreign key(authora_id)
    REFERENCES author2(author2_id) 
);
select * from book2;
drop table book2;