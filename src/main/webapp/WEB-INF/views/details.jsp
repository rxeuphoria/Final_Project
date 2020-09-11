<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>${recipe.title}</h1>
	<ul>
	<li>SERVINGS: ${recipe.servings }</li>
	<li>PREPARE TIME: ${recipe.readyInMinutes} minutes</li>
	<li><a href="${recipe.sourceUrl}">Recipe</a>
	</ul>
</div>
</body>
</html>