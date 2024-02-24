<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>

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

<main class="d-flex align-items-center" style="height: 98vh">

	<div class="container small mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
			
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-plus fa-2x"></span>
						<p>Register Here</p>
					</div>
						
						<div class="card-body">
								 
								<form id="reg-form" action="RegServlet" method="POST"> 
									<div class="form-group">
    									<label for="exampleInputEmail1">User Name</label>
    									<input name="user_name"type="text" class="form-control" id="exampleInputName" aria-describedby="nameHelp" placeholder="Enter name">
  									</div>
  									<div class="form-group">
    									<label for="exampleInputEmail1">Email address</label>
    									<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  									</div>
  									<div class="form-group">
  										<label for="gender">Select Gender</label><br>
  										<input type="radio" id="gender" name="gender" value="male">Male
  										<input type="radio" id="gender" name="gender" value="female">Female
  									</div>
  									<div class="form-group">
  									<label for="profile">Profile</label><br>
  									<textarea name="profile" rows="2" class="form-control" placeholder="Write about yourself"></textarea>  									
  									
  									
  									</div>
  									
  									
  									<div class="form-group">
    									<label for="exampleInputPassword1">Password</label>
    									<input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
  									</div>
  									<div class="form-check">
    									<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    									<label class="form-check-label" for="exampleCheck1">Agree t&c</label>
  									</div>
  									<br>
  									<div id="loader" class="loader-container text-center" style="display:none">
  										<span class="fa fa-refresh fa-spin fa-4x " ></span>
  										<h4>Please wait..</h4>
  									</div>
  									<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>


	// JavaScript for user registration
	$(document).ready(function(){
		
		console.log("loaded..");
		
		$('#reg-form').on('submit', function(event){
			
			event.preventDefault();
			
			let form=new FormData(this);
			
			$('#submit-btn').hide();
			$('#loader').show();
			//send this data to RegServlet
			
			$.ajax({
				
				url:"RegServlet",
				type:'POST',
				data:form,
				success: function(data, textStatus, jqXHR){
					console.log(data);
					
					$('#submit-btn').show();
					$('#loader').hide();
					
					if(data.trim()==='done'){
					swal("Registration Successful, We are redirecting you to login page.")
					.then((value) => {
					  window.location="login.jsp";
					});
					}
					else{
						swal(data)
					}
					
				},
				error: function(jqXHR, textStatus, errorThrown){
					console.log(jqXHR);
					
					$('#submit-btn').show();
					$('#loader').hide();
					
					swal("Something went wrong..\n Try Again")
					
				},
				processData: false,
				contentType: false
				
			});
			
		});
		
	});

</script>

</body>
</html>