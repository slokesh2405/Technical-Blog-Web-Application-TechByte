package com.log.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.log.blog.dao.UserDao;
import com.log.blog.entities.Message;
import com.log.blog.entities.UserInfo;
import com.log.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		//fetch all data
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userProfile=request.getParameter("user_profile");
		
		//get the user from login session
		HttpSession session=request.getSession();
		UserInfo user=(UserInfo)session.getAttribute("currentUser");  //contain old data
		out.println(userEmail);
		out.println(userName);
		out.println(userPassword);
		out.println(userProfile);
		//set new data to user
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setProfile(userProfile);
		
		//update db
		UserDao dao=new UserDao(ConnectionProvider.addConnection());
		boolean ans=dao.updateUser(user);
		
		if(ans) {
			
			Message msg=new Message("Profile Updated","success","alert-success" );			
			session.setAttribute("msg", msg);
		
		}
		else {
			
			Message msg=new Message("Something went wrong","error","alert-danger" );
			session.setAttribute("msg", msg);
		}
		
		
		response.sendRedirect("profile.jsp");
	}

}
