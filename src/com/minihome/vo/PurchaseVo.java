package com.minihome.vo;

import java.sql.Date;

public class PurchaseVo {
	private int purnum;
	private String id;
	private String gcode;
	private Date regdate;
	
	public PurchaseVo() {}

	public PurchaseVo(int purnum, String id, String gcode, Date regdate) {
		super();
		this.purnum = purnum;
		this.id = id;
		this.gcode = gcode;
		this.regdate = regdate;
	}

	public int getPurnum() {
		return purnum;
	}

	public void setPurnum(int purnum) {
		this.purnum = purnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
