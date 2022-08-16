use spring;
DROP TABLE IF EXISTS calendar_user;
CREATE TABLE IF NOT EXISTS calendar_user(
no INTEGER AUTO_INCREMENT PRIMARY KEY,
id VARCHAR(10) NOT NULL,
title VARCHAR (30),
description  VARCHAR(200),
StartDate timestamp,
EndDate timestamp,
TextColor VARCHAR(50),
backgroundColor varchar(50),
CONSTRAINT calendar_user FOREIGN KEY(id) REFERENCES emptable(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM calendar_user WHERE id= 1001; 

INSERT INTO calendar_user (id, title, description, StartDate, EndDate, TextColor, backgroundColor) VALUES 
('1001','경영전략회의','회의', '2022-04-17 13:00:00', '2022-04-17 14:00:00','#FFFFFF', '#FFC0CB'),
('1002','경영설명회 참석','외부', '2022-05-18 10:30:00', '2022-05-18 12:00:00', '#FFFFFF', '#FFC0CB'),
('1003', '보고자료 최종제출','보고서제출', '2022-05-22 19:00:00', '2022-05-22 22:00:00','#FFFFFF', '#FFC0CB'),
('1005', '개발회의','제안서 보고하기', '2022-05-02 15:30:00', '2022-05-02 16:00:00', '#FFFFFF', '#FFC0CB'),
('1007','이슈사항보고','미팅문제 보고', '2022-05-03 14:00:00', '2022-05-03 18:00:00','#FFFFFF', '#FFC0CB'),
('1001','비상경영회의','회의', '2022-04-15 13:00:00', '2022-04-15 14:00:00','#FFFFFF', '#FFC0CB'),
('1002','임원회의참석','신입 계약서 작성', '2022-05-18 10:30:00', '2022-05-18 12:00:00', '#FFFFFF', '#FFC0CB'),
('1003', '향후계획안','기획안제출 ', '2022-05-20 19:00:00', '2022-05-20 22:00:00','#FFFFFF', '#FFC0CB'),
('1005', '모델링','개발회의', '2022-05-02 15:30:00', '2022-05-02 16:00:00', '#FFFFFF', '#FFC0CB'),
('1006', '디자인회의','시안확인', '2022-05-09 15:30:00', '2022-05-09 16:00:00', '#FFFFFF', '#FFC0CB'),
('1007','거래처미팅','사업제안서 보고미팅', '2022-05-04 14:00:00', '2022-05-04 16:00:00','#FFFFFF', '#FFC0CB');

-- 해당 날짜의 전달의 마지막날 부터~ 해당 당의 마지막 날까지 !!  AND id 값이 같을 때 ! 
SELECT * FROM calendar_user WHERE StartDate > LAST_DAY ('2022-04-25' - INTERVAL 1 MONTH) AND EndDate <= TIMESTAMP(CONCAT(LAST_DAY ('2022-04-25 23:59'))) AND id='1001';
-- 
SELECT * FROM calendar_user WHERE StartDate >= LAST_DAY('2022-04-25') AND 1001; 

SELECT * FROM calendar_user WHERE StartDate > LAST_DAY ('2022-04-25' - INTERVAL 1 MONTH ) AND EndDate <= LAST_DAY ('2022-04-25 23:59') AND 1001;
commit;
SELECT * fROM calendar;

select * from calendar_user ORDER BY no;
SELECT * FROM calendar ORDER BY no ;

SELECT LAST_DAY('2022-04-01' - INTERVAL 2 MONTH) FROM dual;
SELECT LAST_DAY('2022-04-01'-  INTERVAL 1 MONTH) FROM dual;
SELECT LAST_DAY('2022-04-01');

SELECT * FROM calendar_user LAST_DAY ('2022-04-01' - INTERVAL 1 MONTH) FROM dual;

SELECT * FROM calendar_user WHERE StartDate> (SELECT LAST_DAY ('2022-04-01' - INTERVAL 2 MONTH )) AND EndDate <=(SELECT LAST_DAY('2022-04-01' - INTERVAL 1 MONTH)) ;