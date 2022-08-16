package com.huihui.intranet.dao;

import com.huihui.intranet.domain.Emp;

public interface EmpDao {

	
	// 회원 로그인을 처리하는 메서드
	// @param 사원번호는 아이디
	// @param pass는 비밀번호
	
	public int login(String employeeId, String pass);
	
	// 한 명의 회원 정보를 반환하는 메서드
	// @param 사원번호는 아이디
	
	public Emp getEmp(String employeeId);
	
	public void addEmp(Emp emp);
}
