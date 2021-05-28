package com.minihome.vo;

import java.sql.Date;

public class ScheduleVo {
	private int schnum;
	private String id;
	private String schtitle;
	private String schcontent;
	private int schopen;
	private Date schdate;
	public ScheduleVo() {
		super();
	}
	public ScheduleVo(int schnum, String id, String schtitle, String schcontent, int schopen, Date schdate) {
		super();
		this.schnum = schnum;
		this.id = id;
		this.schtitle = schtitle;
		this.schcontent = schcontent;
		this.schopen = schopen;
		this.schdate = schdate;
	}
	public int getSchnum() {
		return schnum;
	}
	public void setSchnum(int schnum) {
		this.schnum = schnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSchtitle() {
		return schtitle;
	}
	public void setSchtitle(String schtitle) {
		this.schtitle = schtitle;
	}
	public String getSchcontent() {
		return schcontent;
	}
	public void setSchcontent(String schcontent) {
		this.schcontent = schcontent;
	}
	public int getSchopen() {
		return schopen;
	}
	public void setSchopen(int schopen) {
		this.schopen = schopen;
	}
	public Date getSchdate() {
		return schdate;
	}
	public void setSchdate(Date schdate) {
		this.schdate = schdate;
	}
	
}
