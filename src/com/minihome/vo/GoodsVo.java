package com.minihome.vo;
//CREATE TABLE GOODS
//(
//	-- ��ǰ�ڵ�
//	gcode varchar2(20) NOT NULL,
//	-- ��ǰ����
//	gprice number(10) NOT NULL,
//	-- ��ǰ�̸�
//	gname varchar2(20) NOT NULL UNIQUE,
//	-- ��ǰ����
//	gimg varchar2(30),
//	-- ī�װ�
//	gcategory varchar2(10),
//	PRIMARY KEY (gcode)
//);
public class GoodsVo {
	private String gcode;
	private int gprice;
	private String gname;
	private String gsaveimg;
	private String gcategory;
	
	public GoodsVo() {}

	public GoodsVo(String gcode, int gprice, String gname, String gsaveimg, String gcategory) {
		super();
		this.gcode = gcode;
		this.gprice = gprice;
		this.gname = gname;
		this.gsaveimg = gsaveimg;
		this.gcategory = gcategory;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGsaveimg() {
		return gsaveimg;
	}

	public void setGsaveimg(String gsaveimg) {
		this.gsaveimg = gsaveimg;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
}

