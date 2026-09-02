
-- insert_practice DB가 있다면 통째로 삭제
-- IF EXISTS : ~가 있다면
-- DB가 존재하지 않으면 스크립트 오류가 발생해 멈춤
DROP DATABASE IF EXISTS insert_practice;

CREATE DATABASE insert_practice;
USE insert_practice;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL DEFAULT '미정'
);

-- 1. 한 건씩 삽입
INSERT INTO student (student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');
INSERT INTO student (student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');
INSERT INTO student (student_id, name, grade, major)
VALUES (3, '이영희', 2, '경영학과');

SELECT * FROM student;

-- 2. 여러 건 한 번에 삽입
INSERT INTO student (student_id, name, grade, major)
VALUES	(4, '박민준', 1, '전자공학과'),
		(5, '최지아', 2, '컴퓨터공학과'),
		(6, '한수연', 3, '경영학과');
        
-- 3. 제약 조건 확인 : PRIMARY KEY
INSERT INTO student (student_id, name, grade, major)
VALUES	(1, '김일남', 3, '컴퓨터공학과');
-- >> Duplicate entry '1' for key 'student.PRIMARY'

INSERT INTO student (student_id, name, grade, major)
VALUES	(1, '김일남', 3, '컴퓨터공학과'),
		(7, '김민석', 3, '컴퓨터공학과'),
		(8, '강미나', 3, '경영학과');
-- !중요! 여러 건을 한 번에 삽입할 때 값 중 하나라도 중복이면 블록 전체가 오류처리


-- 4. 제약 조건 확인 : NOT NULL
INSERT INTO student (student_id, name, grade)
VALUES	(9, NULL, 3);
-- >> Column 'name' cannot be null

INSERT INTO student (student_id, grade)
VALUES	(9, 3);
-- >> Field 'name' doesn't have a default value


-- 5. 제약 조건 확인 : DEFAULT
-- 방법 1. 디폴트 직접 명시
INSERT INTO student (student_id, name, grade, major)
VALUES	(10, '강수호', 1, DEFAULT),
		(11, '이서연', 3, DEFAULT);

SELECT * FROM student;     

-- 방법 2. 디폴트 컬럼 생략
INSERT INTO student (student_id, name, grade)
VALUES	(12, '고길동', 1),
		(13, '신형만', 3);   
        

-- ------------------------------        
-- DATE 타입에 값 넣기
-- ------------------------------     

-- !주의! ORDER BY에서 사용하는 예약어를 이름으로 사용하려면 백틱(`)으로 감싸야 한다
-- 		 하지만 가능한 예약어를 사용하지 말고 orders라고 수정하는 편이 좋다
CREATE TABLE `order` (
	id INT PRIMARY KEY,
    customer_note VARCHAR(50), 
    product_name VARCHAR(20) NOT NULL, 
    quantity INT NOT NULL, 
    order_date DATE NOT NULL
);
SELECT * FROM `order`;

-- 방법 1 : 따옴표로 감싸는 문자열 형태
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(1, '빠른 배송', '신라면', 2, '2026-09-01');
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(2, '빠른 배송', '신라면', 2, '20260901');

-- 방법 2 : 하이픈(-) 없는 숫자 형태
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(3, '문 앞 배송', '진라면', 4, 20260901);


-- 잘못된 형태의 DATE는 자동으로 걸러진다
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(4, '테스트', '신라면', 3, 20262201);
-- >> Incorrect date value (22월)

INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(5, '테스트', '신라면', 3, '20262201');
-- >> Incorrect date value (22월)


-- -----------------------------------------
-- AUTO_INCREMENT
-- 새 행을 삽입할 때마다 자동으로 하나씩 증가시키는 기능
-- 주로 PRIMARY KEY에 사용
-- -----------------------------------------

CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);
SELECT * FROM customer;

-- id를 작성하지 않아도 됨
INSERT INTO customer(name, email, address)
VALUES	('김철수', 'a@naver.com', '부산시 진구'),
		('박영희', 'b@naver.com', '부산시 동구'),
		('홍길동', 'c@naver.com', '부산시 진구');
        
-- id 값을 지정하면 해당 값을 시작값으로 증가함
INSERT INTO customer(id, name, email, address)
VALUES	(10, '홍아랑', 'd@naver.com', '부산시 진구');

INSERT INTO customer(name, email, address)
VALUES	('박민석', 'e@naver.com', '부산시 진구');

-- !주의! 행을 삭제해도 번호는 복구되지 않습니다.
DELETE FROM customer WHERE id = 11;

INSERT INTO customer(id, name, email, address)
VALUES	(12, '김민석', 'f@naver.com', '부산시 진구');
