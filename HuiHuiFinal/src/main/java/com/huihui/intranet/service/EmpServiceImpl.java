package com.huihui.intranet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.EmpDao;
import com.huihui.intranet.domain.Emp;



@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDao empDao;
	
	public void setEmpDao(EmpDao empDao) {
		this.empDao = empDao;
	}
	
	// EmptyDao를 이용해 로그인 요청 처리 결과를 반환하는 메서드
	@Override
	public int login(String employeeId, String pass) {
		return empDao.login(employeeId, pass);
	}

	//EmptyDao를 이용해 no에 해당하는 회원 정보를 가져오는 메서드
	@Override
	public Emp getEmp(String employeeId) {
		return empDao.getEmp(employeeId);
	}
	
	@Override
	public void addEmp(Emp emp) {
		empDao.addEmp(emp);
	}
	
}
