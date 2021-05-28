package com.minihome.vo;

import java.sql.Date;

public class BoardreplyVo {
	private int brnum;
	private int bnum;
	private String hid;
	private String brcontent;
	private String bgroup;
	private String brlevel;
	private String brstep;
	private String gid;
	private Date regdate;
	public BoardreplyVo() {
		super();
	}
	public BoardreplyVo(int brnum, int bnum, String hid, String brcontent, String bgroup, String brlevel, String brstep,
			String gid, Date regdate) {
		super();
		this.brnum = brnum;
		this.bnum = bnum;
		this.hid = hid;
		this.brcontent = brcontent;
		this.bgroup = bgroup;
		this.brlevel = brlevel;
		this.brstep = brstep;
		this.gid = gid;
		this.regdate = regdate;
	}
	public int getBrnum() {
		return brnum;
	}
	public void setBrnum(int brnum) {
		this.brnum = brnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getBrcontent() {
		return brcontent;
	}
	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
	}
	public String getBgroup() {
		return bgroup;
	}
	public void setBgroup(String bgroup) {
		this.bgroup = bgroup;
	}
	public String getBrlevel() {
		return brlevel;
	}
	public void setBrlevel(String brlevel) {
		this.brlevel = brlevel;
	}
	public String getBrstep() {
		return brstep;
	}
	public void setBrstep(String brstep) {
		this.brstep = brstep;
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
