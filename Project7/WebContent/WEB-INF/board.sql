-- 글 게시판
CREATE TABLE board(
	num NUMBER PRIMRARY KEY , -- 게시판 번호
	writer VARCHAR2(50)  NOT NULL, -- 
	title VARCHAR2(100)  NOT NULL,
	content CLOB  NOT NULL,
	regdate DATE
);

-- 방명록 테이블에 글 번호를 생성할 시퀀스
CREATE SEQUENCE board_seq;