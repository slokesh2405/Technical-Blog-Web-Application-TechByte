package com.log.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;
	public static Connection addConnection() {
		
		try {
			
			if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver"); //The mysql connector must be present inside webinf-> lib folder
			con=DriverManager.getConnection("jdbc:mysql://localhost/logblog","root","root");
			System.out.println("Connection created");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
				
	}
}
