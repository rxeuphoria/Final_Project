<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here
</title>
<link href="style.css" rel="stylesheet" />
</head>
<body>

	

<article>
<header><a href="/show-data" class="homepage">@DashBoard</a>

<p> <b>Wallet :</b> <b>Carbs:</b> <fmt:formatNumber value="${carbslimit}" pattern=".00"/>gm  ,
			<b>Protein :</b> <fmt:formatNumber value="${proteinlimit}" pattern=".00"/>gm  ,
			 <b>Fats:</b> <fmt:formatNumber value="${fatslimit}" pattern=".00"/>gm</p>
</header>
<center><img src="macgro.png" height="200" width="200"/></center>

</article>
	<div class="mx-auto" style="width: 400px;">
  <h1>Enter calories amount</h1>
</div>

	<form action="/showRecipes">
		<label>Minimum Carbs</label>
		<input type="number" name="minCarbs" min="0" max="${carbslimit}" value="0"/><br><br>
		<label>Maximum Carbs</label> 
		<input type="number" name="maxCarbs" max="${carbslimit}" value="${carbsInWallet}"/><br><br>
		<label>Minimum Protein</label>
		<input type="number" name="minProtein" min="0" max="${proteinlimit}" value="0"/><br><br>
		<label>Max Protein</label>
		<input type="number" name="maxProtein" max="${proteinlimit}" value="${proteinInWallet}"/><br><br>
		<label>Min Fats</label>
		<input type="number" name="minFats" min="0" max="${fatslimit}" value="0"/><br><br>
		<label>Max Fats</label>
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
		<button type="submit">Check Recipes</button>	
	</form><br><br>
	<form action="/logout">
	<button type="submit">Logout</button>
	</form>
	
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>