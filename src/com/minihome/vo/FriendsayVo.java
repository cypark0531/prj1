package com.minihome.vo;

import java.sql.Date;

public class FriendsayVo {
	private int fsnum;
	private String hid;
	private String fscontent;
	private int fsstep;
	private int fsgroup;
	private Date regdate;
	private String gid;
	public FriendsayVo() {
		super();
	}
	public FriendsayVo(int fsnum, String hid, String fscontent, int fsstep, int fsgroup, Date regdate, String gid) {
		super();
		this.fsnum = fsnum;
		this.hid = hid;
		this.fscontent = fscontent;
		this.fsstep = fsstep;
		this.fsgroup = fsgroup;
		this.regdate = regdate;
		this.gid = gid;
	}
	public int getFsnum() {
		return fsnum;
	}
	public void setFsnum(int fsnum) {
		this.fsnum = fsnum;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getFscontent() {
		return fscontent;
	}
	public void setFscontent(String fscontent) {
		this.fscontent = fscontent;
	}
	public int getFsstep() {
		return fsstep;
	}
	public void setFsstep(int fsstep) {
		this.fsstep = fsstep;
	}
	public int getFsgroup() {
		return fsgroup;
	}
	public void setFsgroup(int fsgroup) {
		this.fsgroup = fsgroup;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	
}
