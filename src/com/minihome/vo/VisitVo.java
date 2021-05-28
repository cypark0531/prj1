package com.minihome.vo;

import java.sql.Date;

public class VisitVo {
	private int vnum;
	private String id;
	private int dayvisitnum;
	private Date regdate;
	public VisitVo() {
		super();
	}
	public VisitVo(int vnum, String id, int dayvisitnum, Date regdate) {
		super();
		this.vnum = vnum;
		this.id = id;
		this.dayvisitnum = dayvisitnum;
		this.regdate = regdate;
	}
	public int getVnum() {
		return vnum;
	}
	public void setVnum(int vnum) {
		this.vnum = vnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDayvisitnum() {
		return dayvisitnum;
	}
	public void setDayvisitnum(int dayvisitnum) {
		this.dayvisitnum = dayvisitnum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
