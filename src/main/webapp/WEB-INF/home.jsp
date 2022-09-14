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
<title>Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="home.css" />
</head>
<body>
	<div class="container gradient-custom-purp vh-100 mw-100  p-5">
		<div class="navbar p-2 mb-5">
			<h1>Mother's Helper</h1>
			
			<div class="btn-group">
				<button><a href="/home">Home</a></button>
				<button><a href="/logout">Logout</a></button>
			</div>
		</div>
		<div>
			<h1 class="welcome mb-5">Hi There, <c:out value="${user.userName} "/>!</h1>
		</div>
		<br />
			<div class="row">
				<div class="column1 p-2">
					<div class="text-left p-3 mt-5">
						<h2>New to Mother's Helper?</h2>
						<br/>
						<h3 class="info p-2">Do you ever get to the grocery store and realize you have misplaced your list? 
						Its fallen out of your pocket and now you can't remember what to get!
						Mother's helper is designed to keep all of your lists together and easy to edit!</h3>
					</div>
				</div>
				<div class="column2 text-center">
					<h2>Your List's</h2>
					<table class="table table-bordered table-dark">
					<tr>
						<th>Store Name:</th>
						<th>Completed:</th>
					</tr>
					<c:forEach var="grocery" items="${grocerys}">
						<tr>
							<td><a href="grocerys/${grocery.id}"><c:out value="${grocery.store}"/></a></td>
						
							<td>
							<div class="text-center">
								<form action="/grocerys/${grocery.id}" method="post">
    							<input type="hidden" name="_method" value="delete">
    							<input type="submit" value="List Completed" class="btn btn-lg btn-white" style="background-color: #4835d4; color:white">
			</form>
		</div>
							</td>
						</tr>
					</c:forEach>
					</table>
			</div>
			<div class="btn">
							<button class="newBtn mt-5 ">
								<a href="/addPage"> Create a new List</a>
							</button>
						</div>
				</div>
	</div>
</body>
</html>