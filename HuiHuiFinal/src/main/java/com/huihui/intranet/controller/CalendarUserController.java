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

import com.huihui.intranet.domain.CalendarUser;
import com.huihui.intranet.service.CalendarUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CalendarUserController {

		@Autowired
		private CalendarUserService calendarUserService;
		
		public void setCalendarUserService(CalendarUserService calendarUserService) {
			this.calendarUserService = calendarUserService;
		}

		// 전체 캘린더 일정 가지고 오기
		@RequestMapping(value="/calendarUserEventList", method=RequestMethod.GET)
	    public String calendarUserEventList(Model model, HttpSession session) throws Exception{
	         
	       String id = (String) session.getAttribute("id");
	         
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	            System.out.println("id ---- " + id );
	         } else {
	            return null;
	         }
	         
	         List<CalendarUser> calendarUserEventList = calendarUserService.calendarUserEventList(id);
	         
	         ObjectMapper om = new ObjectMapper();
	         String cUList = om.writeValueAsString(calendarUserEventList);
	         model.addAttribute("cUList", cUList);
	         System.out.println("calendarUserEventList1-- " + cUList);
	         return "calendarUser";
	      }

		
		
		
		
		
		
		
		// 일정추가
		@RequestMapping(value="/addCalendarUserEvent", method=RequestMethod.POST)
		@ResponseBody
		public List<CalendarUser>addCalendarUserEventList(Model model, @RequestBody CalendarUser calendarUser,
				HttpSession session, String id)
								throws Exception{
			

	        String employeeId = id;
	         if(session.getAttribute("id") != null) {         
	           id = (String) session.getAttribute("id");
	        } else {
	          employeeId = "1001";
	        }
	         
			
			String startDate = calendarUser.getStart().substring(0, calendarUser.getStart().indexOf(" "));
			System.out.println("addCalendaruserEvent --- start" + calendarUser.getStart());
			System.out.println("startDate ----" + startDate);
			
			calendarUserService.addCalendarUserEvent(calendarUser);
			
			List<CalendarUser> calendarUserEventList = calendarUserService.calendarUserEventList(id);
			System.out.println("일정추가 함 ! ");
			return calendarUserEventList;
		}
		
		
		
		// 일정 수정 
	    @RequestMapping(value="/updateCalendarUserEvent", method=RequestMethod.POST)
	    @ResponseBody
	    public List<CalendarUser> updateCalendarUserEventList(Model model,
	             @RequestBody CalendarUser calendarUser, HttpSession session, String id)throws Exception {
	         
	    	String employeeId = id;
	    	
	    	if(session.getAttribute("id") != null) {         
	           id = (String) session.getAttribute("id");
	        } else {
	           employeeId = "1001";
	        }

			calendarUserService.updateCalendarUserEvent(calendarUser);
			String startDate = calendarUser.getStart().substring(0,calendarUser.getStart().indexOf(" "));
			System.out.println("updateUserCalendarEvent ---- " + calendarUser.getStart());
			System.out.println("startDate ----- " + startDate);
			
			List<CalendarUser> calendarUserEventList = calendarUserService.calendarUserEventList(id);
			System.out.println(" 일정 수정  ");
			return calendarUserEventList;
			
		}
		
		
	    // 일정 삭제하기
	    @RequestMapping(value="/deleteCalendarUserEvent" , method=RequestMethod.POST)
	    @ResponseBody
	    public List<CalendarUser> deleteCalendarUserEvent(Model model,
	          @RequestBody CalendarUser calendarUser, HttpSession session, String id) throws Exception{
	         
	         
	        String employeeId = id;
	        if(session.getAttribute("id") != null) {         
	          id = (String) session.getAttribute("id");
	        } else {
	           employeeId = "1001";
	        }
	         
	         
	         calendarUserService.deleteCalendarUserEvent(calendarUser);
	         
	         String startDate = calendarUser.getStart().substring(0, calendarUser.getStart().indexOf(" "));
	         System.out.println("deleteCalendatEvent ---- " + calendarUser.getStart());
	         System.out.println("startDate ----" + startDate);
	         
	         List<CalendarUser> calendarUserEventList = calendarUserService.calendarUserEventList(id);
	         System.out.println("일정 삭제 ");
	         return calendarUserEventList;
	      }

		
		
	      @RequestMapping(value="/calendarUserMonthMove", method=RequestMethod.POST)
	      @ResponseBody
	      public List<CalendarUser> calendarUserMonthMove(Model model,
	               @RequestParam(value="startDate" , required=false,  defaultValue="")String startDate,
	                     HttpSession session, String id)throws Exception{
	         
	         String employeeId = id;
	         if(session.getAttribute("id") != null) {         
	            id = (String) session.getAttribute("id");
	         } else {
	            employeeId = "1001";
	         }
	         
	         System.out.println("startDate1 --  " + startDate);
	         if(startDate.equals("")) {
	            Date d = new Date();
	            startDate = String.format("%1$sY-%1$tm-%1$td", d);
	         }
	         System.out.println("startDate2 -- " + startDate);
	         List<CalendarUser>calendarUserEventList = calendarUserService.calendarUserEventList(id);
	         return calendarUserEventList;
	      }

		
	   	
}


