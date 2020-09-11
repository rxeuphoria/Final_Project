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
	<h1>Enter calories amount</h1>
	<form action="/showRecipes">
		<label>Minimum Carbs</label>
		<input type="number" name="minCarbs"/><br><br>
		<label>Maximum Carbs</label>
		<input type="number" name="maxCarbs"/><br><br>
		<label>Number of results</label>
		<input type="number" name="number"/><br><br><br>
		<button type="submit">Check Recipes</button>
		
	</form>
</div>
</body>
</html>