<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search recipes</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body style="background-color:#AFEEEE;">

<div>
<form action="/logout"> <button type="submit" class="button button4" style="float: right">Logout</button></form>
<article>
<header><a href="/show-data"><button class="button button4" >DashBoard </button></a>
<b>Wallet :</b> <b>Carbs:</b> <fmt:formatNumber value="${carbslimit}" pattern=".00"/>gm  ,
			<b>Protein :</b> <fmt:formatNumber value="${proteinlimit}" pattern=".00"/>gm  ,
			 <b>Fats:</b> <fmt:formatNumber value="${fatslimit}" pattern=".00"/>gm</p> 
</header>
</article>
<center>
		<img src="macgro.png" height="100" width="100" /><br>
		<h1>Recipes List</h1></center>
		<table class="table">
		<tr>
			<th></th>
			<th>Title</th>
			<th>Calories</th>
			<th>Carbs</th>
			<th>Fat</th>
			<th>Protein</th>
			<th>Vegan</th>
			<th>Vegatarian</th>
			<th>Gluten Free</th>
			<th>Dairy Free</th>
			<th>Ketogenic</th>
			

			
		</tr>
		<c:choose>
		 <c:when test="${diet==null}">
			<c:forEach var="recipes" items="${recipes}">
		<tr>
			<td><img src="${recipes.image}"/></td>
			<td><a href="/external-recipe?id=${recipes.id}" target="_blank">${recipes.title}</a></td>
			<td>${recipes.calories}</td>
			<td>${recipes.carbs}</td>
			<td>${recipes.fat}</td>
			<td>${recipes.protein}</td>
	
			<c:choose>
			<c:when test = "${recipes.recipe.vegan == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.vegetarian == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.glutenFree == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.dairyFree == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.ketogenic == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			
			
			
			<td><form action = "/save-recipe?id=${recipes.id}">
			<input type="hidden" name= "calories" value ="${recipes.calories}"/>
			<input type="hidden" name= "image" value ="${recipes.image}"/>
			<input type="hidden" name= "carbs" value ="${recipes.carbs}"/>
			<input type="hidden" name= "fat" value ="${recipes.fat}"/>
			<input type="hidden" name= "protein" value ="${recipes.protein}"/>
			<input type="hidden" name= "title" value ="${recipes.title}"/>

			<input type="hidden" name="extRecipeId" value="${recipes.id}"/>
				
			
				<button type = "submit" onclick="myFunction()" class="button button4">Add</button>
			</form>						

			</td>
		
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<c:forEach var="recipes" items="${recipes}">
	<c:if test="${((veg==true)&&(veg==recipes.recipe.vegetarian))||((vegan==true)&&(vegan==recipes.recipe.vegan))||((dairyFree==true)&&(dairyFree==recipes.recipe.dairyFree))||((glutenFree==true)&&(glutenFree==recipes.recipe.glutenFree))||((ketogenic==true))}">
		<tr>
			<td><img src="${recipes.image}"/></td>
			<td><a href="/external-recipe?id=${recipes.id}" target="_blank">${recipes.title}</a></td>
			<td>${recipes.calories}</td>
			<td>${recipes.carbs}</td>
			<td>${recipes.fat}</td>
			<td>${recipes.protein}</td>
	
			<c:choose>
			<c:when test = "${recipes.recipe.vegan == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.vegetarian == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.glutenFree == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.dairyFree == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test = "${recipes.recipe.ketogenic == true}">
			<td>&check;</td>
			</c:when>
			<c:otherwise>			 
			<td>-</td>
			</c:otherwise>
			</c:choose>
			
			
			
			
			<td><form action = "/save-recipe?id=${recipes.id}">
			<input type="hidden" name= "calories" value ="${recipes.calories}"/>
			<input type="hidden" name= "image" value ="${recipes.image}"/>
			<input type="hidden" name= "carbs" value ="${recipes.carbs}"/>
			<input type="hidden" name= "fat" value ="${recipes.fat}"/>
			<input type="hidden" name= "protein" value ="${recipes.protein}"/>
			<input type="hidden" name= "title" value ="${recipes.title}"/>

			<input type="hidden" name="extRecipeId" value="${recipes.id}"/>
				
			
				<button type = "submit" onclick="myFunction()">Add</button>
			</form>						

			</td>
			</tr>
			</c:if>
			</c:forEach>
		</c:otherwise>
		</c:choose>	
	</table><br><br>
				<script>
			function myFunction() {
				  confirm("New recipe is added to your list");
				}
			</script>
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>