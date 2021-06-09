package com.minihome.friend;

public class FriendCk {
	private int friendnum;
	private String id;
	private String name;
	private int state;

	public FriendCk() {
		super();
	}
	public FriendCk(int friendnum, String id, String name, int state) {
		super();
		this.friendnum = friendnum;
		this.id = id;
		this.name = name;
		this.state = state;
	}
	public int getFriendnum() {
		return friendnum;
	}
	public void setId(int friendnum) {
		this.friendnum = friendnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
