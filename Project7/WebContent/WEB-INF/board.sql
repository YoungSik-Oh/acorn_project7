-- 글 게시판
CREATE TABLE board(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(50),
	title VARCHAR2(100),
	content CLOB,
	regdate DATE
);

-- 방명록 테이블에 글 번호를 생성할 시퀀스
CREATE SEQUENCE board_seq;