package com.minihome.search;

public class SearchList {
	private String id;
	private String name;
	private int state;

	public SearchList() {
		super();
	}
	public SearchList(String id, String name, int state) {
		super();
		this.id = id;
		this.name = name;
		this.state = state;
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
