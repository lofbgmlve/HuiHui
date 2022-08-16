package com.huihui.intranet.dao;

import java.util.ArrayList;
import java.util.List;

import com.huihui.intranet.domain.CalendarUser;

public interface CalendarUserDao {
	
		public List<CalendarUser> calendarUserEventList(String id);

	 	
	 	
	 	public void addCalendarUserEvent(CalendarUser caledarUser);
	 	
	 	public void updateCalendarUserEvent ( CalendarUser calendarUser);
	 	
	 	public void deleteCalendarUserEvent(CalendarUser calendarUser);
	
	 	
}
