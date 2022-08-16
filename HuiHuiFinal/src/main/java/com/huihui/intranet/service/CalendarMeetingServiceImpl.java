package com.huihui.intranet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.CalendarMeetingDao;
import com.huihui.intranet.domain.CalendarMeeting;

@Service 
public class CalendarMeetingServiceImpl implements CalendarMeetingService {

	@Autowired 
	private CalendarMeetingDao calendarmeetingDao;
	
	public void setCalendarMeetingDao(CalendarMeetingDao calendarmeetingDao) {
		this.calendarmeetingDao = calendarmeetingDao;
	}
	
	public List<CalendarMeeting> calendarmeetingEventList(String id) {
		return calendarmeetingDao.calendarmeetingEventList(id);
	}
	
	
	
	public void addCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		calendarmeetingDao.addCalendarMeetingEvent(calendarmeeting);
	}

	@Override
	public void updateCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		calendarmeetingDao.updateCalendarMeetingEvent(calendarmeeting);
	}

	@Override
	public void deleteCalendarMeetingEvent(CalendarMeeting calendarmeeting) {
		calendarmeetingDao.deleteCalendarMeetingEvent(calendarmeeting);
	}

}
