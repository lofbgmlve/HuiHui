use spring;
select * from nonnameboard;
DROP TABLE IF EXISTS nonNameBoard;
CREATE TABLE IF NOT EXISTS nonNameBoard(
	nonName_no INTEGER auto_increment PRIMARY KEY,
	emp_id VARCHAR(10) NOT NULL,
	nonName_title varchar(30) not null,
    nonName_content varchar(500) not null,
    nonName_date TIMESTAMP NOT NULL,
    nonName_read_count INTEGER(5) NOT NULL,
    nonName_file varchar(50) ,
	nonName_thank INTEGER DEFAULT 0,
	nonName_bad INTEGER DEFAULT 0,
    CONSTRAINT nonNameBoard FOREIGN KEY(emp_id) REFERENCES emptable(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 수리 언제 끝나는지 아시나요?', '출근하는데 엘베 고장이라고 계단 걸어 올라오니까 \n 현기증 나더라고요.. 진짜 죽을맛... 내일은 해결되어 있겠죠?', '2022-04-20 11:21:58', 7, null);

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 고장 실화임?','아니 안그래도 운동부족인데 아침부터 계단으로 출근하려니까 현기증 나서 죽겠음... 제발 빨리 고쳐줘요... ', '2022-04-20 15:21:58', 11, null );

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','XX치킨 신메뉴 나왔다','여기 사장님이 우리회사 출신이라 사원증 걸고 가면 소소한 서비스 줘서 안그래도 자주 갔는데 \n 어제 가보니까 신메뉴 나왔는데 진짜 대존맛이더라 다들 한번 가보3', '2022-04-20 11:24:40', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','아이브 갓기들 이번 노래 너무 좋다','현생에 치여서 힘들다가도 우리 갓기들 보면 힘나잔아 나르시즘 컨셉 누구 아이디어야 적게 일하고 많이 버세요', '2022-04-21 15:38:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','다음주에 첫 출장 가는데 뭐뭐 준비해야 하나요?','첫 출장이라 좀 떨리는데... 뭐뭐 준비하면 되려나요ㅠㅠ', '2022-04-21 12:21:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','익신입 오늘 대형사고 침...','하.. 진짜 너무 대형사고라 눈물도 안나오네요... 원래 신입때는 다 이런가요..?', '2022-04-25 16:42:58', 11, null );

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 수리 언제 끝나는지 아시나요?', '출근하는데 엘베 고장이라고 계단 걸어 올라오니까 \n 현기증 나더라고요.. 진짜 죽을맛... 내일은 해결되어 있겠죠?', '2022-04-20 11:21:58', 7, null);

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 고장 실화임?','아니 안그래도 운동부족인데 아침부터 계단으로 출근하려니까 현기증 나서 죽겠음... 제발 빨리 고쳐줘요... ', '2022-04-20 15:21:58', 11, null );

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','XX치킨 신메뉴 나왔다','여기 사장님이 우리회사 출신이라 사원증 걸고 가면 소소한 서비스 줘서 안그래도 자주 갔는데 \n 어제 가보니까 신메뉴 나왔는데 진짜 대존맛이더라 다들 한번 가보3', '2022-04-20 11:24:40', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','아이브 갓기들 이번 노래 너무 좋다','현생에 치여서 힘들다가도 우리 갓기들 보면 힘나잔아 나르시즘 컨셉 누구 아이디어야 적게 일하고 많이 버세요', '2022-04-21 15:38:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','다음주에 첫 출장 가는데 뭐뭐 준비해야 하나요?','첫 출장이라 좀 떨리는데... 뭐뭐 준비하면 되려나요ㅠㅠ', '2022-04-21 12:21:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','익신입 오늘 대형사고 침...','하.. 진짜 너무 대형사고라 눈물도 안나오네요... 원래 신입때는 다 이런가요..?', '2022-04-25 16:42:58', 11, null );

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 수리 언제 끝나는지 아시나요?', '출근하는데 엘베 고장이라고 계단 걸어 올라오니까 \n 현기증 나더라고요.. 진짜 죽을맛... 내일은 해결되어 있겠죠?', '2022-04-20 11:21:58', 7, null);

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1001','엘레베이터 고장 실화임?','아니 안그래도 운동부족인데 아침부터 계단으로 출근하려니까 현기증 나서 죽겠음... 제발 빨리 고쳐줘요... ', '2022-04-20 15:21:58', 11, null );

INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','XX치킨 신메뉴 나왔다','여기 사장님이 우리회사 출신이라 사원증 걸고 가면 소소한 서비스 줘서 안그래도 자주 갔는데 \n 어제 가보니까 신메뉴 나왔는데 진짜 대존맛이더라 다들 한번 가보3', '2022-04-20 11:24:40', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1002','아이브 갓기들 이번 노래 너무 좋다','현생에 치여서 힘들다가도 우리 갓기들 보면 힘나잔아 나르시즘 컨셉 누구 아이디어야 적게 일하고 많이 버세요', '2022-04-21 15:38:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','다음주에 첫 출장 가는데 뭐뭐 준비해야 하나요?','첫 출장이라 좀 떨리는데... 뭐뭐 준비하면 되려나요ㅠㅠ', '2022-04-21 12:21:58', 11, null );
INSERT INTO nonNameBoard (emp_id, nonName_title, nonName_content, nonName_date, nonName_read_count, nonName_file )
VALUES ('1003','익신입 오늘 대형사고 침...','하.. 진짜 너무 대형사고라 눈물도 안나오네요... 원래 신입때는 다 이런가요..?', '2022-04-25 16:42:58', 11, null );
commit;
select * from nonNameBoard order by nonName_no desc;
update nonNameBoard set  emp_id = 1001 where nonName_no = 28;
alter table nonNameBoard  change nonName_date nonName_date timestamp not null default current_timestamp;
alter table nonNameBoard alter column nonName_date drop default;