package com.huihui.intranet.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huihui.intranet.domain.CalendarMeeting;
import com.huihui.intranet.service.CalendarMeetingService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller 
public class CalendarMeetingController {
	
	@Autowired
	private CalendarMeetingService calendarmeetingService;
	
	public void setCalendarMeetingService(CalendarMeetingService calendarmeetingService) {
		this.calendarmeetingService = calendarmeetingService;
	}
	
	// 요거는 이담에 테스트
	@RequestMapping(value="/calendarmeetingEventList", method=RequestMethod.GET)
	public String calendarmeetingEventList(Model model,HttpSession session) throws Exception{
		
		String id = (String) session.getAttribute("id");
		 if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
		
		List<CalendarMeeting> calendarmeetingEventList = calendarmeetingService.calendarmeetingEventList(id);
		
		ObjectMapper om = new ObjectMapper();
		String cList = om.writeValueAsString(calendarmeetingEventList);
		model.addAttribute("cList", cList);
		System.out.println("calendarmeetingEventList - cList : " + cList);
		return "calendarmeeting";		
	}
	
	
		
	@RequestMapping(value="/addCalendarMeetingEvent", method=RequestMethod.POST)
	@ResponseBody
	public List<CalendarMeeting> addCalendarMeetingEvent(Model model, @RequestBody CalendarMeeting calendarmeeting,
							HttpSession session) throws Exception {
		String startDate = calendarmeeting.getStart().substring(0, calendarmeeting.getStart().indexOf(" "));
		System.out.println("addCalendarMeetingEvent - start : " + calendarmeeting.getStart());
		System.out.println("startDate : " + startDate);
		
		
		String id = (String) session.getAttribute("id");
		 if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
		
		
		calendarmeetingService.addCalendarMeetingEvent(calendarmeeting);
		
		List<CalendarMeeting> calendarmeetingEventList = calendarmeetingService.calendarmeetingEventList(id);
		return calendarmeetingEventList;
	}
	
	@RequestMapping(value="/updateCalendarMeetingEvent", method=RequestMethod.POST)
	@ResponseBody 
	public List<CalendarMeeting> updateCalendarMeetingEvent(Model model, @RequestBody CalendarMeeting calendarmeeting,
								HttpSession session) throws Exception {
		
		calendarmeetingService.updateCalendarMeetingEvent(calendarmeeting);
		
		String id = (String) session.getAttribute("id");
		 if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
		
		String startDate = calendarmeeting.getStart().substring(0, calendarmeeting.getStart().indexOf(" "));
		System.out.println("updateCalendarEvent - start : " + calendarmeeting.getStart());
		System.out.println("startDate : " + startDate);
		
		List<CalendarMeeting> calendarmeetingEventList = calendarmeetingService.calendarmeetingEventList(id);
		
		return calendarmeetingEventList;
	}
	
	
	@RequestMapping(value="/deleteCalendarMeetingEvent", method=RequestMethod.POST)
	@ResponseBody
	public List<CalendarMeeting> deleteCalendarMeetingEvent(Model model, 
			@RequestBody CalendarMeeting calendarmeeting, HttpSession session) {
		
		calendarmeetingService.deleteCalendarMeetingEvent(calendarmeeting);
		
		String id = (String) session.getAttribute("id");
		 if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
		String startDate = calendarmeeting.getStart().substring(0, calendarmeeting.getStart().indexOf(" "));
		System.out.println("deleteCalendarMeetingEvent - start : " + calendarmeeting.getStart());
		System.out.println("startDate : " + startDate);
		
		List<CalendarMeeting>  calendarmeetingEventList = calendarmeetingService.calendarmeetingEventList(id);
		return calendarmeetingEventList;
	}
	
	
}
	
