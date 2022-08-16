package com.huihui.intranet.domain;

import java.sql.Timestamp;

public class NonNameBoard {
	private int nonNameNo;
	private String empId;
	private String nonNameTitle;
	private String nonNameContent;
	private Timestamp nonNameDate;
	private int nonNameReadCount;
	private String nonNameFile;
	private int nonNameThank;
	private int nonNameBad;
	
	public NonNameBoard() {} 
	public NonNameBoard(int nonNameNo, String empId, String nonNameTitle, String nonNameContent,
			Timestamp nonNameDate,  int nonNameReadCount, String nonNameFile, int nonNameThank, int nonNameBad) {
		this.nonNameNo = nonNameNo;
		this.empId = empId;
		this.nonNameTitle = nonNameTitle;
		this.nonNameContent = nonNameContent;
		this.nonNameDate = nonNameDate;
		this.nonNameReadCount = nonNameReadCount;
		this.nonNameFile = nonNameFile;
		this.nonNameThank = nonNameThank;
		this.nonNameBad = nonNameBad;
	}
	public int getNonNameNo() {
		return nonNameNo;
	}
	public void setNonNameNo(int nonNameNo) {
		this.nonNameNo = nonNameNo;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getNonNameTitle() {
		return nonNameTitle;
	}
	public void setNonNameTitle(String nonNameTitle) {
		this.nonNameTitle = nonNameTitle;
	}
	public String getNonNameContent() {
		return nonNameContent;
	}
	public void setNonNameContent(String nonNameContent) {
		this.nonNameContent = nonNameContent;
	}
	public Timestamp getNonNameDate() {
		return nonNameDate;
	}
	public void setNonNameDate(Timestamp nonNameDate) {
		this.nonNameDate = nonNameDate;
	}
	public int getNonNameReadCount() {
		return nonNameReadCount;
	}
	public void setNonNameReadCount(int nonNameReadCount) {
		this.nonNameReadCount = nonNameReadCount;
	}
	public String getNonNameFile() {
		return nonNameFile;
	}
	public void setNonNameFile(String nonNameFile) {
		this.nonNameFile = nonNameFile;
	}
	public int getNonNameThank() {
		return nonNameThank;
	}
	public void setNonNameThank(int nonNameThank) {
		this.nonNameThank = nonNameThank;
	}
	public int getNonNameBad() {
		return nonNameBad;
	}
	public void setNonNameBad(int nonNameBad) {
		this.nonNameBad = nonNameBad;
	}
	
}
