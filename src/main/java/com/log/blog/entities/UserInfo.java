package com.log.blog.entities;

import java.sql.Timestamp;

public class UserInfo {

	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String profile;
	private Timestamp dateTime;
	
	public UserInfo(int id, String name, String email, String password, String gender, String profile,
			Timestamp dateTime) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.profile = profile;
		this.dateTime = dateTime;
	}
	
	public UserInfo() {
		
	}

	public UserInfo(String name, String email, String password, String gender, String profile) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.profile = profile;

	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
}
