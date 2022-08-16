package com.huihui.intranet.service;

import java.util.List;

import com.huihui.intranet.domain.Calendar;

public interface CalendarService {


	// DAO를 이용해 startDate 날짜가 포함된 월의 event(일정) 리스트를 읽어와 반환하는 메서드
	
	
	public List<Calendar> calendarEventList(String id);
	
	
	
	// 새로운 일정을 추가하는 메서드
	public void addCalendarEvent (Calendar calendar); 
	
	public void updateCalendarEvent (Calendar calendar); 
		
	public void deleteCalendarEvent (Calendar calendar); 
	
}
