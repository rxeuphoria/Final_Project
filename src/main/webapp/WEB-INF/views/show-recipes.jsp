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

</head>
<body>
<div>
	<h1>Here is Recipes List</h1>
		<table class="table">
		<tr>
			<th>Title</th>
			<th>Calories</th>
			<th>Carbohydrates</th>
			<th>Fat</th>
			<th>Protein</th>
		</tr>
			<c:forEach var="recipes" items="${recipes}">
		<tr>
			<td><a href="/showdetails?id=${recipes.id}">${recipes.title}</a></td>
			<td>${recipes.calories}</td>
			<td>${recipes.carbs}</td>
			<td>${recipes.fat}</td>
			<td>${recipes.protein}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>