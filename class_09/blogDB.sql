drop database if exists blog; 
create database blog; 
use blog; 

-- drop table user; 
create table user(
	id int  primary key auto_increment, 
    username varchar(100) not null unique,
    password varchar(255) not null, 
    email varchar(100) not null unique, 
    address varchar(100), 
    userRole varchar(20), 
    createDate datetime default current_timestamp
); 

-- drop table board; 
create table board(
	  id int primary key auto_increment, 
    title varchar(100) not null, 
    content longtext, 
    readCount int    default 0,
    userId int,
    createDate datetime default current_timestamp
); 

create table reply(
	  id int primary key auto_increment, 
    content varchar(300) not null, 
    createDate datetime default current_timestamp,
    boardId int, 
    userId int 
); 

select * from user; 
select * from board; 
select * from reply;

-- 샘플 데이터
INSERT INTO user (username, password, email, address, userRole) VALUES
('hong', '1234', 'hong@example.com', '서울시 강남구',   'admin'),
('lee',  '1234', 'lee@example.com',  '부산시 해운대구', 'user'),
('kim',  '1234', 'kim@example.com',  '대구시 수성구',   'user'),
('park', '1234', 'park@example.com', '인천시 연수구',   'user');

INSERT INTO board (userId, title, content, readCount) VALUES
(1, '자바 스터디 모집합니다', '함께 공부하실 분 구해요!',      150),
(2, '부산 맛집 추천',        '해운대 주변 맛집 소개합니다.',   45),
(3, '대구 코딩 모임',        '대구에서 코딩 모임 시작합니다.', 30);

INSERT INTO reply (userId, boardId, content) VALUES
(2, 1, '저도 참여하고 싶어요!'),
(3, 1, '좋은 취지네요, 응원합니다.'),
(1, 2, '저도 부산 가면 꼭 가볼게요!'),
(1, 3, '대구 모임 화이팅!');

SELECT * FROM user;
SELECT * FROM board;
SELECT * FROM reply;

-- 1. 게시글 목록에 작성자이름과 댓글 수 붙이기 
select b.title as 게시글제목, 
       u.username as 작성자, 
       b.readCount as 조회수, 
       count(r.id) as 댓글수 
from board b
left join user u on b.userId = u.id
left join reply r on b.id = r.boardId
group by b.id, b.title, u.username, b.readCount
order by b.readCount desc;

select u.username as 사용자, 
       count(b.id) as 게시글수       
from user u 
left join board b on u.id = b.userId 
group by u.id, u.username
order by 게시글수 desc, u.id;   

-- 회원 탈퇴 시나리오 
delete from user where username = 'lee';

SELECT b.title AS 제목,
    -- u.username이 NULL이면 '탈퇴한 사용자'로 변경
    COALESCE(u.username, '탈퇴한 사용자') AS 작성자,
    b.content AS 내용,
    b.readCount AS 조회수,
    COUNT(r.id) AS 댓글수,
    b.createDate AS 게시글_작성일
FROM board b
LEFT JOIN user u ON b.userId = u.id
LEFT JOIN reply r ON b.id = r.boardId
GROUP BY b.id, b.title, u.username, b.content, b.readCount, b.createDate
ORDER BY b.readCount;