package com.huihui.intranet.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;
import com.huihui.intranet.domain.Emp;
import com.huihui.intranet.service.CommuteService;
import Exception.AlreadyAttend;
import Exception.FailAttendCheck;
import Exception.FailInsertCommute;
import Exception.FailUpdateCommute;
import Exception.PasswordNotMatch;
import Exception.UserNotFoundException;
import com.huihui.intranet.domain.User;
import com.huihui.intranet.service.EmpService;

@Controller
public class AttendController {

	@Autowired
	private EmpService empservice;

	@Autowired
	private CommuteService commuteService;
	
	// 조회
	public void setCommuteService(CommuteService commuteService) {
		this.commuteService = commuteService;
	}

	// 출근하기
	@RequestMapping("/attendForm")
	public String attend(Model model, HttpServletRequest request,
			HttpSession session) {

		String employeeId = (String) session.getAttribute("id");
		/*
		 * // 회원번호 저장 String employeeId = login.getEmployeeId();
		 */

		// Commute객체에 회원번호 셋팅
		Commute commute = new Commute();
		commute.setEmployeeId(employeeId);

		try {
			// 출퇴근 insert
			commuteService.commuteInsert(employeeId);

			return "Success/pageSuccess";
		} catch (FailInsertCommute e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";

		} catch (AlreadyAttend e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";
		}

	}

	// 퇴근폼 요청
	@RequestMapping("/leaveForm")
	public String leave(Model model, HttpServletRequest request,
			HttpSession session) {

		String employeeId = (String) session.getAttribute("id");
		/*
		 * // 회원번호 저장 String employeeId = login.getEmployeeId();
		 */

		// Commute객체에 회원번호 셋팅
		Commute commute = new Commute();
		commute.setEmployeeId(employeeId);

		try {
			// 퇴근 update
			commuteService.checkAndUpdate(employeeId);
			return "Success/pageSuccess";

		} catch (FailAttendCheck e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";

		} catch (FailUpdateCommute e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";
		}
	}
	
	@RequestMapping(value= {"/attendList", "list"}, method=RequestMethod.GET)
	public String attendList(Model model) {
		
		// 출퇴근 리스트
		List<Commute> aList = commuteService.attendList();
		
		model.addAttribute("aList", aList);
		System.out.println("aList : " + aList);
		
		return "attendList";
	}

	// 달 이동
	@RequestMapping(value = "/moveCommute.do", method = RequestMethod.GET)
	public String moveCommute(Model model, HttpServletRequest request) {

		// 세션에 저장된 로그인 정보를 가져옴
		Emp login = (Emp) request.getSession().getAttribute("login");

		// 회원번호 저장
		String employeeId = login.getEmployeeId();

		try {
			String checkDate = request.getParameter("checkDate");

			String toYear = checkDate.substring(0, 4);
			String toMonth = checkDate.substring(5, 7);

			// DateData에 셋팅
			DateData dateData = new DateData();
			dateData.setToYear(toYear);
			dateData.setToMonth(toMonth);
			dateData.setemployeeId(employeeId);

			// 출근일을 가져온후 main에 보낸다.
			List<Commute> comm = commuteService.Datecompare(dateData);
			model.addAttribute("comm", comm);
			return "main";
		} catch (NullPointerException e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			return "Fail/pageFail";
		}
	}

	/*
	 * // 로그인
	 * 
	 * @RequestMapping("/login.do") public String login(Model model,
	 * HttpServletRequest request, @RequestParam("id") String id,
	 * 
	 * @RequestParam("pw") String pw) { try { // 아이디와 비밀번호확인후 로그인 Emp emp =
	 * empService.login(id, pw);
	 * 
	 * // 로그인후 세션에 저장 request.getSession().setAttribute("loginUser", user);
	 * 
	 * // 세션에 저장한 User정보중 회원번호를 가져옴 User loginUser = (User)
	 * request.getSession().getAttribute("loginUser"); int userNo =
	 * loginUser.getUserNo();
	 * 
	 * // 현재 년,월을 가져옴 Calendar cal = Calendar.getInstance(); int year =
	 * cal.get(cal.YEAR); int month = cal.get(cal.MONTH) + 1;
	 * 
	 * // 형변환 String toYear = Integer.toString(year); String toMonth =
	 * Integer.toString(month);
	 * 
	 * // DateData에 셋팅 DateData dateData = new DateData();
	 * dateData.setToYear(toYear); dateData.setToMonth(toMonth);
	 * dateData.setUserNo(userNo);
	 * 
	 * // 출근날짜를 화면에 보냄 List<Commute> commutes =
	 * commuteService.Datecompare(dateData); model.addAttribute("commutes",
	 * commutes); return "main";
	 * 
	 * } catch (UserNotFoundException e) { e.printStackTrace();
	 * request.setAttribute("error", e); return "Fail/pageFail";
	 * 
	 * } catch (PasswordNotMatch e) { e.printStackTrace();
	 * request.setAttribute("error", e); return "Fail/pageFail"; } }
	 */
}