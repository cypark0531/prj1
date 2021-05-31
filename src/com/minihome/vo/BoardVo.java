package com.minihome.vo;

import java.sql.Date;

public class BoardVo {
	private int bnum;
	private String id;
	private String btitle;
	private String bcontent;
	private int bopen;
	private Date regdate;
	private int rnum;
	public BoardVo() {
		super();
	}
	public BoardVo(int bnum, String id, String btitle, String bcontent, int bopen, Date regdate) {
		super();
		this.bnum = bnum;
		this.id = id;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bopen = bopen;
		this.regdate = regdate;
	}
	
	public BoardVo(int bnum, String id, String btitle, String bcontent, int bopen, Date regdate, int rnum) {
		super();
		this.bnum = bnum;
		this.id = id;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bopen = bopen;
		this.regdate = regdate;
		this.rnum = rnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBopen() {
		return bopen;
	}
	public void setBopen(int bopen) {
		this.bopen = bopen;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
