package com.huihui.intranet.service;

import java.util.List;

import com.huihui.intranet.domain.CalendarMeeting;

public interface CalendarMeetingService {
	
	public List<CalendarMeeting> calendarmeetingEventList (String id);
	
	
	public void addCalendarMeetingEvent(CalendarMeeting calendarmeeting);
	
	public void updateCalendarMeetingEvent(CalendarMeeting calendarmeeting);
	
	public void deleteCalendarMeetingEvent(CalendarMeeting calendarmeeting);

}
