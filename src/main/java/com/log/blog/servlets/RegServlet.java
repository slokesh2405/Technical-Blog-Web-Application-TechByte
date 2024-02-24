package com.log.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.log.blog.dao.UserDao;
import com.log.blog.entities.UserInfo;
import com.log.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
@MultipartConfig
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String check=request.getParameter("check");
		
		//fetch data
		if(check==null) {
			out.println(check);
		}
		else {
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String gender=request.getParameter("gender");
			String profile=request.getParameter("profile");
			String password=request.getParameter("user_password");
			
			//create userInfo object
			UserInfo user=new UserInfo(name, email, password, gender, profile);
			
			
			
			//create userDao object 
			UserDao dao=new UserDao(ConnectionProvider.addConnection());
			if(dao.saveUser(user)) {
				out.println("done");
			}
			else {
				out.println("error");
			}
		}	
		
	}

}
