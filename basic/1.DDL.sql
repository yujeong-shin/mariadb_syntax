--데이터 베이스 생성
CREATE DATABASE board;

--데이터베이스 선택
USE board;

--테이블 신규 생성
CREATE TABLE 테이블명(컬럼명1 컬럼타입1, ..., PRIMARY KEY(기본키 설정할 컬럼명));
CREATE TABLE author(id INT, name VARCHAR(255), email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), PRIMARY KEY (id));

--테이블 목록 조회
SHOW TABLES;

--테이블 컬럼조회
DESCRIBE author;

--post 테이블 신규 생성 및 외래키 설정
CREATE TABLE 테이블명(컬럼명1 컬럼타입1 PRIMARY KEY, ..., FOREIGN KEY(외래키 설정할 컬럼명) REFERENCES 테이블명(다른 테이블의 기본키 컬럼명));
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), content VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));

--테이블 컬럼 상세조회
SHOW FULL COLUMNS FROM author;

--테이블 생성문 조회
SHOW CREATE TABLE posts;
-- ALTER 등으로 중간에 변경된 사항을 반영해서 명령문을 알려줌.
-- 'CREATE TABLE `posts` (
--   `id` int(11) NOT NULL,
--   `title` varchar(255) DEFAULT NULL,
--   `contetn` varchar(255) DEFAULT NULL,
--   `author_id` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `author_id` (`author_id`),
--   CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci'

--테이블 제약조건 조회
SELECT * FROM INFORMATINO_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

--인덱스 조회
SHOW INDEX FROM posts;

--테이블 이름 변경
ALTER TABLE 테이블명 RENAME 새로운 테이블명;
ALTER TABLE posts RENAME post;

--컬럼 추가(Add)
ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료형 [NULL | NOT NULL];
ALTER TABLE author ADD COLUMN role VARCHAR(50);

--필드 타입 변경(Modify) => 덮어쓰기이기 때문에 이전의 제약조건을 같이 적어줘야 함!
ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 타입 [제약조건];
ALTER TABLE author MODIFY COLUMN name VARCHAR(100) NOT NULL;

--컬럼 이름변경
ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새로운컬럼명 타입 [제약조건];
ALTER TABLE post CHANGE COLUMN content contents VARCHAR(255);

--컬럼 삭제
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE author DROP test1;

--테이블 삭제
DROP TABLE 테이블명;
DROP TABLE post;

--IF EXISTS : board가 없다면 에러가 터지지 않고 다음으로 넘어감
--만약 DROP database board;라면 board가 없을 때 에러 터지면 다음이 실행이 안됨
--명령문 집합을 하나의 스크립트로 작성할 때 쓰면 유용하다 !
DROP database IF EXISTS board;
SHOW databases;

