--회원들의 정보가 담긴 테이블
CREATE TABLE user_info(
	userName VARCHAR2(10) NOT NULL, -- 유저 이름
	userId VARCHAR2(20) PRIMARY KEY, -- 유저 아이디
	userPw VARCHAR2(20) NOT NULL, -- 유저 비밀번호
	userGender VARCHAR2(4)  NOT NULL, -- 유저 성별
	userPhone VARCHAR2(15)  NOT NULL,  -- 유저 번호
	userEmail VARCHAR2(20), -- 유저 이메일
	regdate Date, -- 유저 회원가입 일 
	userProfile VARCHAR2(100) -- 유저 프로필 사진
);