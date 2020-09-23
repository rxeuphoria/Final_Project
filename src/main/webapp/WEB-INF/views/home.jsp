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
		<label>Number of results</label>
		<input type="number" name="number" min ="0" max="50"/><br><br>
		<input type="checkbox" name="vegetarian" value="true">
		<input type="hidden" name="vegetarian" value="false">
		<label>Vegetarian</label>
		<input type="checkbox" name="vegan" value="true">
		<input type="hidden" name="vegan" value="false">
		<label>Vegan</label>
		<input type="checkbox" name="dairyFree" value="true">
		<input type="hidden" name="dairyFree" value="false">
		<label>Dairy Free</label>
		<input type="checkbox" name="glutenFree" value="true">
		<input type="hidden" name="glutenFree" value="false">
		<label>Gluten Free</label>
		<input type="checkbox" name="ketogenic" value="true">
		<input type="hidden" name="ketogenic" value="false">
		<label>Ketogenic</label><br><br>
		<button type="submit" class="button button4">Check Recipes</button>	
	</form>
	</div>
	
	<br><br>
	
	
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>