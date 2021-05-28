package com.minihome.vo;

/*-- 장바구니
CREATE TABLE basket
(
	-- 바스켓번호
	basnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	PRIMARY KEY (basnum)
);*/
public class BasketVo {
	private int basnum;
	private String id;
	private String gcode;
	
	public BasketVo() {
		// TODO Auto-generated constructor stub
	}

	public BasketVo(int basnum, String id, String gcode) {
		super();
		this.basnum = basnum;
		this.id = id;
		this.gcode = gcode;
	}

	public int getBasnum() {
		return basnum;
	}

	public void setBasnum(int basnum) {
		this.basnum = basnum;
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
	
}
