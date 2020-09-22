<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shopping list</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
<article>
<header><a href="/show-data" class="homepage">@DashBoard</a><br>
</header>
</article>
<table class="table">
<tr><center><h1>Shopping List</h1></center>
	<th>Ingredients Name</th>
	<th>Ingredients Amount</th>
</tr>
<c:forEach var="ing" items="${ingredients}">
<tr>
<td>${ing.name}</td>
<td>${ing.original}</td>
</tr>
</c:forEach>
</table>
</body>
</html>