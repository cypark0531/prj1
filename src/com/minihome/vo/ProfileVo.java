package com.minihome.vo;

public class ProfileVo {
 private String id;
 private String pimg;
 private String ptitle;
 private String hptitle;
 private String pintro;
 private int popen;
public ProfileVo() {
	super();
}
public ProfileVo(String id, String pimg, String ptitle, String hptitle, String pintro, int popen) {
	super();
	this.id = id;
	this.pimg = pimg;
	this.ptitle = ptitle;
	this.hptitle = hptitle;
	this.pintro = pintro;
	this.popen = popen;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPimg() {
	return pimg;
}
public void setPimg(String pimg) {
	this.pimg = pimg;
}
public String getPtitle() {
	return ptitle;
}
public void setPtitle(String ptitle) {
	this.ptitle = ptitle;
}
public String getHptitle() {
	return hptitle;
}
public void setHptitle(String hptitle) {
	this.hptitle = hptitle;
}
public String getPintro() {
	return pintro;
}
public void setPintro(String pintro) {
	this.pintro = pintro;
}
public int getPopen() {
	return popen;
}
public void setPopen(int popen) {
	this.popen = popen;
}
 
}
