package com.huihui.intranet.service;

import java.util.ArrayList;
import java.util.List;

import com.huihui.intranet.domain.CalendarUser;

public interface CalendarUserService {

	public List<CalendarUser> calendarUserEventList(String id);
	

	public void addCalendarUserEvent(CalendarUser calendarUser);
	
	public void updateCalendarUserEvent(CalendarUser calendarUser);
	
	public void deleteCalendarUserEvent(CalendarUser calendarUser);
	
	
	
}
