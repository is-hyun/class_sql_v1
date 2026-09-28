DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

CREATE TABLE user (
    id         INT          PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    address    VARCHAR(255),
    is_deleted TINYINT(1)   NOT NULL DEFAULT 0,
    deleted_at DATETIME     NULL,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product (
    id          INT           PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    description TEXT,
    price       DECIMAL(10,2) NOT NULL,
    stock       INT           DEFAULT 0,
    is_deleted  TINYINT(1)    NOT NULL DEFAULT 0,
    created_at  DATETIME      DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id               INT           PRIMARY KEY AUTO_INCREMENT,
    user_id          INT           NOT NULL,
    total_price      DECIMAL(10,2) NOT NULL,
    status           VARCHAR(20)   NOT NULL DEFAULT '결제완료',
    delivery_address VARCHAR(255)  NOT NULL,
    created_at       DATETIME      DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE order_details (
    id         INT           PRIMARY KEY AUTO_INCREMENT,
    order_id   INT           NOT NULL,
    product_id INT           NOT NULL,
    quantity   INT           NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO user (username, password, email, address) VALUES
('hong', '1234', 'hong@test.com', '서울시 강남구'),
('kim',  '1234', 'kim@test.com',  '부산시 해운대구'),
('lee',  '1234', 'lee@test.com',  '대구시 수성구'),
('park', '1234', 'park@test.com', '인천시 연수구');

INSERT INTO product (name, price, stock, description) VALUES
('갤럭시 S24',      1200000,  50, '삼성 최신 스마트폰'),
('노트북 그램',     1800000,  30, '초경량 노트북'),
('에어팟 프로',      329000, 200, '노이즈 캔슬링 이어폰'),
('블루투스 키보드',   89000, 120, '무선 기계식 키보드'),
('요가 매트',         45000, 150, '친환경 TPE 요가 매트'),
('자바 완전정복',     35000,  80, '자바 입문서');

INSERT INTO orders (user_id, total_price, status, delivery_address) VALUES
(1, 1529000, '배송완료', '서울시 강남구'),
(1,  124000, '배송중',   '서울시 마포구 회사'),
(2, 1800000, '배송완료', '부산시 해운대구'),
(3,   80000, '결제완료', '대구시 수성구');

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200000),
(1, 3, 1,  329000),
(2, 4, 1,   89000),
(2, 5, 1,   35000),
(3, 2, 1, 1800000),
(4, 5, 1,   45000),
(4, 6, 1,   35000);

SELECT * FROM user;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM order_details;

-- 시나리오 1
SELECT o.id AS 주문번호,
	u.username AS 주문자,
    o.total_price AS 금액,
    o.status AS 상태
FROM orders o
JOIN USER u ON o.user_id = u.id;


-- VIEW
CREATE VIEW v_order_summary AS
SELECT o.id AS 주문번호,
	u.username AS 주문자,
    o.total_price AS 금액,
    o.status AS 상태
FROM orders o
JOIN USER u ON o.user_id = u.id;

SELECT * FROM v_order_summary;
SELECT * FROM v_order_summary WHERE 상태 = '배송완료';

SELECT 주문자, SUM(금액) AS 총액
FROM v_order_summary
GROUP BY 주문자
ORDER BY 총액 DESC;

-- 원본 데이터 수정
UPDATE orders SET STATUS = '구매확정' WHERE id = 1;

SELECT * FROM v_order_summary;
-- 변경된 값 적용

-- 4. 뷰 삭제
DROP VIEW v_order_summary;

SELECT TABLE_NAME, TABLE_TYPE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'shop';