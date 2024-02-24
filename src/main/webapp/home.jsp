<%@page import="com.log.blog.entities.Posts"%>
<%@page import="com.log.blog.dao.PostDao"%>
<%@page import="com.log.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechByte</title>
</head>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
<!-- NavBar -->
<%@include file="navbar.jsp" %>
<!-- End of NavBar -->



<!-- Banner -->
<div class="container-fluid m-0 p-0">
	
	<div class="jumbotron primary-background text-white">
		
		<div class="container">
			<h3 style="font-weight : 100; font-size : 50px;">Welcome to TechByte</h3>
			<p style="font-weight : 40; font-size : 20px;">Your Gateway to a Byte-Sized Universe of Tech Insights and Knowledge</p><br>
			<pre style="font-weight : 40; font-size : 20px; color :white;">Decode the complexities,One Byte at a Time</pre>
			
			<a href="login.jsp" class="btn btn-outline-dark btn-lg text-white"><span class="fa fa-user-circle-o"></span><span class="button-text"> Login</span></a>
			<a href="registration.jsp" class="btn btn-outline-dark btn-lg text-white"><span class="fa fa-user-plus"></span><span class="button-text"> Sign up</span></a>
	   </div>
	</div>
</div>
<!-- End of Banner -->



<!-- Get Posts Information -->
<%
PostDao d=new PostDao(ConnectionProvider.addConnection());
%>


<!-- Cards -->
<div class="container">
	<div class="row mb-4">
	 
	 <!-- col 1 -->
		<div class="col-md-4">
			<div class="card">	
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p1=d.getPostByPostId(1); %><%= p1.getpTitle() %></h5>
  							<p class="card-text">Machine Learning is a branch of artificial intelligence that develops algorithms by learning...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p1.getpTitle() %></h5>
  							<p class="card-text"><%= p1.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(0)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>
			</div>
		 </div>
	
		<!-- col 2 --> 
		<div class="col-md-4">
			<div class="card">
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p2=d.getPostByPostId(2); %><%= p2.getpTitle() %></h5>
  							<p class="card-text">Java is a programming language and a platform. Java is a high level, robust, object-oriented and...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p2.getpTitle() %></h5>
  							<p class="card-text"><%= p2.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(1)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>	
			</div>
		 </div>
		 
	 <!-- col 3 -->
		 <div class="col-md-4">
			<div class="card">
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p5=d.getPostByPostId(5); %><%= p5.getpTitle() %></h5>
  							<p class="card-text">Introduction : Today, Python is one of the most popular programming languages. Although it is a...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p5.getpTitle() %></h5>
  							<p class="card-text"><%= p5.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(2)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>	
			</div>
		 </div>
	</div>
	
	
<!-- second row cards -->
<div class="row mb-4">
		
	   <!-- col 1 -->
		 <div class="col-md-4">
			<div class="card">
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p6=d.getPostByPostId(6); %><%= p6.getpTitle() %></h5>
  							<p class="card-text">Introduction : The word DevOps is a combination of the terms development and operations, meant...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p6.getpTitle() %></h5>
  							<p class="card-text"><%= p6.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(3)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>
			</div>
		 </div>
		 
		<!-- col 2 -->
		  <div class="col-md-4">
			 <div class="card">
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p7=d.getPostByPostId(7); %><%= p7.getpTitle() %></h5>
  							<p class="card-text">What is Data Science? : Data science is the domain of study that deals with vast volumes of data using modern tools and...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p7.getpTitle() %></h5>
  							<p class="card-text"><%= p7.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(4)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>
			</div>
		 </div>
		 
	  <!-- col 3 -->
		  <div class="col-md-4">
			<div class="card">
  					<div class="card-body">
  					
  						<div class="visible-content">
  							<h5 class="card-title"><% Posts p3=d.getPostByPostId(3); %><%= p3.getpTitle() %></h5>
  							<p class="card-text">Angular is an open-source, JavaScript framework written in TypeScript. Google maintains it, and its primary purpose is...<span class="dots"></span></p>
  						</div>
  						
  						<div class="invisible-content">
  							<h5 class="card-title"><%= p3.getpTitle() %></h5>
  							<p class="card-text"><%= p3.getpContent() %></p>
  						</div>
  						
  						<br>
    					<button  onclick="moreLess(5)" class="btn primary-background text-white read-btn">Read More</button>
    					<a href="login.jsp"><span><img src="img/laptop.gif" height="45" width="45"></span></a>
  					</div>
			</div>
		 </div>
   </div>
</div>

<!--javascript-->
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- <script src="javascript/myjs.js" type="text/javascript"></script> -->

<script>

	// Read More or REad Less finctionality
	function moreLess(count){
		
		
		
		var dots = document.getElementsByClassName("dots")[count];
		var visibleText = document.getElementsByClassName("visible-content")[count];
		var invisibleText = document.getElementsByClassName("invisible-content")[count];
		var btnText = document.getElementsByClassName("read-btn")[count];
		
		if(dots.style.display != "none"){
			dots.style.display="none";
			visibleText.style.display="none";
			
			invisibleText.style.display="inline";
			
			btnText.innerHTML="Read Less";
		}
		else{
			
			dots.style.display="inline";
			visibleText.style.display="inline";
			
			invisibleText.style.display="none";
			
			btnText.innerHTML="Read More";
		}
				
	}

</script>


</body>
</html>