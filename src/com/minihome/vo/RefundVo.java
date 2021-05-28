package com.minihome.vo;
/*-- 환불
CREATE TABLE REFUND
(
	-- 환불번호
	refnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	-- 환불상태
	refstate number(2),
	-- 구매번호
	purnum number(10) NOT NULL,
	-- 날짜
	regdate date,
	PRIMARY KEY (refnum)
);*/

import java.sql.Date;

public class RefundVo {
	private int refnum;
	private String id;
	private String gcode;
	private int refstate;
	private int purnum;
	private Date regdate;
	
	public RefundVo() {
		// TODO Auto-generated constructor stub
	}

	public RefundVo(int refnum, String id, String gcode, int refstate, int purnum, Date regdate) {
		super();
		this.refnum = refnum;
		this.id = id;
		this.gcode = gcode;
		this.refstate = refstate;
		this.purnum = purnum;
		this.regdate = regdate;
	}

	public int getRefnum() {
		return refnum;
	}

	public void setRefnum(int refnum) {
		this.refnum = refnum;
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

	public int getRefstate() {
		return refstate;
	}

	public void setRefstate(int refstate) {
		this.refstate = refstate;
	}

	public int getPurnum() {
		return purnum;
	}

	public void setPurnum(int purnum) {
		this.purnum = purnum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
