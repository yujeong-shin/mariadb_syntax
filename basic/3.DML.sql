-- insert, select, update, delete
INSERT INTO author(id, name, email) VALUES(1, 'kim', 'abc@naver.com');

UPDATE author SET email="update@naver.com" WHERE id=1;

DELETE FROM author WHERE author_id=5;

SELECT * FROM author;
SELECT name, email FROM author WHERE id=1;
SELECT * FROM author WHERE id>1;
SELECT * FROM author WHERE id>1 AND name="kim";


--이름 중복제거하고 조회
SELECT DISTINCT name FROM author;

--order by
select * from author order by name desc;

--order by 멀티 : 먼저 쓴 컬럼 우선정렬. asc/desc 생략시 asc적용
select * from author order by name, email desc;

--limit number : 특정숫자로 결과값 개수 제한
select * from author order by id desc limit 2;

--alias를 이용한 select문
select name as n from author;

