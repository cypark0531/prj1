package com.minihome.vo;

import java.sql.Date;

public class DiaryVo {
	private int dnum;
	private String id;
	private String dcontent;
	private int dopen;
	private Date regdate;
	public DiaryVo() {
		super();
	}
	public DiaryVo(int dnum, String id, String dcontent, int dopen, Date regdate) {
		super();
		this.dnum = dnum;
		this.id = id;
		this.dcontent = dcontent;
		this.dopen = dopen;
		this.regdate = regdate;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public int getDopen() {
		return dopen;
	}
	public void setDopen(int dopen) {
		this.dopen = dopen;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
