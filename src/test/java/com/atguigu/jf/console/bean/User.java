package com.atguigu.jf.console.bean;

import java.util.Date;

public class User {
	
	private Integer id;
	private String name;
	private Date brith;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBrith() {
		return brith;
	}
	public void setBrith(Date brith) {
		this.brith = brith;
	}
	
	
}
