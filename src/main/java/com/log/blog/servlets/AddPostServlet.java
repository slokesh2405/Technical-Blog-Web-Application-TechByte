package com.log.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.log.blog.dao.PostDao;
import com.log.blog.entities.Posts;
import com.log.blog.entities.UserInfo;
import com.log.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		int catid=Integer.parseInt(request.getParameter("catid"));
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("pCode");
		
		//getting currentUser id so that we create Session here
		HttpSession session=request.getSession();
		UserInfo user=(UserInfo) session.getAttribute("currentUser");
		
		
	    /*out.println("your catid is : "+catid);
		out.println("your post titile is : "+pTitle);
		out.println("your content is : "+pContent);
		out.println("your code is : "+pCode); */
		
		
		Posts p=new Posts(pTitle, pContent, pCode, null, catid, user.getId());
		PostDao dao=new PostDao(ConnectionProvider.addConnection());
		
		if(dao.savePost(p)) {
			out.println("done");
		}
		else {
			out.println("error");
		}
		
	}

}
