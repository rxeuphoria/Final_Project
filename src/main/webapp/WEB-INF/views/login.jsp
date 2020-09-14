<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/style.css" />
</head>
<body>
	<h1>Login</h1>
	
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<div>
	
	<p class="message"><c:out value="${ message }"/></p>
	
	<form action="/login-submit">
		<p>
			<label for="email">Email:</label> <input type="email" name="email"/>
		</p>		<p>
			<label for="password">Password:</label> <input type="password" name="password" required minlength="2" />
		</p>
		<p>
			<button>Submit</button>
		</p>
	</form>
	
	or
		
	<p>
		Don't have an account yet? <a href="/signup">Sign up here</a>.
	</p>
	
	<link href="style.css" rel="stylesheet" />
</body>
</html>