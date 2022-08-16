package com.huihui.intranet.domain;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("Commute")
//출근 관리를 위한 객체
public class Commute {
	private int commuteNo; //출근 번호
	private String employeeId; //사번
	private String attend; //출근 시간
	private String leaved; //퇴근 시간
	private Boolean vacation; //휴가
	private Boolean able; // 출근 확인 출근(1) 결근(0)

	public Commute() {
	}

	public Commute(String employeeId, Boolean able) {
		this.employeeId = employeeId;
		this.able = able;
	}

	public Commute(int commuteNo, String employeeId, String attend, String leaved, Boolean vacation,
			Boolean able) {
		this.commuteNo = commuteNo;
		this.employeeId = employeeId;
		this.attend = attend;
		this.leaved = leaved;
		this.vacation = vacation;
		this.able = able;
	}

	public int getCommuteNo() {
		return commuteNo;
	}

	public void setCommuteNo(int commuteNo) {
		this.commuteNo = commuteNo;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getAttend() {
		return attend;
	}

	public void setAttend(String attend) {
		this.attend = attend;
	}

	public String getLeaved() {
		return leaved;
	}

	public void setLeaved(String leaved) {
		this.leaved = leaved;
	}

	public Boolean getVacation() {
		return vacation;
	}

	public void setVacation(Boolean vacation) {
		this.vacation = vacation;
	}

	public Boolean getAble() {
		return able;
	}

	public void setAble(Boolean able) {
		this.able = able;
	}

}
