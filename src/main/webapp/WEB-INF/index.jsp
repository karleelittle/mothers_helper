<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login and Registration</title>
<link href='https://fonts.googleapis.com/css?family=Annie Use Your Telescope' rel='stylesheet'>
<link rel="stylesheet" href="index.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<section class="h-300 h-custom gradient-custom-purp">
	<h1 class="title p-4 text-center ">Welcome! Please Login or Register.</h1>
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-75">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-6">
                <div class="p-5">
                  <h3 class="fw-normal mb-5" style="color: #4835d4;">Sign Up</h3>
                  
				<form:form action="/register" modelAttribute="newUser" class="form">
				
			<div class="row">
				<div class="col-md6 mb-4 pb-2">
					<div class="form-outline" style="color: #4835d4;">
					<form:errors path="userName"/>
					<form:label for="userName" path="userName">User Name:</form:label>
					<form:input type="text" path="userName" class="form-control form-control-lg"/>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md6 mb-4 pb-2">
					<div class="form-outline" style="color: #4835d4;">
					<form:errors path="email"/>
					<form:label for="email" path="email">Email:</form:label>
					<form:input type="text" path="email" class="form-control form-control-lg"/>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md6 mb-4 pb-2">
					<div class="form-outline" style="color: #4835d4;">
					<form:errors path="password"/>
					<form:label for="password" path="password">Password:</form:label>
					<form:input type="password" path="password" class="form-control form-control-lg"/>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md6 mb-4 pb-2">
					<div class="form-outline" style="color: #4835d4;">
					<form:errors path="confirm"/>
					<form:label for="confirm" path="confirm">Confirm Password:</form:label>
					<form:input type="password" path="confirm" class="form-control form-control-lg"/>
					</div>
				</div>
			</div>
			
			<div class="text-center p-2">
				<input type="submit" value="Register" class="btn btn-lg" style="background-color: #4835d4; color: white;"/>
			</div>
		</form:form>
	</div>
 </div>
              <div class="col-lg-6 bg-indigo text-white">
                <div class="p-5">
                  <h3 class="fw-normal mb-5">Login</h3>
				
			<form:form action="/login" modelAttribute="newLogin" class="form">
                  <div class="mb-4 pb-2">
                    <div class="form-outline form-white">
                      	<form:errors path="email"/>
						<form:label for="email" path="email">Email:</form:label>
						<form:input type="text" path="email" class="form-control form-control-lg"/>
                    </div>
                  </div>

                  <div class="mb-4">
                    <div class="form-outline form-white">
                      	<form:errors path="password"/>
						<form:label for="password" path="password">Password:</form:label>
						<form:input type="password" path="password" class="form-control form-control-lg"/>
                    </div>
                  </div>
             

                    <div class="form-check d-flex justify-content-start mb-4 pb-3">
                    <input class="form-check-input me-3" type="checkbox" />
                    <label class="form-check-label text-white" for="form2Example3">
                      I agree to never lose a paper grocery list ever again.
                    </label>
                  </div>

                  <div class="text-center p-2">
					<input type="submit" value="Login" class="btn btn-lg" style="background-color: #FFFFFF";/>
				</div>
			</form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

		
	

</body>
</html>