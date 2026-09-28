DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
USE bank;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT NOT NULL
);

INSERT INTO accounts VALUES
    (1, 'Alice', 100000),
    (2, 'Bob', 50000);

SELECT * FROM accounts;

-- ------------------------------------

START TRANSACTION;

UPDATE accounts SET balance = balance - 30000 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 30000 WHERE account_id = 2;

-- COMMIT;
COMMIT;

SELECT * FROM accounts;

-- -------------------------------------------

START TRANSACTION;
UPDATE accounts SET balance = balance - 30000 WHERE account_id = 1;

-- 아직 COMMIT 하지 않은 상태에서 조회
SELECT '롤백 전' AS 시점, account_id, balance FROM accounts WHERE account_id = 1;

ROLLBACK;

SELECT '롤백 후' AS 시점, account_id, balance FROM accounts WHERE account_id = 1;

-- -------------------------------------------

-- 데이터를 원래대로 되돌린 뒤 시작 (3절 준비 블록 재실행)

START TRANSACTION;

UPDATE accounts SET balance = balance - 30000 WHERE account_id = 1;
UPDATE accounts SET balance = NULL WHERE account_id = 2;

-- -------------------------------------------

-- 3절 준비 블록 재실행 후

START TRANSACTION;
UPDATE accounts SET balance = balance - 30000 WHERE account_id = 1;
COMMIT;

ROLLBACK;   -- COMMIT 이후이므로 아무 효과가 없음

SELECT * FROM accounts;

-- -------------------------------------------

-- 3절 준비 블록 재실행 후

START TRANSACTION;

UPDATE accounts
SET balance = balance - 200000
WHERE account_id = 1 AND balance >= 200000;

SELECT ROW_COUNT() AS 변경된행수;

-- 지금 단계에서는 ROW 수를 확인하고 직접 ROLLBACK; 이나 COMMIT 을 결정해서 입력하도록 합니다. 

-- -------------------------------------------

ROLLBACK;

SELECT * FROM accounts;

-- -------------------------------------------

