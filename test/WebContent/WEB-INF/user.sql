--회원들의 정보가 담긴 테이블
CREATE TABLE user_info(
	userNum NUMBER PRIMARY KEY,
	userName VARCHAR2(10) NOT NULL,
	userId VARCHAR2(20) NOT NULL,
	userPw NUMBER NOT NULL,
	userGender VARCHAR2(4),
	userPhone VARCHAR2(15), 
	userEmail VARCHAR2(20)
);
--회원 가입시 회원 번호를 생성할 시퀀스
CREATE SEQUENCE user_info_seq;

