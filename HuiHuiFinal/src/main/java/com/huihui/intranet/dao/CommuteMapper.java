package com.huihui.intranet.dao;

import java.util.List;

import Annotation.Query;
import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;

@Query
public interface CommuteMapper {
	//사번으로 insert후 int로 결과값을 받음 0실패 1성공 1이상 에러
	int insertEmpId(String employeeId);
	
	//퇴근시간을 현재시간으로 update int로 결과값을 받음 0실패 1성공 1이상 에러
	int updateleaved(int commuteNo);
	
	//당일에 출근 했는지 확인한다 출근했으면 에러
	Commute checkattend (String employeeId);
	
	//년 월을 기준으로 검색후 list로 결과값을 받는다.
	List<Commute> attendMonth(DateData dateData);
	
	//출근일을 검색후 날짜를 넘겨주고 Commute객체로 돌려받는다.
	Commute attendDay(DateData dateData);
}
