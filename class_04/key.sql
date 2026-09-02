USE type_practice;
-- 앞 차시에서 만든 테이블이 남아있으면 지우고 시작
-- orders 가 member 를 참조하므로 자식 테이블을 먼저 지웁니다
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;

CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20)
);

INSERT INTO member (email, name, phone) VALUES
('hong@test.com', '홍길동', '010-1234-5678'),
('kim@test.com', '김영희', '010-2345-6789'),
('lee@test.com', '이철수', '010-3456-7890');

CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  order_date DATE,
  amount INT,
  FOREIGN KEY (member_id) REFERENCES member(id)
);

INSERT INTO orders (member_id, order_date, amount) VALUES
(1, '2023-10-01', 50000),
(2, '2023-10-02', 75000),
(3, '2023-10-03', 30000);

-- 실습하기 

-- 1. 중복 이메일 삽입 시도
INSERT INTO member(email, name, phone)
VALUES('kim@test.com', '홍길동2', '010-1234-1234');
-- >> Duplicate entry 'kim@test.com' for key 'member.email'

-- 2. 존재하지 않는 회원의 주문 삽입 시도
INSERT INTO orders(member_id, order_date, amount)
VALUES(1000, 20260901, 10);
-- >> Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails.

-- 3. 회원 삭제 시도 (참조된 데이터)
DELETE FROM member WHERE id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails.

-- 4. 외래키 삭제하는 방법
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

-- 5. 테이블 생성 이후에 외래키를 추가하는 방법
ALTER TABLE orders
ADD CONSTRAINT fk_member FOREIGN KEY(member_id) REFERENCES member(id);

ALTER TABLE orders
DROP FOREIGN KEY fk_member;

-- CASCADE 설정 : 부모 테이블에 참조된 대상이 삭제된다면 관련 데이터 자동 삭제
ALTER TABLE orders
ADD CONSTRAINT fk_member FOREIGN KEY(member_id) REFERENCES member(id)
ON DELETE CASCADE ON UPDATE CASCADE; 

SELECT * FROM orders;
SELECT * FROM member;
DELETE FROM member WHERE id = 1;
-- >> orders의 데이터도 같이 삭제