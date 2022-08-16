package com.huihui.intranet.dao;

import java.util.List;

import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;

public interface CommuteDAO {
	//사번으로 insert
	public int insertEmpId(String employeeId);
	
	//퇴근시간 update
	public int updateleaved(int commuteNo);
	
	//출근 확인
	public Commute checkattend (String employeeId);
	
	//출근 확인
	public List<Commute> attendMonth(DateData dateData);
		
	//출근일 검색
	public Commute attendDay(DateData dateData);
	
	// 조회
	public abstract List<Commute> attendList();
}
