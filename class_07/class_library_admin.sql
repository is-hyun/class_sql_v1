USE library;

CREATE TABLE admins(
	id INT PRIMARY KEY AUTO_INCREMENT,
    admin_id VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- ! 실무에서는 비밀번호를 절대 그대로 넣지 않음 (암호화 처리 필수)
INSERT INTO admins (admin_id, password, name)
VALUES('admin1', 'admin123', '박지훈'),
	('admin2', 'ad123', '이서연');
    
SELECT * FROM admins;
