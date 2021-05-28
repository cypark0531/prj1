package com.minihome.vo;

import java.sql.Date;

public class GaleryVo {
	private int galnum;
	private String id;
	private String galtitle;
	private String galcontent;
	private String galorgname;
	private String galsavename;
	private int galopen;
	private Date regdate;
	public GaleryVo() {
		super();
	}
	public GaleryVo(int galnum, String id, String galtitle, String galcontent, String galorgname, String galsavename,
			int galopen, Date regdate) {
		super();
		this.galnum = galnum;
		this.id = id;
		this.galtitle = galtitle;
		this.galcontent = galcontent;
		this.galorgname = galorgname;
		this.galsavename = galsavename;
		this.galopen = galopen;
		this.regdate = regdate;
	}
	public int getGalnum() {
		return galnum;
	}
	public void setGalnum(int galnum) {
		this.galnum = galnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGaltitle() {
		return galtitle;
	}
	public void setGaltitle(String galtitle) {
		this.galtitle = galtitle;
	}
	public String getGalcontent() {
		return galcontent;
	}
	public void setGalcontent(String galcontent) {
		this.galcontent = galcontent;
	}
	public String getGalorgname() {
		return galorgname;
	}
	public void setGalorgname(String galorgname) {
		this.galorgname = galorgname;
	}
	public String getGalsavename() {
		return galsavename;
	}
	public void setGalsavename(String galsavename) {
		this.galsavename = galsavename;
	}
	public int getGalopen() {
		return galopen;
	}
	public void setGalopen(int galopen) {
		this.galopen = galopen;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
