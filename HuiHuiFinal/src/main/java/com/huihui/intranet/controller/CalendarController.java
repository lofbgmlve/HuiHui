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

import com.huihui.intranet.domain.Calendar;
import com.huihui.intranet.service.CalendarService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CalendarController {

		@Autowired
		private CalendarService calendarService;
		
		public void setCalendarService(CalendarService calendarService) {
			this.calendarService = calendarService;
		}

		/* @RequestBody는 요청 본문으로 들어오는 JSON 형식의 문자열로 이루어진 요청 파라미터를
		 * Java 객체로 변환해 주는 설정이며 @ResponseBody는 컨트롤러에서 반환하는 Java 객체를
		 * JSON 형식의 문자열로 직렬화하여 응답 본문에 포함시키는 설정으로 이 두가지 모두 스프링이
		 * 제공하는 메시지 컨버터 기능을 사용하므로 jacson-databind 라이브러리를 의존설정 해야 한다.
		 **/
		
		@RequestMapping(value="/calendarEventList", method=RequestMethod.GET)
		public String calendarEventList(Model model, HttpSession session) throws Exception{
			
			String id = (String) session.getAttribute("id");
	         
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
	         
			List<Calendar> calendarEventList = calendarService.calendarEventList(id);
			
			ObjectMapper om = new ObjectMapper();
			String cList = om.writeValueAsString(calendarEventList);
			model.addAttribute("cList", cList);
			System.out.println("calendarEventList 1  - " + cList);
			return "calendar1";
		}
		
		
		@RequestMapping(value="/addCalendarEvent", method=RequestMethod.POST)
		@ResponseBody
		public List<Calendar> addCalendarEvent(Model model, @RequestBody Calendar calendar,
				HttpSession session) throws Exception {
			
			String id = (String) session.getAttribute("id");
	         
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
			// start 데이터는 년 월 일 시간 형식인 "yyyy-MM-dd HH:mm:ss"와 같이 되어 있어 공백 앞쪽만 추출
			String startDate = calendar.getStart().substring(0, calendar.getStart().indexOf(" "));
			System.out.println("addCalendarEvent - start : " + calendar.getStart());
			System.out.println("startDate : " + startDate);
			
			// 사용자가 추가한 Event(일정)을 DB에 추가
			calendarService.addCalendarEvent(calendar);

			// 새로 갱신된 EventList(일정 리스트)를 읽어와 JSON으로 응답
			List<Calendar> calendarEventList = calendarService.calendarEventList(id);
			
			return calendarEventList;
		}		
		
		/* Calendar에 출력한 event(일정) 리스트 요청을 처리하는 메서드 
		 * startDate가 속한 월에 대한 일정 리스트를 모델에 담아 뷰로 보낸다. 
		 **/
	
		
		@RequestMapping(value="/updateCalendarEvent", method=RequestMethod.POST)
		@ResponseBody
		public List<Calendar> updateCalendarEvent(Model model, @RequestBody Calendar calendar,
				HttpSession session) throws Exception {
			
			String id = (String) session.getAttribute("id");
	         
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
			calendarService.updateCalendarEvent(calendar);
			
			// start 데이터는 년 월 일 시간 형식인 "yyyy-MM-dd HH:mm:ss"와 같이 되어 있어 공백 앞쪽만 추출
			String startDate = calendar.getStart().substring(0, calendar.getStart().indexOf(" "));
			System.out.println("updateCalendarEvent - start : " + calendar.getStart());
			System.out.println("startDate : " + startDate);
			
			// 새로 갱신된 EventList(일정 리스트)를 읽어와 JSON으로 응답
			List<Calendar> calendarEventList = calendarService.calendarEventList(id);
			
			return calendarEventList;
		}
		
		
		@RequestMapping(value="/deleteCalendarEvent", method=RequestMethod.POST)
		@ResponseBody
		public List<Calendar> deleteCalendarEvent(Model model, @RequestBody Calendar calendar,
				HttpSession session) {
			
			String id = (String) session.getAttribute("id");
	         
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
	         
			calendarService.deleteCalendarEvent(calendar);
			
			// start 데이터는 년 월 일 시간 형식인 "yyyy-MM-dd HH:mm:ss"와 같이 되어 있어 공백 앞쪽만 추출
			String startDate = calendar.getStart().substring(0, calendar.getStart().indexOf(" "));
			System.out.println("deleteCalendarEvent - start : " + calendar.getStart());
			System.out.println("startDate : " + startDate);
			
			// 새로 갱신된 EventList(일정 리스트)를 읽어와 JSON으로 응답
			List<Calendar> calendarEventList = calendarService.calendarEventList(id);
			
			return calendarEventList;
		}
	   	
}


