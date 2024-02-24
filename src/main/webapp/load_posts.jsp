<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.log.blog.dao.UserDao"%>
<%@page import="com.log.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.log.blog.helper.ConnectionProvider"%>
<%@page import="com.log.blog.dao.PostDao"%>

<div class="row">
<%
PostDao d=new PostDao(ConnectionProvider.addConnection());

List<Posts> posts=null;

int catid=Integer.parseInt(request.getParameter("catid"));

	if(catid==0){
		posts=d.getAllPosts();
	}
	else{
	posts=d.getPostByCatId(catid);	
	}

	if(posts.size()==0){
		out.println(" <h3 class='display-4 text-center md-4'>No posts available in this category</h3> <br> <img src='img/notebook.gif'>");
		return;
	}

for(Posts p : posts){	
%>

<div class="col-md-6 mt-2">
	<div class="card">
		<div class="card-body">
			<b><%=p.getpTitle() %></b>
			<p><%=p.getpContent() %></p>
			<pre><%=p.getpCode() %></pre>
			<i>posted by : <%= p.getUserid() %></i><br>
			<i>post date : <%= p.getpDate() %></i>
		</div>
		
		<div class="card-footer">
			<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More</a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"> <span>10</span></i></a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"> <span>20</span></i></a>
		</div>

	</div>

</div>
<%
}
%>