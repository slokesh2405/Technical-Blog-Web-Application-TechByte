package com.log.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.log.blog.entities.UserInfo;

public class UserDao {

private Connection con;
	
	public UserDao(Connection con) {
		this.con=con;
	}
	
	//method to insert user data to database : 
	public boolean saveUser(UserInfo user) {
		boolean flag=false;
		try {
			
			String query="insert into user(name, email, password, gender, profile) values (?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getProfile());
			
			pstmt.executeUpdate();
			
			
			flag=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	//get user by email and password
	
	public UserInfo getEmailAndPassword(String email, String password) {
		
		UserInfo user=null;
		
		try {
				String query="select * from user where email=? and password=?";
				PreparedStatement pstmt=con.prepareStatement(query);
				
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				ResultSet rs=pstmt.executeQuery();
				
				if(rs.next()) {
					
					user=new UserInfo();
					
					//data from db set to user object
					user.setId(rs.getInt("id"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setProfile(rs.getString("profile"));
					user.setDateTime(rs.getTimestamp("reg_date"));
						
					
				}
						
		}catch(Exception e) {
			
			e.printStackTrace();
			}
	
		
		return user;
	}
	
	public boolean updateUser(UserInfo user) {
		
		boolean flag=false;
		
		
		try {
			String query="update user set name=?, email=?, password=?, profile=? where id=?";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getProfile());
			pstmt.setInt(5, user.getId());
			
			pstmt.executeUpdate();
			
			flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	//get user details through post_id from show_blog_page.jsp
	
	public UserInfo getUserByUserId(int userid) {
		UserInfo user=null;
		
		try {
		String q="select * from user where id=?";
		
		PreparedStatement p=this.con.prepareStatement(q);
		p.setInt(1,userid);
		
		ResultSet rs=p.executeQuery();
		
		if(rs.next()) {
			
			user=new UserInfo();
			
			//data from db set to user object
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setProfile(rs.getString("profile"));
			user.setDateTime(rs.getTimestamp("reg_date"));	
			
		}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
}
