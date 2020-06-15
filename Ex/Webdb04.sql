create user webdb identified by webdb;
grant resource, connect to webdb;
drop user webdb cascade;


--책관리 sql 스크립트
drop table book;
drop table author;
drop sequence seq_book_id;
drop sequence seq_author_id;

CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100) 	NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

CREATE TABLE book (
  book_id	 NUMBER(10),
  title	 VARCHAR2(100) 	NOT NULL,
  pubs	 VARCHAR2(100),
  pub_date	 DATE,
  author_id NUMBER(10),
  PRIMARY 	KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
  
);

CREATE TABLE book (
book_id  NUMBER(10),
title   VARCHAR2(100) 	NOT NULL,
pubs    VARCHAR2(100),
pub_date    DATE,
author_id   NUMBER(10),
author_name VARCHAR2(100) 	NOT NULL,
author_desc VARCHAR2(500),
PRIMARY 	KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
);

select  b.book_id,  
        b.title,
        b.pubs,    
        b.pub_date,    
        a.author_id,   
        a.author_name,
        a.author_desc
from author a, book b
WHERE b.author_id = a.author_id;







CREATE SEQUENCE seq_author_id
INCREMENT BY 1 
START WITH 1 ;

CREATE SEQUENCE seq_book_id
INCREMENT BY 1 
START WITH 1 ;


select  author_id, 
        author_name,
        author_desc
from author;

--업데이트
update  author
set     author_desc = '광광울었따'
where   author_id = 5;

--삭제
delete from author
where author_id = 6;



select  book_id, 
        title,
        pubs,
        pub_date,
        author_id
from book;

--업데이트
update  book
set     pubs = '노잼주의'
where   book_id = 6;

--삭제
delete from book
where book_id = 9;


select * from author;
select * from book;

rollback;
commit;


select  b.book_id,  
        b.title,
        b.pubs,    
        b.pub_date,    
        a.author_id,   
        a.author_name,
        a.author_desc
from author a, book b
WHERE b.author_id = a.author_id;

alter table book drop CONSTRAINT c_book_fk;


alter table book add(
    CONSTRAINT c_book_fk FOREIGN KEY (author_id)
    REFERENCES author(author_id)
    ON DELETE CASCADE
);