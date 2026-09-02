DROP DATABASE movie;
CREATE DATABASE movie;
USE movie;

CREATE TABLE movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(30) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(20) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL
);

INSERT INTO movies (title, director, release_date, genre, rating)
VALUES	('괴물', '봉준호', 20060727, '드라마', 8.28),
	('극한직업', '이병헌', 20190123, '코미디', 9.20),
	('명량', '김한민', 20140730, '사극', 9.17),
	('신과함께-죄와 벌', '김용화', 20171220, '판타지', 7.56),
	('밀양', '임권택', 20160907, '드라마', 7.76),
	('반도', '연상호', 20200715, '액션', 6.71),
	('베테랑', '류승완', 20150805, '액션', 8.49),
	('변호인', '양우석', 20131218, '드라마', 8.41),
	('군함도', '류승완', 20170726, '사극', 8.01),
	('암살', '최동훈', 20150722, '액션', 8.37); 
    
SELECT * FROM movies;        
 