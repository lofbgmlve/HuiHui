package com.huihui.intranet.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.CalendarUser;

@Repository
public class CalendarUserDaoImpl implements CalendarUserDao {

	
	private final String NAME_SPACE ="com.huihui.intranet.mapper.CalendarUserMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override     //  일정 전체 뿌려주기 
	public  List <CalendarUser> calendarUserEventList(String id){
		return sqlSession.selectList(NAME_SPACE +".calendarUserEventList",id);
	}


	
	@Override
	public void addCalendarUserEvent(CalendarUser calendarUser) {
		sqlSession.selectList(NAME_SPACE + ".addCalendarUserEvent", calendarUser);
		
	}
	
	
	@Override
	public void updateCalendarUserEvent(CalendarUser calendarUser) {
		sqlSession.selectList(NAME_SPACE + ".updateCalendarUserEvent" , calendarUser);
		
	}


	@Override
	public void deleteCalendarUserEvent(CalendarUser calendarUser) {
		sqlSession.selectList(NAME_SPACE +".deleteCalendarUserEvent", calendarUser.getNo());
		
	}




	
	
	
	
	
	
	
	

}
