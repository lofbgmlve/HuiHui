use spring;

DROP TABLE IF EXISTS depttable;
CREATE TABLE IF NOT EXISTS depttable(
	deptno VARCHAR(10) NOT NULL PRIMARY KEY,
    d_name VARCHAR(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO depttable VALUES('100', '인사팀');
INSERT INTO depttable VALUES('101', '경영팀');
INSERT INTO depttable VALUES('102', '개발팀');
INSERT INTO depttable VALUES('103', '디자인팀');
INSERT INTO depttable VALUES('104', '영업팀');
commit;

select * from depttable;

DROP TABLE IF EXISTS emptable;
CREATE TABLE IF NOT EXISTS emptable(
	employee_id VARCHAR(10) NOT NULL PRIMARY KEY,
	ename VARCHAR(50) NOT NULL,
	pass VARCHAR(20) NOT NULL,
    d_name VARCHAR(10) NOT NULL,
    deptno INTEGER(10) NOT NULL,
    position VARCHAR(10) NOT NULL,
    address1 VARCHAR(80) NOT NULL,
    address2 VARCHAR(60) NOT NULL,
	tel_no VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 사원 정보 추가
# 디자인팀, 개발팀, 영업팀, 경영팀 
INSERT INTO emptable VALUES('1000', '원 진', '1111', '인사팀', '100', '대표', '경기도 부천시','원미동 43-1','010-1111-1111');
INSERT INTO emptable VALUES('1001', '정효선', '1234', '경영팀', '101', '사장', '경기도 부천시 오정구', '원종동 145-12', '010-2505-6510');
INSERT INTO emptable VALUES('1002', '곽유희', '1235', '경영팀', '101', '이사', '인천특별시 서구', '청라동 1-1394', '010-3425-2342');
INSERT INTO emptable VALUES('1003', '현정민', '1236', '경영팀', '101', '이사', '서울특별시 중구', '예장동 5-84', '010-6543-2789');
INSERT INTO emptable VALUES('1004', '오규탁', '1237', '개발팀', '102', '부장', '서울특별시 강남구', '논현동 207-4', '010-2424-5454');
INSERT INTO emptable VALUES('1005', '홍진성', '1238', '개발팀', '102', '부장', '서울특별시 구로구', '구로디지털단지 86-5', '010-7743-0236');
INSERT INTO emptable VALUES('1006', '곽승환', '1239', '디자인팀', '103', '부장', '서울특별시 서초구', '염곡동 90-9', '010-6914-4209');
INSERT INTO emptable VALUES('1007', '이은혜', '1240', '영업팀', '104', '부장', '경기도 안양시 동안구', '비산동 1138', '010-2341-1541');
INSERT INTO emptable VALUES('1008', '홍길동', '1241', '개발팀', '102', '차장', '경기도 시흥시', '조남동 720', '010-1588-1004');
INSERT INTO emptable VALUES('1009', '강감찬', '1242', '개발팀', '102', '차장', '경기도 안산시 상록구', '수암동 497-1', '010-2345-6789');
INSERT INTO emptable VALUES('1010', '이효리', '1243', '디자인팀', '103', '차장', '서울특별시 영등포구', '대림동 1056-28', '010-1313-3131');
INSERT INTO emptable VALUES('1011', '애나킴', '1244', '영업팀', '104', '차장', '서울특별시 구로구', '구로동 536-69', '010-4246-5348');
INSERT INTO emptable VALUES('1012', '박단단', '1245', '개발팀', '102', '대리', '서울특별시 양천구', '목동 913-4', '010-6088-7777');
INSERT INTO emptable VALUES('1013', '송강호', '1246', '디자인팀', '103', '대리', '서울특별시 영등포구', '문래동3가 54', '010-9090-8080');
INSERT INTO emptable VALUES('1014', '이승기', '1247', '개발팀', '102', '주임', '서울특별시 마포구', '성산동 161-7', '010-3454-4885');
INSERT INTO emptable VALUES('1015', '김승연', '1248', '영업팀', '104', '주임', '경기도 고양시 덕양구', '행신동 725', '010-7890-4321');
INSERT INTO emptable VALUES('1016', '정찬성', '1249', '개발팀', '102', '사원', '서울특별시 영등포구', '여의도동 40-2', '010-5757-7575');
INSERT INTO emptable VALUES('1017', '서현진', '1250', '개발팀', '102', '사원', '서울특별시 강서구', '방화동 319-6', '010-3231-1221');
INSERT INTO emptable VALUES('1018', '김진희', '1251', '디자인팀', '103', '사원', '경기도 김포시', '사우동 940', '010-6485-3415');
INSERT INTO emptable VALUES('1019', '송아현', '1252', '영업팀', '104', '사원', '인천광역시 계양구', '귤현동 498-4', '010-9632-2058');
INSERT INTO emptable VALUES('1020', '이기윤', '1253', '영업팀', '104', '사원', '서울특별시 관악구', '봉천동 869-3', '010-1346-5252');
commit;

select * from emptable;