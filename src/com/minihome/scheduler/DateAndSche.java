package com.minihome.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.minihome.vo.ScheduleVo;

public class DateAndSche {
	private int num;
	private int day;
	private int scheNum;
	private ArrayList<Integer> sche;
	
	public DateAndSche(int num, int day, int scheNum,ArrayList<Integer> sche) {
		super();
		this.num = num;
		this.day = day;
		this.scheNum = scheNum;
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
	
	public int getScheNum() {
		return scheNum;
	}

	public void setScheNum(int scheNum) {
		this.scheNum = scheNum;
	}

	public ArrayList<Integer> getSche() {
		return sche;
	}
	public void setSche(ArrayList<Integer> sche) {
		this.sche = sche;
	}
	
	
}
