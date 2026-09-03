USE relation_practice;

-- ===========
-- 1 : 1
-- ===========
CREATE TABLE member (
	member_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (member_id)
);

CREATE TABLE member_info (
	member_id INT UNIQUE,
    birth DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO member (name)
VALUES ('김일남'), ('한소이'), ('강철수'), ('송미나');

INSERT INTO member_info (member_id, birth, address)
VALUES (1, 19950203, '서울 강남구'),
	(2, 20041017, '부산 해운대구'),
    (3, 19980730, '서울 송파구'),
    (4, 20020628, '강릉 주문진');

SELECT * FROM member;    
SELECT * FROM member_info;    
    
-- ===========================
-- N : M  ( orders - product )
-- ===========================
CREATE TABLE `order` (
	order_id INT AUTO_INCREMENT,
    member_id INT NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

CREATE TABLE product (
	product_id INT AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE order_product (
	order_id INT,
    product_id INT,
    amount INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO `order` (order_id, member_id, order_status)
VALUES (1001, 1, '결제 대기'),
	(1002, 3, '배송 중'),
	(1003, 2, '상품 준비 중'),
	(1004, 4, '배송 완료');

INSERT INTO product (product_id, product_name, price, stock)
VALUES (101, '유기농 토마토', 7000, 3),
	(102, '여행용 캐리어', 45000, 10),
    (103, '검정 무지 반팔티', 15000, 8),
    (104, '김치 냉장고', 1200000, 12),
    (105, '보냉 텀블러', 17000, 23);
    
    
INSERT INTO order_product (order_id, product_id, amount)
VALUES (1001, 101, 2), (1001, 105, 1),
	(1002, 102, 1), (1002, 103, 2), (1002, 105, 2),
	(1003, 101, 4), (1003, 104, 1),
    (1004, 101, 1), (1004, 103, 1); 

SELECT * FROM `order`;
SELECT * FROM product;
SELECT * FROM order_product;


-- ===========================
-- 1 : N  ( member - order )
-- ===========================
INSERT INTO `order` VALUES (1005, 4, '배송 준비 중'); 


SELECT * FROM member;
SELECT * FROM `order`;

