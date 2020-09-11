<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<div>
	
	<div class="mx-auto" style="width: 400px;">
  <h3>Enter calories amount</h3>
</div>
	<form action="/showRecipes">
		<label>Minimum Carbs</label>
		<input type="number" name="minCarbs"/><br><br>
		<label>Maximum Carbs</label>
		<input type="number" name="maxCarbs"/><br><br>
		<label>Number of results</label>
		<input type="number" name="number"/><br><br><br>
		<button type="submit">Check Recipes</button>
		

		
<link href="style.css" rel="stylesheet" />
		
	</form>
</div>
</body>
</html>