package com.huihui.intranet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.CalendarDao;
import com.huihui.intranet.domain.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	
	@Autowired
	private CalendarDao calendarDao;
	
	
	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}

	public List<Calendar> calendarEventList(String id	){
		return calendarDao.calendarEventList(id);
	}

	// DAO를 이용해 startDate 날짜가 포함된 월의 event(일정) 리스트를 읽어와 반환하는 메서드
	
	
	public void addCalendarEvent(Calendar calendar) {
		calendarDao.addCalendarEvent(calendar);
	}


	@Override
	public void updateCalendarEvent(Calendar calendar) {
		calendarDao.updateCalendarEvent(calendar);		
	}


	@Override
	public void deleteCalendarEvent(Calendar calendar) {
		calendarDao.deleteCalendarEvent(calendar);
	}



	
	
	

}
