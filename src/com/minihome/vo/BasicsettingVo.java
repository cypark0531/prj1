package com.minihome.vo;

public class BasicsettingVo {
	private int bsnum;
	private String bscategory;
	private int bsset;
	private String id;
	private int purnum;
	private String glink;
	public BasicsettingVo() {
		super();
	}
	public BasicsettingVo(int bsnum, String bscategory, int bsset, String id, int purnum, String glink) {
		super();
		this.bsnum = bsnum;
		this.bscategory = bscategory;
		this.bsset = bsset;
		this.id = id;
		this.purnum = purnum;
		this.glink = glink;
	}
	public int getBsnum() {
		return bsnum;
	}
	public void setBsnum(int bsnum) {
		this.bsnum = bsnum;
	}
	public String getBscategory() {
		return bscategory;
	}
	public void setBscategory(String bscategory) {
		this.bscategory = bscategory;
	}
	public int getBsset() {
		return bsset;
	}
	public void setBsset(int bsset) {
		this.bsset = bsset;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPurnum() {
		return purnum;
	}
	public void setPurnum(int purnum) {
		this.purnum = purnum;
	}
	public String getGlink() {
		return glink;
	}
	public void setGlink(String glink) {
		this.glink = glink;
	}
	
}
