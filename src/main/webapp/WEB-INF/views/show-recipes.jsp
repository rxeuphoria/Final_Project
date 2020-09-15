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
			<th></th>
			<th>Title</th>
			<th>Prep Time</th>
			<th>Calories</th>
			<th>Carbs</th>
			<th>Fat</th>
			<th>Protein</th>
			<th>Actions</th>
		</tr>
			<c:forEach var="recipes" items="${recipes}">
		<tr>
			
			<td><img src="${recipes.image}"/></td>
			<td><a href="/external-recipe?id=${recipes.id}" target="_blank">${recipes.title}</a></td>
			<td>${recipes.recipe.readyInMinutes} min.</td>
			<td>${recipes.calories}</td>
			<td>${recipes.carbs}</td>
			<td>${recipes.fat}</td>
			<td>${recipes.protein}</td>
<<<<<<< HEAD
			<td> 
			<p>
			<a href="/save-recipe">Add</a>
			/
			<a href="/remove-recipe">Remove</a>
			</p>
=======
			<td><form action = "/save-recipe">
			<input type="hidden" name= "calories" value ="${recipes.calories}"/>
			<input type="hidden" name= "image" value ="${recipes.image}"/>
			<input type="hidden" name= "carbs" value ="${recipes.carbs}"/>
			<input type="hidden" name= "fat" value ="${recipes.fat}"/>
			<input type="hidden" name= "protein" value ="${recipes.protein}"/>
			<input type="hidden" name= "title" value ="${recipes.title}"/>
			<input type="hidden" name="recipeUrl" value="${recipes.recipe.sourceUrl}"/>
				<button type = "submit">Add</button>
			</form>
			
			
>>>>>>> 6c0f87e26f52f4b9deed358141d08c79238ee375
			</td>
			
	</tr>
	</c:forEach>
		
	</table>
</div>
</body>
</html>