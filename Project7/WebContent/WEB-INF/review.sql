
CREATE TABLE review(
	r_num NUMBER PRIMARY KEY,
	r_writer VARCHAR2(20),
	r_content CLOB,
	r_imagePath VARCHAR2(150),
	r_regdate DATE
);

CREATE SEQUENCE review_seq;



--리뷰 테이블 이렇게 만들었음.