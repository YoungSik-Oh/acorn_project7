CREATE TABLE store(
   snum NUMBER PRIMARY KEY,
   --titlepic VARCHAR2(100) NOT NULL,  --임시 생각중 (가게 썸네일용)
   sname VARCHAR2(20) NOT NULL,    --가게이름
   saddr VARCHAR2(100) NOT NULL,    --가게주소
   sphone VARCHAR2(50) NOT NULL,    --가게번호
   stmenu VARCHAR2(50) NOT NULL,     --음식 종류
   sprice VARCHAR2(100) NOT NULL,   -- 가격대
   stime VARCHAR2(50) NOT NULL,   --운영시간
   sbtime VARCHAR2(50) NOT NULL,   -- 휴식 시간
   slorder VARCHAR2(50) NOT NULL,   --마지막 오더시간
   srday VARCHAR2(10) NOT NULL,   --휴일
   contents CLOB NOT NULL,
   smenu VARCHAR2(20) NOT NULL, -- 가게 음식 메뉴
   udate DATE      --업데이트 날짜
);

CREATE SEQUENCE store_seq;