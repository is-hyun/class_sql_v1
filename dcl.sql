-- DCL
-- 사용자 생성 (사람, 시스템에 부여)
-- localhost는 내 컴퓨터 안에서 접근하는 계정.
-- 외부에서 접근하려면 * 나 IP주소로 명시
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 새로 생성한 user1에 조회 권한 부여 (GRANT)
-- GRANT는 권한을 덮어쓰지 않고 추가하는 질의어
GRANT SELECT ON school.student TO 'user1'@'localhost';
-- 권한 확인
SHOW GRANTS FOR 'user1'@'localhost';
-- INSERT 권한 부여
GRANT INSERT ON school.student TO 'user1'@'localhost';
-- UPDATE / DELETE 권한 한 번에 부여
GRANT UPDATE, DELETE ON school.student TO 'user1'@'localhost';

-- 외부에서 접근 가능한 계정 생성
CREATE USER 'user1'@'%' IDENTIFIED BY 'password123';
SHOW GRANTS FOR 'user1'@'%';
-- 조회 권한 부여
GRANT SELECT ON school.student TO 'user1'@'%';


-- 권한 회수 (REVOKE)
REVOKE INSERT,UPDATE,DELETE ON school.student FROM 'user1'@'localhost';

-- 계정 삭제 (DROP)
DROP USER 'user1'@'localhost';
-- 계정 확인
SELECT USER();
-- 현재 USER 목록 확인
SELECT CURRENT_USER();

