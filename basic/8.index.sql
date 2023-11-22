-- INDEX
 -- (1) 단일컬럼 INDEX : author 테이블의 name
 CREATE INDEX one_index ON author(name);

 -- (2) 복합컬럼 INDEX : author 테이블의 name, email
  CREATE INDEX two_index ON author(name, email);

-- 사용자관리
-- 사용자 목록 조회
SELECT * FROM mysql.user;

-- 특정 사용자 권한 조회
SHOW GRANTS FOR 'root'@'localhost';

-- user 생성 후, INSERT 권한 부여, user 권한 조회
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';
SHOW GRANTS FOR 'testuser'@'localhost';
GRANT SELECT ON board.author TO 'testuser'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'testuser'@'localhost';

DROP USER 'testuser'@'%';


-- VIEW
-- author의 name, email정도만 알 수 있는 view를 생성
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';
CREATE VIEW author_for_view AS SELECT name, email FROM author;
SELECT * FROM author_for_view;

-- test user의 기존 author 관련 view 테이블에 조회권한 부여
GRANT SELECT ON board.author_for_view TO 'testuser'@'localhost';
FLUSH PRIVILEGES;

--testuser Connection으로 이동 및 view 조회
SELECT * FROM author_for_view;


-- PROCEDURE 1
DELIMITER //
CREATE PROCEDURE getUser(IN userId INT)
BEGIN 
   SELECT * FROM author WHERE  id=userId;
END //
DELIMITER ;

CALL getUser(1);

-- PROCEDURE 2
DELIMITER //
CREATE PROCEDURE easyInsert(IN title varchar(255), contents varchar(3000), author_id INT)
BEGIN
   INSERT INTO post(title, contents, author_id) VALUES(title, contents, author_id);
END //
DELIMITER ;

CALL easyInsert ('속눈썹펌 정보', '뷰티', 2);

select * from post;

-- PROCEDURE 3
DELIMITER //
CREATE PROCEDURE highPriceAuthor(IN in_author_id INT)
BEGIN
   DECLARE money INT DEFAULT 0;
   SELECT price FROM post WHERE author_id=in_author_id INTO money;
   IF money>=4000 THEN
        SELECT '고액 원고료 작가입니다' AS message;
   ELSE
        SELECT '고액 원고료 작가가 아닙니다' AS message;
   END IF;
END //
DELIMITER ;

CALL highPriceAuthor(4);

-- PROCEDURE 4
DELIMITER //
CREATE PROCEDURE highAvgPriceAuthor(IN in_author_id INT)
BEGIN
   DECLARE avg_price INT DEFAULT 0;
   SELECT AVG(price) INTO avg_price FROM post WHERE author_id=in_author_id;
   IF avg_price>=3000 THEN
        SELECT '고액 원고료 작가입니다' AS message;
   ELSE
        SELECT '고액 원고료 작가가 아닙니다' AS message;
   END IF;
END //
DELIMITER ;

CALL highAvgPriceAuthor(1);


-- PROCEDURE 5
DELIMITER //
CREATE PROCEDURE insert100Values()
BEGIN
   DECLARE a INT DEFAULT 0;
   DECLARE name varchar(100) DEFAULT '';
   DECLARE email varchar(500) DEFAULT '';
   DECLARE password varchar(255) DEFAULT '신';
   DECLARE role enum('user', 'admin') DEFAULT 'user';
   DECLARE address varchar(255) DEFAULT '';
   DECLARE age INT DEFAULT 0;
   
WHILE a<100 DO
   INSERT INTO author(id, name, email, password, role, address, age) VALUES(a+10, concat(name, a), concat(a, '@naver.com'), concat(password, a), 'user', concat(address, a, '동', a, '호'), a);
   SET a = a+1;
END WHILE;
END //
DELIMITER ;

CALL insert100Values();