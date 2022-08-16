package com.huihui.intranet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.CalendarMeeting;

@Repository 
public class CalendarMeetingDaoImpl implements CalendarMeetingDao {
	
	private final String NAME_SPACE = "com.huihui.intranet.mapper.CalendarMeetingMapper";

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CalendarMeeting> calendarmeetingEventList(String id) {
		return sqlSession.selectList(NAME_SPACE + ".calendarmeetingEventList", id);
	}
	
	@Override
	public void addCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		sqlSession.selectList(NAME_SPACE + ".addCalendarMeetingEvent", calendarmeeting);
	}

	@Override
	public void updateCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		sqlSession.selectList(NAME_SPACE + ".updateCalendarMeetingEvent", calendarmeeting); 
	}

	@Override
	public void deleteCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		sqlSession.selectList(NAME_SPACE + ".deleteCalendarMeetingEvent", calendarmeeting.getNo());
	}

}
