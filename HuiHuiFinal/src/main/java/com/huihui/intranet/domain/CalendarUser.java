package com.huihui.intranet.domain;

public class CalendarUser {
	private int no;
	private String id;
	private String title;
	private String description;
	private String start;
	private String end;
	private String textColor;
	private String backgroundColor;
	
	public CalendarUser() {}
	
	public CalendarUser(int no, String id, String title, String description,
							String start, String end, String textColor, String backgroundColor) {
		this.no = no;
		this.id= id;
		this.title = title;
		this.description =description;
		this.start = start;
		this.end = end;
		this.textColor = textColor;
		this.backgroundColor = backgroundColor;
	
		
	}
	
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	
}
