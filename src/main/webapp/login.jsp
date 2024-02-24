<%@page import="com.log.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
		background : url(img/login_bg.jpg);
		background-size : cover;
		background-attachment : fixed;

}
</style>

</head>

<body>

<!-- NavBar -->
<%@include file="navbar.jsp" %>

<main class="d-flex align-items-center"  style="height: 80vh">
 
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
			
				<div class="card">
					<div class="card-header text-center text-white" style="background:#99ccff">
						<span class="fa fa-user-circle-o fa-2x"></span>
						<p>Login Here</p>
					</div>
					<%
						Message m=(Message)session.getAttribute("msg");	
						if(m!=null){
					
					%>
					<div class="alert alert-danger" role="alert">
  						<%= m.getContent() %>
					</div>
					<%
						session.removeAttribute("msg");
						}
					
					%>
					
						
						<div class="card-body">
								 
								<form action="LoginServlet" method="POST">
  									<div class="form-group">
    									<label for="exampleInputEmail1">Email address</label>
    									<input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  									</div>
  									<div class="form-group">
    									<label for="exampleInputPassword1">Password</label>
    									<input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  									</div>
  									
  									<button type="submit" class="btn btn-primary">Submit</button>
  									<img src="img/login_ghost.gif" height="50" width="50">
								</form>		
						</div>
				</div>
				
			</div>

		</div>

	</div>

</main>

<!--javascript-->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- <script src="javascript/myjs.js" type="text/javascript"></script> -->

</body>
</html>