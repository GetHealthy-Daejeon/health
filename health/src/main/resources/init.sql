-- 회원테이블
CREATE TABLE IF NOT EXISTS member
(
	member_name VARCHAR(20) COMMENT '회원 이름',
	member_id INTEGER(4) COMMENT '회원 아이디',
    member_password VARCHAR(200) COMMENT '회원 비밀번호',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입 날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;