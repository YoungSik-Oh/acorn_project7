--회원들의 정보가 담긴 테이블
CREATE TABLE user_info(
	userName VARCHAR2(10) NOT NULL,
	userId VARCHAR2(20) PRIMARY KEY,
	userPw VARCHAR2(20) NOT NULL,
	userGender VARCHAR2(4)  NOT NULL,
	userPhone VARCHAR2(15)  NOT NULL, 
	userEmail VARCHAR2(20),
	regdate Date,
	userProfile VARCHAR2(100)
);