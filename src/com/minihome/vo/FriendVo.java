package com.minihome.vo;

public class FriendVo {
	private int friendnum;
	private String hid;
	private String gid;
	private String friendstate;
	public FriendVo() {
		super();
	}
	public FriendVo(int friendnum, String hid, String gid, String friendstate) {
		super();
		this.friendnum = friendnum;
		this.hid = hid;
		this.gid = gid;
		this.friendstate = friendstate;
	}
	public int getFriendnum() {
		return friendnum;
	}
	public void setFriendnum(int friendnum) {
		this.friendnum = friendnum;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getFriendstate() {
		return friendstate;
	}
	public void setFriendstate(String friendstate) {
		this.friendstate = friendstate;
	}
	
}
