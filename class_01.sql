
-- 데이터 집합 생성(DB) 생성
CREATE DATABASE db_tenco_market;
-- 어떤 데이터 베이스를 사용할지 선택
USE db_tenco_market;
-- 데이터 집학 삭제
DROP DATABASE db_tenco_market;
 
-- 대소문자 주의
-- 키워드(SELECT, CREATE) 등 컬럼명은 대소문자를 구분하지 않는다.
-- !주의! 데이터베이스명과 테이블명은 운영체제에 대소문자를 구분할 수 있음
-- Window(구분X) / Linux(구별O)
-- 따라서 만들 때 지정한 이름을 그대로 사용하는 습관을 권장

-- 실습 코드 1 (테이블 설계하기)
CREATE TABLE userTBL(
	userName VARCHAR(10) NOT NULL PRIMARY KEY,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile VARCHAR(12)
);
SHOW TABLES;
DESC userTBL;

CREATE TABLE buyTBL (
	userName VARCHAR(3) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (userName) REFERENCES userTBL(userName)
);

SHOW TABLES;
DESC userTBL;
DESC buyTBL;

-- -----------------------------------------
-- 테이블 정보 조회
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- 고객 테이블에 데이터 삽입(등록, 저장)
INSERT INTO userTBL VALUES ('김철수', 1995, '서울', '010-1234-5678');

-- 컬럼에 대한 제약 수정
ALTER TABLE userTBL MODIFY COLUMN mobile VARCHAR(13);
-- 제약 수정 후 데이터 재등록
INSERT INTO userTBL VALUES ('김철수', 1995, '서울', '010-1234-5678');
-- 테이블 조회
SELECT * FROM userTBL;
-- 추가 고객 등록하기 (컬럼명 직접 명시)
INSERT INTO userTBL (userName, birthYear, addr) VALUES ('이영희', 1998, '부산');
-- 중복된 데이터 저장하기
INSERT INTO userTBL (userName, birthYear, addr) VALUES ('이영희', 1998, '부산');

-- 구매 테이블 조회
SELECT * FROM buyTBL;
SELECT userName, prodName FROM buyTBL;

-- 구매 테이블 데이터 삽입
INSERT INTO buyTBL VALUES ('김철수', '운동화', 30000, 1);

-- 고객 테이블과 구매 테이블이 현재 FK로 제약 설정된 상태 (userName)
INSERT INTO buyTBL VALUES ('홍길동', '컴퓨터', 130000, 1);
-- 고객 테이블에 없는 userName에 대한 데이터는 등록할 수 없다

INSERT INTO buyTBL (userName, prodName, price, amount)
	VALUES ('이영희', '컴퓨터', 1500000, 1)






