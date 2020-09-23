<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />

</head>
<body style="background-color:#AFEEEE;">
<div>
<header><a href="/show-data" class="homepage">@DashBoard</a><br></header>
<table class="table">
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
</html>