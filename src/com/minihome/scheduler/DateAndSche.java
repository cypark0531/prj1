package com.minihome.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.minihome.vo.ScheduleVo;

public class DateAndSche {
	private int num;
	private int day;
	private int scheNum;
	private ArrayList<ScheduleVo> sche;
	private String text;
	public DateAndSche(int num, int day, int scheNum,ArrayList<ScheduleVo> sche, String text) {
		super();
		this.num = num;
		this.day = day;
		this.scheNum = scheNum;
		this.sche = sche;
		this.text = text;
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

	public ArrayList<ScheduleVo> getSche() {
		return sche;
	}
	public void setSche(ArrayList<ScheduleVo> sche) {
		this.sche = sche;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
