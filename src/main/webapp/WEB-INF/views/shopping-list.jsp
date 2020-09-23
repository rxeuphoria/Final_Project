<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shopping list</title>
<link rel="stylesheet" href="/style.css" />
</head>
<body style="background-color:#AFEEEE;">
<form action="/logout"> <button type="submit" class="button button4" style="float: right">Logout</button></form>
<article>
<header><a href="/show-data" class="homepage">@DashBoard</a><br>
</header>
</article>
<center>
		<img src="macgro.png" height="100" width="100" />
</center><br>
<table class="results">
<c:choose>
<c:when test="${ingredients=='[]'}">
 <center><h2>No Shopping List found.Please add some recipes to the list.</h2></center>
 </c:when>
 <c:otherwise>
<tr>
	<th>Ingredients Name</th>
	<th>Ingredients Amount</th>
</tr>
<c:forEach var="ing" items="${ingredients}">
<tr>
<td>${ing.name}</td>
<td>${ing.original}</td>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</table>
</body>
</html>