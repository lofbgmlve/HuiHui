package com.huihui.intranet.dao;

import java.util.List;

import com.huihui.intranet.domain.CalendarMeeting;

public interface CalendarMeetingDao {
	
	public List<CalendarMeeting> calendarmeetingEventList (String id);
	
	
	public void addCalendarMeetingEvent(CalendarMeeting calendarmeeting);
	
	public void updateCalendarMeetingEvent(CalendarMeeting calendarmeeting);
	
	public void deleteCalendarMeetingEvent(CalendarMeeting calendarmeeting);
}
