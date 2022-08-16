package com.huihui.intranet.controller;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.huihui.intranet.domain.Emp;
import com.huihui.intranet.domain.NonNameBoard;
import com.huihui.intranet.service.NonNameBoardService;


@Controller
public class HuiHuiController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "forward:loginForm";
	}
	
	
	 /* 취합 시작 */
	private NonNameBoardService nonNameBoardService;
	@Autowired
	public void setNonNameBoardService(NonNameBoardService nonNameBoardService) {
		this.nonNameBoardService = nonNameBoardService;
	}
	
	@RequestMapping(value= {"/nonNameBoardList"}, method=RequestMethod.GET)
	public String NonNameBoardList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum,
			@RequestParam(value="keyword", required=false, defaultValue="null")String keyword,
			@RequestParam(value="type", required=false, defaultValue="null")String type,
			HttpSession session) {
		
		Map<String, Object> modelMap = nonNameBoardService.nonNameBoardList(pageNum, type, keyword);
		
		Date now = new Date();
		model.addAttribute("now", now);
		model.addAllAttributes(modelMap);
		String emp_id = session.getId();
		model.addAttribute("emp_id",emp_id);
		System.out.println("익명게시판 리스트 컨트롤러 아이디 체크 용 : " + emp_id );
		return "NonNameBoard/nonNameBoardList";
	}
	
	@RequestMapping(value= {"/nonNameDetail"})
	public String nonNameDetail(Model model, int nonNameNo,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null")String type,
			@RequestParam(value="keyword", required=false, defaultValue="null")String keyword,
			HttpSession session, String employeeId)throws Exception {
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		NonNameBoard nonNameBoard = nonNameBoardService.getNonNameBoard(nonNameNo, true);
		Date now = new Date();
		
		model.addAttribute("now", now);
		model.addAttribute("nonNameBoard", nonNameBoard);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "NonNameBoard/nonNameDetail";
	}
	
	@RequestMapping(value="/nonNameWriteProcess", method=RequestMethod.POST)
	public String insertNonName(NonNameBoard nonNameBoard) {
		nonNameBoardService.insertNonNameBoard(nonNameBoard);
		
		return "redirect:nonNameBoardList";
	}

	@RequestMapping(value= {"/update"}, method=RequestMethod.GET)
	public String updateNonName(Model model, int nonNameNo) {
		NonNameBoard nonNameBoard = nonNameBoardService.isIdCheck(nonNameNo);
		System.out.println("컨트롤러 업데이트 들어가는 no : " + nonNameNo);
		model.addAttribute(nonNameBoard);
		return "NonNameBoard/nonNameUpdateForm";
	}
	
	@RequestMapping(value="/nonNameUpdate", method=RequestMethod.POST)
	public String updateNonName(NonNameBoard nonNameBoard) {
		
		System.out.println("컨트롤러 업뎃 완료 no : " + nonNameBoard.getNonNameNo());
		System.out.println("컨트롤러 없뎃 완료 ID : " + nonNameBoard.getEmpId());		
		
		nonNameBoardService.updateNonNameBoard(nonNameBoard);
		
		return "redirect:nonNameBoardList";
	}
	
	@RequestMapping(value= {"/delete"}, method=RequestMethod.GET)
	public String deleteNonName(int nonNameNo) {
		nonNameBoardService.deleteNonNameBoard(nonNameNo);
		return "redirect:nonNameBoardList";
	}
}
