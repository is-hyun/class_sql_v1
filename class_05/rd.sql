DROP DATABASE IF EXISTS relation_practice;
CREATE DATABASE relation_practice;
USE relation_practice;

-- =================================
-- 1 : 1 관계
-- =================================

CREATE TABLE tb_person (
	person_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (person_id)
);

CREATE TABLE tb_passport (
	passport_id INT AUTO_INCREMENT,
    passport_number VARCHAR(20) NOT NULL,
    person_id INT UNIQUE,	-- >> UNIQUE에 의해서 1:1 관계 성립
    PRIMARY KEY (passport_id),
    FOREIGN KEY (person_id) REFERENCES tb_person(person_id)
);

INSERT INTO tb_person (name)
VALUES ('홍길동'), ('김영희'), ('이철수');

INSERT INTO tb_passport (passport_number, person_id)
VALUES ('p123', 1), ('p456', 2), ('p789', 3);

SELECT * FROM tb_person;
SELECT * FROM tb_passport;

-- FK UNIQUE 설정에 의해 1:1 관계를 보장
INSERT INTO tb_passport (passport_number, person_id) VALUES ('p100', 1);
-- >> Error Code: 1062. Duplicate entry '1' for key 'tb_passport.person_id'


-- =================================
-- 1 : N 관계
-- =================================
CREATE TABLE tb_customer (
	customer_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE tb_order (
	order_id INT AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    customer_id INT,		-- >> UNIQUE가 없기 때문에 1:N 관계
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES tb_customer(customer_id)
);

INSERT INTO tb_customer (customer_id, name)
VALUES (1, '박민지'), (2, '최재영');

INSERT INTO tb_order (order_id, product_name, customer_id)
VALUES (201, '노트북', 1), (202, '마우스', 1), (203, '키보드', 2);

SELECT * FROM tb_customer;
SELECT * FROM tb_order;


-- =================================
-- N : M 관계
-- =================================

CREATE TABLE tb_student (
	student_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE tb_course (
	course_id INT AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE tb_student_course (
	student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES tb_student(student_id),
    FOREIGN KEY (course_id) REFERENCES tb_course(course_id)
);

INSERT INTO tb_student (name) 
VALUES ('홍길동'), ('김영희'), ('박민지');

INSERT INTO tb_course (course_id, title)
VALUES (101, '자바 프로그래밍'), (102, '데이터베이스'), (103, '웹 개발 입문');

INSERT INTO tb_student_course (student_id, course_id)
VALUES (1, 101), (1, 102),
	(2, 102), (2, 103),
    (3, 101), (3, 102), (3, 103);

-- 잘못된 데이터 입력 시도
INSERT INTO tb_student_course (student_id, course_id) VALUES (7, 101);
INSERT INTO tb_student_course (student_id, course_id) VALUES (3, 701);
-- >> Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails

SELECT * FROM tb_student;
SELECT * FROM tb_course;
SELECT * FROM tb_student_course;