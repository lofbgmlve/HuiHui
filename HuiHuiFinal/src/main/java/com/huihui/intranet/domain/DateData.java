package com.huihui.intranet.domain;


import org.apache.ibatis.type.Alias;

@Alias("DateData")
//출근 날짜를 저장하기 위한 객체
public class DateData {
	private String toYear; // 년 체크
	private String toMonth; // 월 체크
	private String toDay; // 일 체크
	private String employeeId; // 회원번호 체크

	public DateData() {
	}

	public DateData(String toYear, String toMonth, String toDay, String employeeId) {
		this.toYear = toYear;
		this.toMonth = toMonth;
		this.toDay = toDay;
		this.employeeId = employeeId;
	}

	public String getToYear() {
		return toYear;
	}

	public void setToYear(String toYear) {
		this.toYear = toYear;
	}

	public String getemployeeId() {
		return employeeId;
	}

	public void setemployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getToMonth() {
		return toMonth;
	}

	public void setToMonth(String toMonth) {
		this.toMonth = toMonth;
	}

	public String getToDay() {
		return toDay;
	}

	public void setToDay(String toDay) {
		this.toDay = toDay;
	}

}
