package com.huihui.intranet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huihui.intranet.service.NonNameBoardService;

@Controller
public class NonNameAjaxController {

	@Autowired
	NonNameBoardService nonNameService;
	
	@RequestMapping("/thank.ajax")
	@ResponseBody
	public Map<String, Object> thank(int nonNameNo,	String nonRecommend, String addAndCancle){
		System.out.println("에이작스 컨트롤러 : " +  nonNameNo + " / " + nonRecommend + " / " + addAndCancle);
		// {nonNameThank: 1, nonNameBed: 3}
		return nonNameService.Thank(nonNameNo, nonRecommend, addAndCancle);
	}
	
}
