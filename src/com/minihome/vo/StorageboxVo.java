package com.minihome.vo;

public class StorageboxVo {
	private int anum;
	private String id;
	private String gcode;
	private String glink;
	private String gsaveimg;
	private String gorgimg;
	private String gname;
	private int purnum;	
	private String gcategory;
	private int basicsetting;
public StorageboxVo() {
}
public StorageboxVo(int anum, String id, String gcode, String glink, String gsaveimg, String gorgimg, String gname,
		int purnum, String gcategory, int basicsetting) {
	super();
	this.anum = anum;
	this.id = id;
	this.gcode = gcode;
	this.glink = glink;
	this.gsaveimg = gsaveimg;
	this.gorgimg = gorgimg;
	this.gname = gname;
	this.purnum = purnum;
	this.gcategory = gcategory;
	this.basicsetting = basicsetting;
}
public int getAnum() {
	return anum;
}
public void setAnum(int anum) {
	this.anum = anum;
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
public String getGlink() {
	return glink;
}
public void setGlink(String glink) {
	this.glink = glink;
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
public String getGname() {
	return gname;
}
public void setGname(String gname) {
	this.gname = gname;
}
public int getPurnum() {
	return purnum;
}
public void setPurnum(int purnum) {
	this.purnum = purnum;
}
public String getGcategory() {
	return gcategory;
}
public void setGcategory(String gcategory) {
	this.gcategory = gcategory;
}
public int getBasicsetting() {
	return basicsetting;
}
public void setBasicsetting(int basicsetting) {
	this.basicsetting = basicsetting;
}

}
