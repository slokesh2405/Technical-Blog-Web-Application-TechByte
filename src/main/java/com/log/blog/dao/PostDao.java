package com.log.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.log.blog.entities.Categories;
import com.log.blog.entities.Posts;

public class PostDao {

Connection con;

public PostDao(Connection con) {
	this.con=con;
}

public ArrayList<Categories> getAllCategories(){
	
	ArrayList<Categories> list=new ArrayList<>();
	
	try {
		
		String q="select * from category";
		
		Statement st=this.con.createStatement();
		ResultSet rs=st.executeQuery(q);
		
		while(rs.next()) {
			int catid=rs.getInt("catid");
			String name=rs.getString("name");
			String description=rs.getString("description");
			
			Categories c=new Categories(catid,name,description);
			list.add(c);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return list;
}
	
public boolean savePost(Posts p) {
	boolean flag=false;
	
	try {
		
		String q="insert into posts(pTitle, pContent, pCode, catid, userid) values(?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(q);
		
		pstmt.setString(1, p.getpTitle());
		pstmt.setString(2, p.getpContent());
		pstmt.setString(3, p.getpCode());
		pstmt.setInt(4, p.getCatid());
		pstmt.setInt(5, p.getUserid());
		
		pstmt.executeUpdate();
		
		flag=true;
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return flag;
}

//to get all the post
public List<Posts> getAllPosts(){
	
	List<Posts> list=new ArrayList<>();
	
	//fetch all the posts
	try {
		
		PreparedStatement pstmt=con.prepareStatement("select * from posts"); 
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()) {
			
			int pid=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			Timestamp date=rs.getTimestamp("pDate");
			int catid=rs.getInt("catid");
			int userid=rs.getInt("userid");
			Posts post=new Posts(pid, pTitle, pContent, pCode, date, catid, userid);
			
			list.add(post);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return list;
}

public List<Posts> getPostByCatId(int catid){
	
List<Posts> list=new ArrayList<>();
	
	
	//fetch all the posts by catid
	try {
		
		PreparedStatement pstmt=con.prepareStatement("select * from posts where catid=?");
		pstmt.setInt(1, catid);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()) {
			
			int pid=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			Timestamp date=rs.getTimestamp("pDate");
			int userid=rs.getInt("userid");
			Posts post=new Posts(pid, pTitle, pContent, pCode, date, catid, userid);
			
			list.add(post);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return list;
}

//to get post details on show_blog_page.jsp through post_id
public Posts getPostByPostId(int postId) {
	
	Posts post=null;
	String q="select * from posts where pid=?";
	
	try {
		
		PreparedStatement p=this.con.prepareStatement(q);
		p.setInt(1,postId);
		
		ResultSet rs=p.executeQuery();
		
		if(rs.next()) {
			
			int pid=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			Timestamp date=rs.getTimestamp("pDate");
			int userid=rs.getInt("userid");
			post=new Posts(pid, pTitle, pContent, pCode, date, userid);
			
		}
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return  post;
	

}
	
}
