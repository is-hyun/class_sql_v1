-- 앞 차시에서 만든 shop 이 남아있으면 지우고 시작
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- 회원 테이블 생성 (PRIMARY KEY, UNIQUE KEY 사용)
CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  join_date DATE NOT NULL
);

-- 상품 테이블 생성 (PRIMARY KEY 사용)
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock INT NOT NULL
);

-- 주문 테이블 생성 (FOREIGN KEY 사용)
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  product_id INT,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (member_id) REFERENCES member(id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 회원 데이터 삽입
INSERT INTO member (email, name, phone, join_date)
 VALUES	('hong@test.com', '홍길동', '010-1234-5678', '2023-01-15'),
	('kim@test.com', '김영희', '010-2345-6789', '2023-02-20'),
	('lee@test.com', '이철수', '010-3456-7890', '2023-03-10');

-- 상품 데이터 삽입
INSERT INTO product (product_id, name, price, stock)
VALUES	(1, '노트북', 1500000, 50),
	(2, '스마트폰', 800000, 100),
	(3, '헤드폰', 200000, 200);

-- 주문 데이터 삽입
INSERT INTO orders (member_id, product_id, quantity, order_date)
VALUES	(1, 1, 1, '2023-03-25'),
	(2, 2, 2, '2023-04-02'),
	(3, 3, 3, '2023-04-03');
    
-- ====================================
-- user 테이블 설계
-- ====================================
CREATE TABLE user (
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) UNIQUE,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 정상 데이터
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong@test.com', 'pass123');

SELECT * FROM user;

-- ====================================
-- DDL 연습
-- ====================================

-- 1. TABLE category 생성
CREATE TABLE category (
	category_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 2. product 테이블에 category_id 컬럼 추가 및 외래 키 설정
ALTER TABLE product
ADD COLUMN category_id INT,
ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);

SELECT * FROM product;

-- 3. orders 테이블에 인덱스 추가
ALTER TABLE orders ADD INDEX idx_order_date (order_date);

SHOW INDEX FROM orders;

-- ====================================
-- DML 연습
-- ====================================

-- INSERT 연습
-- 1. category 테이블에 데이터 삽입
INSERT INTO category (category_id, name)
VALUES	(1, '전자제품'),
	(2, '가전제품');

SELECT * FROM category;

-- 2. product 테이블의 category_id 업데이트
UPDATE product SET category_id = 1;

SELECT * FROM product;

-- 3. 새로운 회원 추가
INSERT INTO member (email, name, phone, join_date)
 VALUES	('park@test.com', '박민지', '010-4567-8901', '2023-04-05');

SELECT * FROM member;

-- SELECT 연습
-- 1. 2023년 3월 이후 가입한 회원 조회
SELECT * FROM member WHERE join_date >= 20230301;

-- 2. 가격이 500,000원 이상인 상품 조회
SELECT * FROM product WHERE price >= 500000;

-- UPDATE 연습
-- 1. 이철수의 전화번호를 '010-9999-0000'으로 변경
UPDATE member SET phone = '010-9999-0000' WHERE name = '이철수';
SELECT * FROM member;

-- 2. 재고가 100개 미만인 상품의 가격을 10% 인상
UPDATE product SET price = price * 1.1 WHERE stock < 100;
SELECT * FROM product;

-- DELETE 연습
-- 1. 2023년 4월 1일 이전 주문 삭제
SELECT * FROM orders WHERE order_date <= 20230401;
DELETE FROM orders WHERE order_date <= 20230401;

-- 2. 재고가 0인 상품 삭제
UPDATE product SET stock = 0 WHERE category_id = 1;

SELECT * FROM product WHERE stock = 0;
DELETE FROM product WHERE stock = 0;
-- >> Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails

-- ====================================
-- 키 제약 조건 및 인덱스 연습
-- ====================================

-- 1. 중복 이메일 삽입 시도
SELECT * FROM member;
INSERT INTO member(email, name, phone)
VALUES('hong@test.com', '홍길동2', '010-1234-1234');
-- >> Error Code: 1364. Field 'join_date' doesn't have a default value

-- 2. 존재하지 않는 회원의 주문 추가 시도
SELECT * FROM orders;
INSERT INTO orders(member_id, product_id, quantity, order_date)
VALUES(100, 1, 10, 20260901);
-- >> Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails

-- 3. orders 테이블에서 member_id와 order_id로 복합 인덱스 생성
CREATE INDEX idx_memberid_orderdate ON orders (member_id, order_date);

-- 4. 인덱스 활용 확인
SHOW INDEX FROM orders; 

-- ====================================
-- DCL 연습
-- ====================================

-- 1. 새로운 사용자 생성 및 권한 부여 (test_user - localhost)
CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT ON shop.* TO 'test_user'@'localhost';

-- 2. 권한 확인
SHOW GRANTS FOR 'test_user'@'localhost';

-- 3. 권한 회수
REVOKE INSERT ON shop.* FROM 'test_user'@'localhost';
SHOW GRANTS FOR 'test_user'@'localhost';
