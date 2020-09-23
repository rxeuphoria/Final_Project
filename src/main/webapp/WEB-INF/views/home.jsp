<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here
</title>
<link href="style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">


</head>

<body style="background-color:#AFEEEE;">

	

<article>
<header>
<form action="/logout"> <button type="submit" class="button button4" style="float: right">Logout</button></form>
<a href="/show-data"><button class="button button4" >DashBoard </button></a>

<center><img src="macgro.png" height="150" width="150"/></center>
<br></br>
<p style="text-align:center;"> <b>Wallet :</b> <b>Carbs:</b> <fmt:formatNumber value="${carbslimit}" pattern=".00"/>gm  ,
			<b>Protein :</b> <fmt:formatNumber value="${proteinlimit}" pattern=".00"/>gm  ,
			 <b>Fats:</b> <fmt:formatNumber value="${fatslimit}" pattern=".00"/>gm</p>
</header>
</article>
	<div class="mx-auto" style="width: 400px;">
  <h1>Enter macros details</h1>
</div>

	<div style="text-align:center;"><form action="/showRecipes">
		<label>Minimum Carbs </label>
		<input type="number" name="minCarbs" min="0" max="${carbslimit}" value="0"/><br><br>
		<label>Maximum Carbs </label> 
		<input type="number" name="maxCarbs" max="${carbslimit}" value="${carbsInWallet}"/><br><br>
		<label>Minimum Protein</label>
		<input type="number" name="minProtein" min="0" max="${proteinlimit}" value="0"/><br><br>
		<label>Maximum Protein</label>
		<input type="number" name="maxProtein" max="${proteinlimit}" value="${proteinInWallet}"/><br><br>
		<label>Minimum Fats  </label>
		<input type="number" name="minFats" min="0" max="${fatslimit}" value="0"/><br><br>
		<label>Maximum Fats  </label>
		<input type="number" name="maxFats" max="${fatslimit}" value="${fatsInWallet}"/><br><br>
		<input type="hidden" name="number" min ="0" max="50" value="20"/>
		<input type="radio" name="diet" value="vegetarian">
		<label>Vegetarian</label>
		<input type="radio" name="diet" value="vegan">
		<label>Vegan</label>
		<input type="radio" name="diet" value="dairyFree">
		<label>Dairy Free</label>
		<input type="radio" name="diet" value="glutenFree">
		<label>Gluten Free</label><br><br><br>
	<button type="submit" class="button button4">Check Recipes</button>	
	</form>
	</div>
	
	<br><br>
	
	
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>