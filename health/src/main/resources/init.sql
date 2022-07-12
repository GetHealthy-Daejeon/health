-- membership
CREATE TABLE IF NOT EXISTS `membership` (
  `member_name` varchar(20) DEFAULT NULL COMMENT '회원 이름',
  `member_password` varchar(200) DEFAULT NULL COMMENT '회원 비밀번호',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '가입 날짜',
  `authority` int DEFAULT '1',
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
  PRIMARY KEY (`member_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- health_addr
CREATE TABLE IF NOT EXISTS `health_addr` (
  `gu_code` varchar(200) DEFAULT NULL COMMENT '구코드',
  `event_code` varchar(200) DEFAULT NULL COMMENT '종목코드',
  `fac_name` varchar(200) DEFAULT NULL COMMENT '시설명',
  `addr_road` varchar(200)  DEFAULT NULL COMMENT '시설 주소',
  `latitude` varchar(200)  DEFAULT NULL COMMENT '위도',
  `longitude` varchar(200)  DEFAULT NULL COMMENT '경도',
  `digit` varchar(200) DEFAULT NULL COMMENT '전화번호',
  `place_no` int NOT NULL AUTO_INCREMENT COMMENT '시설번호',
  PRIMARY KEY (`place_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;