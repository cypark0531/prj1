package com.minihome.scheduler;

public class DateAndSche {
	private int num;
	private int day;
	private String sche;
	public DateAndSche(int num, int day, String sche) {
		super();
		this.num = num;
		this.day = day;
		this.sche = sche;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getSche() {
		return sche;
	}
	public void setSche(String sche) {
		this.sche = sche;
	}
	
}
