-- insert, select, update, delete
INSERT INTO author(id, name, email) VALUES(1, 'kim', 'abc@naver.com');

UPDATE author SET email="update@naver.com" WHERE id=1;

DELETE FROm author WHERE author_id=5;

SELECT * FROM author;
SELECT name, email FROM author WHERE id=1;
SELECT * FROM author WHERE id>1;
SELECT * FROM author WHERE id>1 AND name="kim";