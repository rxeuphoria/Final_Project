<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />

</head>
<body id="dashboard">


<form action="/logout">
	<button type="submit">Logout</button>
	</form>

<center><h1>Welcome ${user.name}</h1></center>
<h2>Profile
<a href="/edit"><button>Edit Profile</button></a></h2>

<table class=table>
	<tr>
		<th>Gender</th>
		<th>Height</th>
		<th>Weight</th>
		<th>Age</th>
		<th>Shopping Interval</th>
		<th>Daily Ideal Carbs</th>
		<th>Daily Ideal Protein</th>
		<th>Daily Ideal Fats</th>
		<th>Plan</th>
		</tr>
	<tr>
		<td>${gender}</td>
		<td>${height}${height_unit}</td>
		<td>${weight}${weight_unit}</td>
		<td>${age}</td>
		<td>${interval} days</td>
		<td><fmt:formatNumber value="${carbs/interval}" pattern=".00"/>gm</td>
		<td><fmt:formatNumber value="${protein/interval}" pattern=".00"/>gm</td>
		<td><fmt:formatNumber value="${fats/interval}" pattern=".00"/>gm</td>
		<td>${plan}</td>
		</tr>
	</table>

<h2>Wallet</h2>
	<ul>
		<li>Carbs: <fmt:formatNumber value="${leftCarbs}" pattern=".00"/>gm</li>
		<li>Protein: <fmt:formatNumber value="${leftProtein}" pattern=".00"/>gm</li>
		<li>Fats: <fmt:formatNumber value="${leftFats}" pattern=".00"/>gm</li>
	</ul>
<a href="/home"><button>Check Recipes by Macros</button></a>    
<h2>Recipes List</h2>
<table>
<c:forEach var="recipe" items="${list}">
	<tr>
	<td><a href="${recipe.recipeUrl}">${recipe.title}</a></td>
	<td><a href="/delete-recipe?id=${recipe.id}" ><button>Delete</button></a></td>
	</tr>
	</c:forEach>

</table>
</body>
</html>