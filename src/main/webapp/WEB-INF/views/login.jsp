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
<center>
<img src="macgro.png" height="200" width="200"/>
	<h1>Login</h1>
	

	
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
	
</center><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>