-- INNER JOIN
select * from author;
select * from post;

-- author의 id와 post의 author_id가 일치하는 ON 조건을 만족하는 데이터만 JOIN
SELECT * FROM author INNER JOIN post ON author.id = post.author_id;

-- author의 테이블은 일단 다 조회, author가 작성한 글 정보를 join 추가적으로 조회
SELECT * FROM author LEFT JOIN post ON author.id = post.author_id;

-- (1) author 테이블과 post 테이블을 JOIN하여, 글을 작성한 모든 저자의 이름과 해당 글의 제목을 조회하시오.author는 alias a, post는 alias p를 쓰시오
SELECT name, title FROM author AS a INNER JOIN post AS p ON a.id = p.author_id;

-- (2) author 테이블을 기준으로 post 테이블과 JOIN하여, 모든 저자의 이름과 해당 저자가 작성한 글의 제목을 조회하시오. 글을 작성하지 않은 저자의 경우, 글 제목은 NULL로 표시
SELECT name, title FROM author AS a LEFT JOIN post AS p ON a.id = p.author_id;

-- (3) 위 예제와 동일하게 모든 저자의 이름과 해당 저자가 작성한 글의 제목을 조회. 단, 저자의 나이가 25세 이상인 저자만 조회
SELECT name, title, age FROM author AS a LEFT JOIN post AS p ON a.id = p.author_id WHERE a.age>=25;


-- author 테이블에서 name, email post 테이블에서 title, contents UNION하기, UNION ALL하기
SELECT name, email FROM author UNION SELECT title, contents FROM post;
SELECT name, email FROM author UNION ALL SELECT title, contents FROM post;



-- 집계함수
-- 1. post테이블 author_id로 그룹화한 데이터의 갯수구하는 집계 SQL
SELECT COUNT(author_id) FROM post;

-- 2. 만약 post마다 원고료가 있었다면, select author_id, sum(price), avg(price) from post group by author_id
SELECT ROUND(AVG(price), 0) FROM post;
SELECT MIN(price) FROM post;
SELECT MAX(price) FROM post;
SELECT SUM(price) FROM post;

-- 3. 작가 id별로 몇 개의 글을 썼는지 SELECT
SELECT author_id , COUNT(*) FROM post GROUP BY author_id;

-- 4. 작가 id별로 price sum, price avg 구하기
SELECT author_id , ROUND(SUM(price), 0), ROUND(AVG(price),0) FROM post GROUP BY author_id;


-- GROUP BY절
-- 1. author_id별로 price 평균 값을 구하시오. 단, 건별로 2000원 이상인 데이터만 평균을 내서 출력하시오.
SELECT author_id , AVG(price) FROM post WHERE price >= 2000 GROUP BY author_id;

-- 2. author_id 별로 price  평균 값을 구하시오. 단, 그룹별 평균값이 2000원 이상인 데이터만 출력하시오.
SELECT author_id, AVG(price) FROM post GROUP BY author_id HAVING AVG(price)>=2000;


-- 3. 1+2
SELECT author_id, AVG(price) FROM post
WHERE price>=2000
GROUP BY author_id HAVING AVG(price) >= 2000