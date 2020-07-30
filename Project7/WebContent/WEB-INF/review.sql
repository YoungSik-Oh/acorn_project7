
CREATE TABLE review(
	r_num NUMBER PRIMARY KEY, -- 리뷰 글 번호
	r_writer VARCHAR2(20), -- 리뷰 작성자
	r_content CLOB, -- 리뷰 내용
	r_imagePath VARCHAR2(150), -- 리뷰 이미지
 	r_regdate DATE -- 리뷰 등록일
);

CREATE SEQUENCE review_seq; -- 리뷰 테이블 번호 == 리뷰 글번호



--리뷰 테이블 이렇게 만들었음.