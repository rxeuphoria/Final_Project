<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="/style.css" />

</head>
<body style="background-color:#AFEEEE;">


	<form action="/logout"><button type="submit" class="button button4" style="float: right">Logout</button></form>
	<a href="/home"><button class="button button4">Check Recipes by Macros</button></a>
	<a href="/ingredients-list"><button class="button button4">Shopping list</button></a>
	<a href="/edit"><button class="button button4">Adjust Goals</button></a>
	<center>
		<img src="macgro.png" height="150" width="150" />
	</center>
	<br></br>

	<center>
		<h2>Your Profile</h2>
	</center>
	
	

	<table class="table table-hover table-dark">
		<tr>
			<th>Gender</th>
			<th>Height</th>
			<th>Weight</th>
			<th>Age</th>
			<th><a href="#" data-toggle="tooltip"
				title="Shows current interval length based on dates selected">Interval</a></th>
			<th>Daily Ideal Carbs</th>
			<th>Daily Ideal Protein</th>
			<th>Daily Ideal Fats</th>
			<th><a href="#" data-toggle="tooltip"
				title="Not on track anymore? Changing bodies have changing needs.  Edit your profile to stay current and keep progressing.">Weekly
					Goal</a></th>
		</tr>
		<tr>
			<td>${gender}</td>
			<td>${height}${height_unit}</td>
			<td>${weight}${weight_unit}</td>
			<td>${age}</td>
			<td>${interval} days</td>
			<td><fmt:formatNumber value="${carbs/interval}" pattern=".00" />gm</td>
			<td><fmt:formatNumber value="${protein/interval}" pattern=".00" />gm</td>
			<td><fmt:formatNumber value="${fats/interval}" pattern=".00" />gm</td>
			<td>${plan}</td>
		</tr>
	</table>

	<h2>Wallet</h2>

	<div class=progress-bar
		style="--width: ${(carbs-leftCarbs)/carbs * 100}"
		data-label="Carbohydrates: <fmt:formatNumber value="${leftCarbs}" pattern=".00"/>g left">
	</div>
	<br>
	<div class=progress-bar
		style="--width: ${(protein-leftProtein)/protein * 100}"
		data-label="Proteins: <fmt:formatNumber value="${leftProtein}" pattern=".00"/>g left">
	</div>
	<br>
	<div class=progress-bar style="--width: ${(fats-leftFats)/fats * 100}"
		data-label="Fats: <fmt:formatNumber value="${leftFats}" pattern=".00"/>g left">
	</div>
	<br>

	
	
	<br>
	<c:choose>
	<c:when test="${list=='[]'}">
	</c:when>
	<c:otherwise>
	<h2>
		<a href="#" data-toggle="tooltip"
			title="Finally! What you're looking for.  These are your repeatable recipes that fit your macros, and repetition forms the basis for successful habits.  It's come a long way from strictly olive oil, bread, eggs, rice, and protein powder!  Why not make things you enjoy?  When you're burned out on a dish, just take it off the list and search for something new.">Recipe
			List</a>
	</h2>
	<table>
		<c:forEach var="recipe" items="${list}">
			<tr>
				<td><img src="${recipe.image}" width="100" height="100"></td>
				<td><a href="${recipe.recipeUrl}" target="_blank">${recipe.title}</a><br>
					<p>
						Carbs: ${recipe.carbs} <br>Protein: ${recipe.protein}<br>
						Fats: ${recipe.fat}
					</p></td>
				<td><a href="/ingredients?id=${recipe.id}"><button>Check Ingredients</button></a></td>
				<td><a href="/delete-recipe?id=${recipe.id}"><button>Delete</button></a></td>

			</tr>
		</c:forEach>

	</table>
	</c:otherwise>
	</c:choose>
	<br>
	<br>
	<br>
	<footer> &copy; Copyright 2020 All rights reserved </footer>

</body>
</html>