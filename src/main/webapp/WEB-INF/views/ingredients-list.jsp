<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="/style.css" rel="stylesheet" />

</head>
<body background="cherry.jpg">
<div>
<form action="/logout"> <button type="submit" class="button button4" style="float: right">Logout</button></form>
<header><a href="/show-data"><button class="button button4" >DashBoard </button></a>
<center>
		<img src="macgro.png" height="100" width="100" />
</center><br>

<table class="results">
<tr>
<th>Ingredient Name</th>
<th>Ingredient Amount</th>
</tr>
<c:forEach var="ingre" items="${ingredients}">
<tr>
	<td>${ingre.name}</td>
	<td>${ingre.original}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</html>