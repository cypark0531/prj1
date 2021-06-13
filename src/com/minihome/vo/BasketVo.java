package com.minihome.vo;

/*-- ��ٱ���
CREATE TABLE basket
(
	-- �ٽ��Ϲ�ȣ
	basnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ��ǰ�ڵ�
	gcode varchar2(20) NOT NULL,
	PRIMARY KEY (basnum)
);*/
public class BasketVo {
	private int basnum;
	private String id;
	private String gcode;
	private int gprice;
	private String gname;
	private String gsaveimg;
	private String gorgimg;
	private String gcategory;
	
	public BasketVo() {
		// TODO Auto-generated constructor stub
	}

	public BasketVo(int basnum, String id, String gcode, int gprice, String gname, String gsaveimg, String gorgimg,
			String gcategory) {
		super();
		this.basnum = basnum;
		this.id = id;
		this.gcode = gcode;
		this.gprice = gprice;
		this.gname = gname;
		this.gsaveimg = gsaveimg;
		this.gorgimg = gorgimg;
		this.gcategory = gcategory;
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

	public String getGorgimg() {
		return gorgimg;
	}

	public void setGorgimg(String gorgimg) {
		this.gorgimg = gorgimg;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
}
