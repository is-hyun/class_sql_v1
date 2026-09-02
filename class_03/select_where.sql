DROP DATABASE IF EXISTS select_practice;
CREATE DATABASE select_practice;
USE select_practice;

-- 샘플 데이터 1
CREATE TABLE customer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(100)
);

INSERT INTO customer (name, email, address) VALUES
('김철수', 'kim@example.com', '서울시 강남구'),
('박영희', 'park@example.com', '서울시 서초구'),
('이민수', NULL, '경기도 성남시'),
('최영진', 'choi@example.com', '서울시 송파구'),
('한미영', 'han@example.com', '경기도 수원시'),
('강종현', 'kang@example.com', '서울시 강서구');

-- 샘플 데이터 추가 저장
INSERT INTO customer (name, email, address)
VALUES ('홍길동', 'hong@example.com', '부산시 진구');


SELECT * FROM customer;


-- ---------------------------
-- SELECT 구문과 WHERE 절 연습
-- ---------------------------

-- 조건 조회
-- 1. 서울시 강남구 거주 고객 조회 (id와 name만 조회)
SELECT id, name FROM customer WHERE address = '서울시 강남구';

-- 2. 이메일이 NULL인 고객 조회
SELECT * FROM customer WHERE email = NULL;
-- >> NULL 값은 비교 연산자로 비교할 수 없음

SELECT * FROM customer WHERE email IS NULL;

-- 3. 이름 조회
SELECT * FROM customer WHERE name = '박영희';

-- 복합 조건
-- 4. 서울시에 거주하는 id 3 이하 고객 조회
SELECT * FROM customer WHERE address LIKE '서울시%' AND id <= 3;

-- 5. 서울시에 거주하지 않는 고객 조회
SELECT * FROM customer WHERE address NOT LIKE '서울시%';

-- 6. 서울시 또는 경기도에 거주하는 고객 조회
SELECT * FROM customer WHERE address LIKE '서울시%' OR address LIKE '경기도%';


-- 특수 연산자
-- 7. id가 2 ~ 5 사이인 고객 조회
SELECT * FROM customer WHERE id BETWEEN 2 AND 5;

-- 8. 강남구, 서초구, 송파구에 거주하는 고객 조회
SELECT * FROM customer WHERE address IN('서울시 강남구', '서울시 서초구', '서울시 송파구');
