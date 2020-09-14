<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here

</title>
</head>
<body>
<link href="style.css" rel="stylesheet" />

<div>
	
	<div class="mx-auto" style="width: 400px;">
  <h1>Enter calories amount</h1>
</div>

<div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>

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