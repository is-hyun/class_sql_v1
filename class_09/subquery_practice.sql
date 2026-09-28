USE shop;
SELECT * FROM user;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM order_details;

-- 1. 가격이 가장 비싼 상품의 이름과 가격 조회
SELECT name AS 상품명, price AS 가격
FROM product
WHERE price = (SELECT MAX(price) FROM product); 

-- 2. 에어팟 프로를 한 번이라도 주문한 고객의 사용자명과 이메일 조회
/*
SELECT username AS 사용자명, email AS 이메일 FROM user u
WHERE id IN (SELECT user_id FROM orders WHERE id IN
	(SELECT order_id FROM order_details WHERE product_id = 3)) ;
*/

SELECT username AS 사용자명, email AS 이메일 FROM user u
WHERE id IN (SELECT o.user_id
			FROM orders o
            JOIN order_details od ON o.id = od.order_id
            WHERE od.product_id = (SELECT id FROM product WHERE name = '에어팟 프로'));

-- 3. 주문 금액과 평균의 차이
SELECT id, total_price AS 주문_금액, (AVG(s.총액) - total_price) AS 차
FROM (SELECT id, SUM(price) AS 총액 FROM orders o) AS s
ORDER BY 