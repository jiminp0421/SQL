
insert into authora
values (1, '이문열', '경북 영양');

insert into authora
values (2, '박경리', '경상남도 통영');

insert into authora
values (3, '유시민', '17대 국회의원');

insert into authora
values (4, '기안84', '기안동에서 산 84년생');

insert into authora
values (5, '강풀', '온라인 만화가 1세대');

insert into authora
values (6, '김영하', '알쓸신잡');




create table booka(
    booka_id    number(10),
    title       varchar2(100) not null,
    pubs        varchar2(50),
    pub_date    date,
    authora_id  number(10),
    PRIMARY KEY(booka_id),
    CONSTRAINT c_booka_fk foreign key(authora_id)
    REFERENCES authora(authora_id) 
);

insert into booka
values (1, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into booka
values (2, '삼국지', '민음사', '2002-03-01', 1);

insert into booka
values (3, '토지', '다림', '1998-02-22', 2);

insert into booka
values (4, '유시민의 글쓰기 특강', '생각의길', '2015-04-01',3);

insert into booka
values (5, '패션왕', '중앙북스(books)', '2012-02-22',4);

insert into booka
values (6, '순정만화', '재미주의', '2011-08-03',5);

insert into booka
values (7, '오직두사람', '문학동네', '2017-05-04',6);

insert into booka
values (8, '26년', '재미주의', '2012-02-04',5);



--시퀀스 넣어주기
create sequence seq_booka_id
increment by 1
start with 1;

create sequence seq_authora_id
increment by 1
start with 1;



select * from booka;
select * from authora;
drop table booka;

select *
from booka b, authora a
where b.authora_id = a.authora_id;


update authora
set authora_desc = '서울특별시'
where authora_id =5;

delete from authora
where authora_id = 4;

insert into booka
values (seq_booka_id.nextval, '이문열', '삼국지 작가', '2020-06-12', 2);

delete from booka
where authora_id = 
    (select authora_id
    from authora
    where authora_name = '기안84');

delete from authora
where authora_name = '기안84';
