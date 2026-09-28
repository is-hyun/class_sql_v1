-- FROM 절 서브쿼리 (인라인 뷰)
-- 서브쿼리 결과를 임시 테이블처럼 FROM 절에 두는 방식

-- 뷰 : CREATE VIEW 로 미리 만들어두고 이름으로 부른다.
-- 인라인 뷰 : 미리 만들지 않고 FROM 절에 직접 써 넣는다.

-- 인라인 뷰 사용 예시
-- 집계한 결과를 다시 집계하는 경우

-- 예시. 고객 한 명의 평균 구매금액
SELECT * FROM orders;
-- 1. 고객별 총 구매금액 (집계)
-- 2. 총 액의 평균 (집계)
-- ! 집계함수는 겹쳐서 사용할 수는 없다.
SELECT ROUND(AVG(s.총액), 2) AS 고객당_평균구매액
FROM	(SELECT user_id, SUM(total_price) AS 총액
		FROM orders
		GROUP BY user_id)
AS s;

-- 인라인 뷰가 필요 없는 이유
-- 집계 결과에 조건만 거는 것이라면 HAVING으로 충분
SELECT u.username AS 고객, SUM(o.total_price) AS 총액
FROM orders o
JOIN USER u ON o.user_id = u.id;