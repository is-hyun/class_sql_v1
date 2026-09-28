Drop table 수강생_수업;
CREATE DATABASE normalization;
USE normalization;

-- 일부러 정규화하지 않은 테이블
CREATE TABLE 수강생_수업 (
    학생ID   INT         NOT NULL,
    학생이름 VARCHAR(20) NOT NULL,
    학생주소 VARCHAR(50) NOT NULL,
    강사ID   INT         NOT NULL,
    강사이름 VARCHAR(20) NOT NULL,
    강의명   VARCHAR(30) NOT NULL,
    수강료   INT         NOT NULL,
    PRIMARY KEY (학생ID, 강사ID)
);

INSERT INTO 수강생_수업 VALUES
(1, '홍길동', '서울 강남',   101, '김강사', '자바 기초',  500000),
(1, '홍길동', '서울 강남',   102, '이강사', 'MySQL 활용', 400000),
(2, '이순신', '부산 해운대', 101, '김강사', '자바 기초',  500000),
(3, '김유신', '대구 수성',   101, '김강사', '자바 기초',  500000);

SELECT * FROM 수강생_수업;

-- 한 테이블에 학생 정보, 강사 정보, 강의 정보가 모두 들어있는 상태.alter

-- 시나리오 1 : 홍길동이 이사를 갔다면 위 데이터를 수정해야함
START TRANSACTION;
UPDATE 수강생_수업 SET 학생주소 = '부산 진구'
WHERE 학생ID = 1 AND 강사ID = 101;
SELECT * FROM 수강생_수업;

-- 1번과 2번 행을 모두 수정해야 한다.
-- 실수로 한 줄만 수정했다면 같은 사람의 주소가 두 가지가 되어버린다.
-- >> 삭제 이상 (Update Anomaly)
ROLLBACK;

-- 시나리오 2 : 자바 기초 수강료가 인상
-- 50만 원에서 60만 원으로 인상
-- 1, 3, 4행 모두 수정
-- 하나라도 수정이 제대로 이루어지지 않는다면 수강료가 제각각이 된다
start transaction;
-- 자바 기초 수강료를 3군데 수정을 해야 한다. 실수로 한군데만 수정을 한다면 수정 이상이 발생한다. 
UPDATE 수강생_수업 SET 수강료 = 600000
WHERE 학생ID = 1 AND 강사ID = 101;
SELECT 강의명, 수강료, 학생이름 FROM 수강생_수업 WHERE 강의명 = '자바 기초';
-- >> 수정 이상 (Update Anomaly)

-- 시나리오 3 : 홍길동이 MySQL 강의를 수강 취소 했다.
START TRANSACTION;
DELETE FROM 수강생_수업
WHERE 학생ID = 1 AND 강사ID = 102;

SELECT * FROM 수강생_수업;
-- 이강사(102)의 정보가 통째로 사라짐
-- >> 삭제 이상 (Update Anomaly)
ROLLBACK;

-- 시나리오 4 : 새 강사를 등록
INSERT INTO 수강생_수업 (강사ID, 강사이름) VALUES (103, '박강사');
-- >> Error Code: 1364. Field '학생ID' doesn't have a default value
-- 박강사를 채용은 했지만 아직 배정된 강의가 없음
-- 즉, 학생ID, 학생이름, 강의명이 NOT NULL 이면 저장할 수 없다.
-- 현재 스키마에서 강사만 따로 등록할 수 있는 방법이 없음
-- 삽입 이상 (Update Anomaly)

-- 정규화란?
-- 정규화(Normalization)는 이런 현상들을 방지하기 위해 테이블을 올바르게 분리하는 설계 원칙
-- 핵심 목표
-- 1. 데이터 중복 제거
-- 2. 수정, 삭제, 삽입 이상 방지
-- 3. 데이터 무결성 보장


