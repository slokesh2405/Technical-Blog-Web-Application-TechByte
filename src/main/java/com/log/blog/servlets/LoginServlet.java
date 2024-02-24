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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		//fetch email and passowrd from request
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		
		UserDao dao=new UserDao(ConnectionProvider.addConnection());
		
		UserInfo u = dao.getEmailAndPassword(userEmail, userPassword);
		
		if(u==null) {
			//out.println("Invalid Details");
			
			Message msg=new Message("Invalid Details! Try with another","error","alert-danger" );
			
			HttpSession session=request.getSession();
			session.setAttribute("msg", msg);
			
			response.sendRedirect("login.jsp");
		}
		else {
			
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}	
		
	}

}
