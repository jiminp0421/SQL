--책관리 sql 스크립트
drop table book;
drop table author;
drop sequence seq_book_id;
drop sequence seq_author_id;

--작가테이블 생성
CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100) 	NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

--북테이블 생성
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

--작가 시퀀스
CREATE SEQUENCE seq_author_id
INCREMENT BY 1 
START WITH 1 ;

--책 시퀀스
CREATE SEQUENCE seq_book_id
INCREMENT BY 1 
START WITH 1 ;




--작가 테이터 입력
INSERT INTO author VALUES (seq_author_id.nextval, '이문열', '경북 영양' );
INSERT INTO author VALUES (seq_author_id.nextval, '박경리', '경상남도 통영' );
INSERT INTO author VALUES (seq_author_id.nextval, '유시민', '17대 국회의원' );
INSERT INTO author VALUES (seq_author_id.nextval, '기안84', '기안동에서 산 84년생' );
INSERT INTO author VALUES (seq_author_id.nextval, '강풀', '온라인 만화가 1세대' );
INSERT INTO author VALUES (seq_author_id.nextval, '김영하', '알쓸신잡' );
--commit을 안하면 가상의상태이다.(실제로 반영이안되어있다) 그래서 java에서 진행을 다른사람이 못 쓰게 잠궈놓은상태
--북 데이터 입력
INSERT INTO book VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1 );
INSERT INTO book VALUES (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1 );
INSERT INTO book VALUES (seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2 );
INSERT INTO book VALUES (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3 );
INSERT INTO book VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4 );
INSERT INTO book VALUES (seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5 );
INSERT INTO book VALUES (seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6 );
INSERT INTO book VALUES (seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5 );

--커밋
commit;

select * from book;
select * from author;

--전체리스트 보기 join
select b.book_id, b.title, b.pubs, b.pub_date, a.author_id, a.author_name, a.author_desc
from book b, author a
where b.author_id = a.author_id;