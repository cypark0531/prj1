package com.minihome.vo;

public class ProfilesVo {
 private String id;
 private String porgimg;
 private String psavegimg;
 private String ptitle;
 private String htitle;
 private String pintro;
 private int popen;
public ProfilesVo() {
	super();
}

public ProfilesVo(String id, String porgimg, String psavegimg, String ptitle, String htitle, String pintro, int popen) {
	super();
	this.id = id;
	this.porgimg = porgimg;
	this.psavegimg = psavegimg;
	this.ptitle = ptitle;
	this.htitle = htitle;
	this.pintro = pintro;
	this.popen = popen;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPorgimg() {
	return porgimg;
}
public void setPorgimg(String porgimg) {
	this.porgimg = porgimg;
}
public String getPsavegimg() {
	return psavegimg;
}
public void setPsavegimg(String psavegimg) {
	this.psavegimg = psavegimg;
}
public String getPtitle() {
	return ptitle;
}
public void setPtitle(String ptitle) {
	this.ptitle = ptitle;
}
public String getHtitle() {
	return htitle;
}
public void setHtitle(String htitle) {
	this.htitle = htitle;
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


