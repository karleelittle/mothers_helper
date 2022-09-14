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
<title>Edit Your List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css/editPage.css" />
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
			<div class="">
				<h1>Add or Delete from your List</h1>
			</div>
			<div>
				<form:form action="/grocerys/${ grocery.id }" modelAttribute="grocery" class="form" method="post">
				<input type="hidden" name="_method" value="put"/>
				<div class="form-row">
					<form:errors path="store" class="error"/>
					<form:label for="store" path="store">Store:</form:label>
					<form:input type="dropdown" path="store" class="form-control"/>
				</div>
					<div class="form-row">
					<form:errors path="items" class="error"/>
					<form:label for="items" path="items">Items Needed:</form:label>
					<form:textarea rows="10" cols="30" path="items" class="form-control"/>
				</div>
				<div class="text-center p-2">
				<form action="/grocerys/${grocery.id }" method="post">
				<input type="hidden" name="_method" value="update">
					<input type="submit" value="Add These Items to my List" class="btn btn-lg btn-white" style="background-color: #4835d4; color:white"/>
				</form>
				</div>
				</form:form>
			
		</div>
			</div>
		
</body>
</html>