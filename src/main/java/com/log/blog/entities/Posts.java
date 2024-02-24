package com.log.blog.entities;

import java.sql.Timestamp;

public class Posts {

	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private Timestamp pDate;
	private int catid;
	private int userid;
	
	
	public Posts(int pid, String pTitle, String pContent, String pCode, Timestamp pDate, int catid, int userid) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pDate = pDate;
		this.catid = catid;
		this.userid=userid;
	}
	
	
	public Posts() {
		
	}


	public Posts(String pTitle, String pContent, String pCode, Timestamp pDate, int catid, int userid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pDate = pDate;
		this.catid = catid;
		this.userid=userid;
	}
	
	public Posts(int pid, String pTitle, String pContent, String pCode, Timestamp pDate, int userid) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pDate = pDate;
		this.catid = catid;
		this.userid=userid;
	}
	

	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpContent() {
		return pContent;
	}


	public void setpContent(String pContent) {
		this.pContent = pContent;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public Timestamp getpDate() {
		return pDate;
	}


	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int catid) {
		this.catid = catid;
	}	
	
}
