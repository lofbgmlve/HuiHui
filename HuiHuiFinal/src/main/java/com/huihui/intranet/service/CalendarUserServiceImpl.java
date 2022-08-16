package com.huihui.intranet.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.CalendarUserDao;
import com.huihui.intranet.domain.CalendarUser;
import com.huihui.intranet.service.CalendarUserService;
@Service
public class CalendarUserServiceImpl implements CalendarUserService {

	
	@Autowired
	private CalendarUserDao calendarUserDao;
	
	public void setCalendarUserDao(CalendarUserDao calendarUserDao) {
		this.calendarUserDao = calendarUserDao;
	}

											
	public List<CalendarUser> calendarUserEventList(String id){
		return calendarUserDao.calendarUserEventList(id);
	}

	




	@Override
	public void addCalendarUserEvent(CalendarUser calendarUser) {
		calendarUserDao.addCalendarUserEvent(calendarUser);
		
	}


	@Override
	public void updateCalendarUserEvent(CalendarUser calendarUser) {
		calendarUserDao.updateCalendarUserEvent(calendarUser);
	}


	@Override
	public void deleteCalendarUserEvent(CalendarUser calendarUser) {
		calendarUserDao.deleteCalendarUserEvent(calendarUser);
		
	}

}
