package com.minihome.vo;

import java.sql.Date;

public class HistoriesVo {
	private int hnum;
	private String hid;
	private String htitle;
	private String hcontent;
	private String gid;
	private Date regdate;
	public HistoriesVo() {
		super();
	}
	public HistoriesVo(int hnum, String hid, String htitle, String hcontent, String gid, Date regdate) {
		super();
		this.hnum = hnum;
		this.hid = hid;
		this.htitle = htitle;
		this.hcontent = hcontent;
		this.gid = gid;
		this.regdate = regdate;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getHtitle() {
		return htitle;
	}
	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}
	public String getHcontent() {
		return hcontent;
	}
	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
