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
<title>Viewing the List Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css/viewPage.css" />
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
		
			<div class="list text-center">
				<h1> <c:out value="${grocery.store}"/> Haul </h1>
			</div>
		<div class="content p-2 mb-5 mt-5 ">
			<div class="needed text-center  d-flex flex-column ">
			
				<h2 class="d-flex flex-column ">

						<c:forEach items="${grocery.items}" var="item">
						
							<c:out value="${item}"></c:out>
						
						</c:forEach>
				</h2>
			
			</div>
		</div>
			<button class="btn btn-lg btn-white m-5"  style="background-color: #4835d4; color:white">
			<a href="/grocerys/${grocery.id }/edit">Add to this list</a>
			</button>
		</div>
</body>
</html>