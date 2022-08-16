package com.huihui.intranet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	
	private final String NAME_SPACE ="com.huihui.intranet.mapper.CalendarMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Calendar>calendarEventList(String id){
		return sqlSession.selectList(NAME_SPACE + ".calendarEventList", id);
	}

	// DB에서 startDate 날짜가 포함된 월의 event(일정) 리스트를 읽어와 반환하는 메서드
	
	
	public void addCalendarEvent(Calendar calendar) {
		sqlSession.selectList(NAME_SPACE + ".addCalendarEvent" , calendar);
	}

	@Override
	public void updateCalendarEvent(Calendar calendar) {		
		sqlSession.selectList(NAME_SPACE + ".updateCalendarEvent" , calendar);
	}

	@Override
	public void deleteCalendarEvent(Calendar calendar) {		
		sqlSession.selectList(NAME_SPACE + ".deleteCalendarEvent" , calendar.getNo());
	}

}
