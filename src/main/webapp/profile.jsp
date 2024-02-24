<%@page import="com.log.blog.dao.UserDao"%>
<%@page import="com.log.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.log.blog.dao.PostDao"%>
<%@page import="com.log.blog.helper.ConnectionProvider"%>
<%@page import="com.log.blog.entities.Message"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.log.blog.entities.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp" %>

<%
UserInfo user=(UserInfo)session.getAttribute("currentUser");

if(user==null){
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>


<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark" style="background:#99ccff">
  <a class="navbar-brand" href="home.jsp"><span><img src="img/ghost.png" height="60" width="60"> </span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">Add Post <span class="sr-only">(current)</span></a>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          References
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="https://www.geeksforgeeks.org/">GeeksforGeeks</a>
          <a class="dropdown-item" href="https://www.w3schools.com/">W3School</a>
          <a class="dropdown-item" href="https://www.tutorialspoint.com/index.htm/">TutorialPoint</a>
          <a class="dropdown-item" href="https://www.javatpoint.com/">JavaTPoint</a>
        </div>
      </li>
     
    </ul>
   	
   	<ul class="navbar-nav mr-right">
   	  <li class="nav-item">
        <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle-o"></span> <%=user.getName() %></a>
      </li> 
   	
   	
	  <li class="nav-item">
        <a class="nav-link text-white" href="LogoutServlet" method="POST">Logout</a>
      </li> 	
   	
   	</ul>
   
   
  </div>
</nav>

<!-- end of Navbar -->

					<!-- Display success message on profile page after successful profile updation -->
					<%
						Message m=(Message)session.getAttribute("msg");	
						if(m!=null){
					
					%>
	  				<div class="alert alert-success text-center" role="alert">
  						<%= m.getContent() %>
					</div>
					
					<%
					   session.removeAttribute("msg");	
						}
					 %>
					<!-- end -->
					
					
<!-- main body of the page -->

<main>
	<div class="container">
		<div class="row mt-4">
			<!-- first col -->
			<div class="col-md-4">
				<!-- categories -->
				
				<div class="list-group">
 		 			<a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
    					All Posts
  					</a>
  					<%
  					PostDao d=new PostDao(ConnectionProvider.addConnection());
					ArrayList<Categories> list1 = d.getAllCategories();
					for(Categories cc : list1){
  					%>
					<a href="#" onclick="getPosts(<%= cc.getCatid() %>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
					<%
						}
					%>
				</div>
			
			</div>
		
			<div class="col-md-8">
				<!-- posts -->
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-4x fa-spin"></i>
					<h3 class="mt-3">Loading...</h3>
				</div>
				<div class="container-fluid" id="post-container">
				
				</div>
			
			</div>		
		</div>
	</div>

</main>

<!-- end of main body of the page -->					
					

<!-- profile modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-white text-center primary-background">
        <h3 class="modal-title" id="exampleModalLabel">LogBlog</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center" style="background:#f0f0f0">
        <span class="fa fa-user-circle fa-5x"></span>
        <br>
        <div class="name-container fa-2x"><%= user.getName() %></div>
        <div class="content-container"><%= user.getProfile() %></div>
        
<!-- end of profile-modal -->     
        
        
       <!-- details-table -->
       <div id="profile-details">
        <table class="table table-hover">
  				
  			<tbody>
    			<tr>
      			<th scope="row">ID</th>
      			<td><%=user.getId() %></td>
      			</tr>
      			
   		 		<tr>
      			<th scope="row">Email</th>
      			<td><%=user.getEmail() %></td>
				</tr>
    
    			<tr>
      			<th scope="row">Gender</th>
     			<td><%=user.getGender().toUpperCase() %></td>
    			</tr>
  
  				<tr>
      			<th scope="row">Registered on</th>
     			<td><%=user.getDateTime() %></td>
    			</tr>
  			</tbody>
		</table>
	  </div>
	  <!-- end of details-table -->
	  
	  
	  <!-- profile edit -->
	  <div id="profile-edit" style="display:none">
	  	
	  	 <form action="EditServlet" method="POST">
	  	 	<table class="table">
	  	 		<tr>
	  	 		<td>ID : </td>
	  	 		<td><%=user.getId() %></td>
	  	 		</tr>
	  	 		
	  	 		<tr>
	  	 		<td>Email : </td>
	  	 		<td><input type="email" class="form-control" name="user_email" value=<%=user.getEmail() %>></td>
	  	 		</tr>
	  	 		
	  	 		<tr>
	  	 		<td>Name : </td>
	  	 		<td><input type="text" class="form-control" name="user_name" value=<%=user.getName() %>></td>
	  	 		</tr>
	  	 		
	  	 		<tr>
	  	 		<td>Password : </td>
	  	 		<td><input type="password" class="form-control" name="user_password" value=<%=user.getPassword() %>></td>
	  	 		</tr>
	  	 		
	  	 		<tr>
	  	 		<td>Gender : </td>
	  	 		<td><%=user.getGender().toUpperCase() %></td>
	  	 		</tr>
	  	 		
	  	 		<tr>
	  	 		<td>Profile : </td>
	  	 		<td><textarea class="form-control" name="user_profile"><%=user.getProfile() %></textarea></td>
	  	 		</tr>
	
	  	 	</table>
	  	 	
	  	 	<div class="contianer">
	  	 		<button type="submit" class="btn btn-outline-primary">Save</button>
	  	 	</div>
	 
	  	 </form>	
	  			  
	  </div> 
	
	 
     </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
  
</div>

<!-- end of profile-edit -->



<!-- add post modal -->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide post details : </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	
      	<form id="add-post-form" action="AddPostServlet" method="POST">
      	
      		<div class="form-group">
      			<select class="form-control" name="catid">
      				<option selected disabled>---Select Category---</option>
      				<%
      					PostDao postd=new PostDao(ConnectionProvider.addConnection());
      					ArrayList<Categories> list=postd.getAllCategories();
      					
      					for(Categories c : list){
      						
      				%>
      				<option value="<%= c.getCatid()   %>"><%= c.getName() %></option>
      				<%
      					}      				
      				%>
      				
      			</select>
      		</div>
      		
      		<div class="form-group">
      			<input name="pTitle" type="text" placeholder="Enter the post title" class="form-control"/>
      		</div>
      	
      		<div class="form-group">
      			<textarea name="pContent" class="form-control" rows="4" placeholder="Enter your content"></textarea>
      		</div>
      		
      		<div class="form-group">
      			<textarea name="pCode" class="form-control" rows="7" placeholder="Enter your code(if required)"></textarea>
      		</div>
      	
      		<div class="container text-center">
      			<button type="submit" class="btn btn-outline-primary">Post</button>
      		</div>
      		
      	</form>
      
      
        
      </div>
      
    </div>
  </div>
</div>

<!-- end of add post modal -->



<!--javascript-->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- <script src="javascript/myjs.js" type="text/javascript"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>

	$(document).ready(function(){
		
		let editStatus=false;
		
		
		$("#edit-profile-button").click(function(){
			
			if(editStatus==false){
				
				$("#profile-details").hide();
				$("#profile-edit").show();
			
				editStatus=true;
				$(this).text("Back");
			}
			else{
				
				$("#profile-details").show();
				$("#profile-edit").hide();
					
				editStatus=false;
				$(this).text("Edit");
			}
			
		});
		
	});
	
</script>


<!-- add post javascript -->
<script>

	$(document).ready(function (e){
		
		$("#add-post-form").on("submit", function(event){
		
			//this code gets called when form is submitted
			
			event.preventDefault();  // this method prevents the form from his default behavior(i.e., synchronous behavior)
			console.log("you have clicked on post");
			
			let form = new FormData(this); // add-post-form saves to form varaible
			
			// now requesting to server through ajax(Asynchronous JavaScript XML)
			$.ajax({
				
				url: "AddPostServlet",
				type:'POST',
				data: form,
				success: function (data, textStatus, jqXHR){
					console.log(data);
					
					if(data.trim()=="done"){
						swal("Good job!", "Post successfully saved", "success");
					}
					else{
						swal("Error!", "Something went wrong", "error");
					}
					
				},
				error: function (jqXHR, textStatus, errorThrown){
					swal("Error!", "Something went wrong", "error");
				},
				processData: false,
				contentType: false
			
			
			})
			
		})
	
	})
	
</script>


<!-- loading post using ajax -->
<script>

function getPosts(catId, temp){
	
	$("#loader").show();
	$("#post-container").hide();
	
	$(".c-link").removeClass("active")
	
	
	$.ajax({
		url : "load_posts.jsp",
		data :{catid : catId},
		success : function (data, textStatus, jqXHR){
			console.log(data);
			$("#loader").hide();
			$("#post-container").show();
			$("#post-container").html(data);
			$(temp).addClass("active")
		}
   })
	
}


$(document).ready(function (e){
	
	let allPostRef=$(".c-link")[0]
	getPosts(0,allPostRef)
	
})


</script>


</body>
</html>