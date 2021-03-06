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
<body background="cherry.jpg">
	<center>
		<img src="macgro.png" height="200" width="200" />
		<h1>Sign up</h1>

		<p class="message">
			<c:out value="${ message }" />
		</p>

		<form action="signup" method="post">
			<p>
				<label for="name">Your Name:</label> <input id="name" name="name"
					value="<c:out value="${ param.name }"/>" required minlength="2"
					autocomplete="off" />
			</p>
			<p>
				<label for="email">Email:</label> <input type="email" name="email"
					value="<c:out value="${ param.email }"/>" required minlength="2" />
			</p>
			<p>
				<label for="password">Password:</label> <input id="password"
					type="password" name="password" required minlength="2" />
			</p>
			<p>
				<label for="password2">Confirm Password:</label> <input
					id="password2" type="password" name="confirm-password" required
					minlength="2" />
			</p>
			<p>
				<button class="button button4">Sign me Up!</button>
			</p>
		</form>
	</center>
	<br>
	<br>
	<br>
	<footer>&copy; Copyright 2020 All rights reserved </footer>

</body>
</html>