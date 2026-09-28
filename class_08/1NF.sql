USE normalization;
DROP table 수강생;
DROP table student;
DROP table enrollment;
DROP table student_phone;

-- 일부러 1NF 를 위반한 테이블
CREATE TABLE 수강생 (
    학생ID   INT          PRIMARY KEY,
    이름     VARCHAR(20)  NOT NULL,
    수강과목 VARCHAR(100) NOT NULL    -- 한 칸에 여러 값을 쉼표로 넣는다
);

INSERT INTO 수강생 VALUES
(1, '홍길동', '자바, MySQL, 스프링'),
(2, '이순신', 'MySQL, 파이썬'),
(3, '김유신', '자바');

SELECT * FROM 수강생;

SELECT 이름 FROM bad WHERE 수강과목 = 'MySQL';
SELECT 이름, 수강과목 FROM bad WHERE 수강과목 LIKE '%MySQL%';

-- 1NF를 적용 
-- 위반 사례 3번 (기본키 없었던 부분을 해결) 
create table student(
	id int primary key auto_increment, 
    name varchar(50) not null, 
    address varchar(100) 
); 

insert into student(name, address) values
('홍길동', '서울시 강남구'),
('이순신', '서울시 서초구'),
('김유신', '부산시 진구');

-- id가 생겼으므로 동명이인이 있어도 한 사람을 정확히 지목할 수 있다. 
update student set address = '서울시 송파구' where id = 1; 


-- 위반 사례 1번을 해결 : 수강 과목을 별도 테이블로 분리
CREATE TABLE enrollment(
	id INT PRIMARY KEY AUTO_INCREMENT,
    subject VARCHAR(50) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(id)
);

INSERT INTO enrollment(student_id, subject)
VALUES (1, '자바'),
	(1, 'MySQL'),
	(1, '스프링'),
    (2, 'MySQL'),
    (2, '파이썬'),
    (3, '자바');
    
SELECT * FROM enrollment;

CREATE TABLE student_phone (
    id         INT         PRIMARY KEY AUTO_INCREMENT,
    student_id INT         NOT NULL,
    tel        VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

INSERT INTO student_phone (student_id, tel) VALUES
(1, '010-1111-1111'),
(1, '010-2222-2222'),   -- 홍길동 두 번째 번호
(2, '010-3333-3333'),
(3, '010-5555-5555'),
(3, '010-6666-6666'),   -- 김유신 두 번째 번호
(3, '010-7777-7777');   -- 김유신 세 번째 번호

SELECT * FROM student_phone;

-- 1NF 적용 후
SELECT * FROM student;
SELECT * FROM enrollment;
SELECT * FROM student_phone;

-- 도전 문제
-- MySQL 듣는 학생 전부 조회
SELECT s.id, s.name, e.subject FROM student s
INNER JOIN enrollment e ON s.id = e.student_id
WHERE e.subject = 'MySQL';

-- 1. 학생과 수강 과목 전체 조회
SELECT s.id, s.name, e.subject FROM student s
INNER JOIN enrollment e ON s.id = e.student_id;

-- 2. 학생별 수강 과목 수
SELECT s.id, s.name, COUNT(e.subject) FROM student s
LEFT JOIN enrollment e ON s.id = e.student_id
GROUP BY s.id;