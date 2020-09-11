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
	
	<p class="message"><c:out value="${ message }"/></p>
	
	<form action="/login-submit">
		<p>
			<label>Email:</label> <input type="email" name="email"/>
		</p>		<p>
			<label>Password:</label> <input type="password" name="password" required minlength="2" />
		</p>
		<p>
			<button>Submit</button>
		</p>
	</form>
	
	or
		
	<p>
		Don't have an account yet? <a href="/signup">Sign up here</a>.
	</p>
</body>
</html>