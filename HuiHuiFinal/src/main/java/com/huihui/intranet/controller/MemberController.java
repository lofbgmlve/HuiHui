package com.huihui.intranet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huihui.intranet.domain.Emp;
import com.huihui.intranet.service.EmpService;


@Controller
public class MemberController {
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "HuiHui"; }
	 */
	
	private EmpService empService;
	
	
	@Autowired
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	@RequestMapping(value="/login")
	public String login(Model model, @RequestParam(value="employeeId", required=false, defaultValue="") String employeeId,
			@RequestParam(value="pass", required=false, defaultValue="") String pass,
			HttpSession session, HttpServletResponse response)
						throws ServletException, IOException {
		
		int result = empService.login(employeeId, pass);
		
		if(result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('존재하지 않는 사원번호 입니다.');");
			out.println(" history.back();");
			out.println("</script>");
			
			return null;
			
		} else if(result == 0) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호가 다릅니다.');");
			out.println(" location.href='loginForm'");
			out.println("</script>");
			return null;
			
		}
		
		Emp emp = empService.getEmp(employeeId);
		session.setAttribute("isLogin", true);		
		session.setAttribute("emp", emp);
		session.setAttribute("id",employeeId);
		System.out.println("emp.name : " + emp.geteName());
		System.out.println(employeeId);
		return "HuiHui";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:loginForm";
	}
	
	// 회원가입 폼에서 들어오는 요청을 처리하는 메서드
	@RequestMapping("/joinResult")
	public String joinResult(Model model, Emp emp,
				String employeeId, String eName, String pass, 
				String address1, String address2, 
				String dName, String deptNo, String position,
				String mobile1, String mobile2, String mobile3) {
	
	emp.setEmployeeId(employeeId);
	emp.seteName(eName);
	emp.setAddress1(address1);
	emp.setAddress2(address2);
	emp.setdName(dName);
	emp.setDeptNo(deptNo);
	emp.setPosition(position);
	emp.setPass(pass);
	emp.setTelNo(mobile1 + "-" + mobile2 + "-" + mobile3);
	
	empService.addEmp(emp);
	System.out.println("joinResult : " + emp.geteName());
	
	return "redirect:loginForm";
	}
}
