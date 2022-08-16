package com.huihui.intranet.service;

import java.util.List;

import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;

public interface CommuteService {

	//출퇴근 조회
	public void commuteInsert(String employeeId);

	//퇴근시간 update
	public void checkAndUpdate(String employeeId);
	
	//출근일 조회
	public List<Commute> Datecompare(DateData dateData);
	
	// 조회
	public abstract List<Commute> attendList();
}
