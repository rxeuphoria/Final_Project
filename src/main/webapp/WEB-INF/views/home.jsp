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
		<label>Number of results</label>
		<input type="number" name="number" min ="0" max="20"/><br><br><br>
		<input type="checkbox" name="vegetarian" value="true">
		<input type="hidden" name="vegetarian" value="false">
		<label>Vegetarian</label>
		<input type="checkbox" name="vegan" value="true">
		<input type="hidden" name="vegan" value="false">
		<label>Vegan</label>
		<button type="submit">Check Recipes</button>	
	</form><br><br>
	<form action="/logout">
	<button type="submit">Logout</button>
	</form>
	
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>