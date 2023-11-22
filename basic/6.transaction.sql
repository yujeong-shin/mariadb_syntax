insert into board_test.author(id, name, email) values(2, 'test', 'test@naver,com');
COMMIT;
insert into board_test.post(title, contents, author_id) values('hello', 'hello is', 10);
ROLLBACK;
--    - 위 코드 실행후 commit하면 첫번째 쿼리만 확정
--    - 위 코드 실행후 rollback하면 모두 취소