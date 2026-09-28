-- [1]
-- DB 생성
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;
-- 사용자 생성
DROP USER IF EXISTS 'shop_admin'@'%';
CREATE USER 'shop_admin'@'%' IDENTIFIED BY 'admin_password123';
GRANT ALL ON shop_db.* TO 'shop_admin'@'%';

SHOW GRANTS FOR 'shop_admin'@'%';

-- [2]
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS member;

-- 테이블 및 제약조건 생성
CREATE TABLE member (
    member_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    PRIMARY KEY (member_id)
);

CREATE TABLE product (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    PRIMARY KEY (product_id),
    CHECK (price >= 0)
);

-- [3]
-- 인덱스 생성
ALTER TABLE member ADD INDEX idx_member_name (name);
