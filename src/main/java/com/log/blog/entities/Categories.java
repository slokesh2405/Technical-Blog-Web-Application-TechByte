package com.log.blog.entities;

public class Categories {

	private int catid;
	private String name;
	private String description;
	
	
	public Categories(int catid, String name, String description) {
		super();
		this.catid = catid;
		this.name = name;
		this.description = description;
	}
	
	public Categories() {
		
	}

	public Categories(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	
	
	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
		
}
