[INSERT 실습과제]
(1) author 데이터 5개 추가
address필드 비워서 5개 행 추가
id 값은 순차적으로 증가하게 할 것

id NOT NULL, name NOT NULL, email, password, role, address
INSERT INTO author(id, name, email, password, role) VALUES(2, '신유정', 'aaa@naver.com', 'aaa', 'manager');
INSERT INTO author(id, name, email, password, role) VALUES(3, '송보석', 'bbb@naver.com', 'bbb', 'user');
INSERT INTO author(id, name, email, password, role) VALUES(4, '손정민', 'ccc@naver.com', 'ccc', 'user');
INSERT INTO author(id, name, email, password, role) VALUES(5, '임재영', 'ddd@naver.com', 'ddd', 'user');
INSERT INTO author(id, name, email, password, role) VALUES(6, '조원우', 'eee@naver.com', 'eee', 'user');

(2) post 데이터 5개 추가
2개는 저자가 있는 데이터, 2개는 저자가 비어있는 데이터(author_id)에 NOT NULL 조건없다는 사실 확인
1개는 저자가 author 테이블에 없는 데이터 추가 -> 에러 발생 확인하기

INSERT INTO post(id, title, contents, author_id) VALUES(1, '귤 정보', '음식', 1);
INSERT INTO post(id, title, contents, author_id) VALUES(2, '종합비타민 정보', '건강', 2);

INSERT INTO post(id, title, contents) VALUES(3, '제육쌈밥', '음식');
INSERT INTO post(id, title, contents) VALUES(4, '하체운동', '건강');


INSERT INTO post(id, title, contents, author_id) VALUES(5, '상체운동', '건강', 9);
-> Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`board`.`post`, CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`))	0.016 sec


[UPDATE, DELETE 실습과제]
(1) author 데이터 중 id가 4인 데이터를 email을 abc@naver.com, name을 abc로 변경
UPDATE author SET email='abc@naver.com', name='abc' WHERE id=4;

(2) post에 글쓴적이 없는 author 데이터 1개 삭제
= post에 author_id가 없는 author 데이터 1개 삭제
--DELETE FROM author WHERE id NOT EXISTS (SELECT author_id FROM post LIMIT 1);
DELETE FROM author WHERE id=3;


(3) port에 글쓴적이 있는 author 데이터 1개 삭제 -> 에러 -> 조치 후 삭제(author에서 해당 데이터 먼저 삭제하거나 null로 세팅)
방법1.
DELETE FROM post WHERE id=2;
DELETE FROM author WHERE id=2;

방법2.
UPDATE post SET author_id = null WHERE author_id=2;
DELETE FROM author WHERE id=2;