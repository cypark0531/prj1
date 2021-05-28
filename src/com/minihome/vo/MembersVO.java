package com.minihome.vo;
/*
-- 회원
CREATE TABLE members
(
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 비밀번호
	pwd varchar2(20) NOT NULL,
	-- 이름
	name varchar2(20) NOT NULL UNIQUE,
	-- 이메일
	email varchar2(30) NOT NULL UNIQUE,
	-- 전화번호
	phone varchar2(15) NOT NULL UNIQUE,
	-- 질문
	question varchar2(30),
	-- 답변
	answer varchar2(20) NOT NULL,
	-- 캐쉬
	money number(10),
	-- 활성화
	active number(2),
	PRIMARY KEY (id)
);
*/
public class MembersVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String question;
	private String answer;
	private int money;
	private int active;
	public MembersVO() {}
	public MembersVO(String id, String pwd, String name, String email, String phone, String question, String answer,
			int money, int active) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
		this.money = money;
		this.active = active;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	};
	
}
