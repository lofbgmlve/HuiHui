# HuiHui
Second Project 사내인트라넷
Spring Mvc 프로젝트 구축
DBMS - MySQL 

# 개인구현내용
- FUllCalendar API 이용
- 주요일정 : 관리자 작성* 수정* 삭제 권한
- 개인일정 : 로그인한 아이디의 일정만 확인 가능.
- custom Button을 추가로 만들어, 일정추가 가능하도록 event처리
- `일정추가` 버튼을 누르면 modal창으로 띄워 일정 날짜, 시간, 색상, 내용 추가 가능
- 등록되어 있는 일정을 클릭하면 수정할 수 있도록 상세내용을 받아오며, 추가하기버튼이 아닌 수정하기, 삭제하기 버튼 활성화

src/main/java
com.huihui.intranet.controller
CalendarUserController.java
CalendarController

com.huihui.intranet.dao
CalendarDao.java
CalendarDaoImpl.java
CalendarUserDao.java
CalendarUserDaoImpl.java

com.huihui.intranet.domain
Calendar.java
CalendarUser.java

com.huihui.intranet.service
CalendarService.java
CalendarServiceImpl.java
CalednarUserService.java
CalendarUserServiceImpl.java

src/main/resources
repository.mappers
CalendarMapper.xml
CalendarUserMapper.xml

