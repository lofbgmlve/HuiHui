package com.huihui.intranet.service;

import com.huihui.intranet.domain.Emp;

public interface EmpService {
	
	public int login(String employeeId, String pass);
	
	public Emp getEmp(String employeeId);
	
	public void addEmp(Emp emp);

}
