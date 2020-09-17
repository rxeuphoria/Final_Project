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


<div>
	

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
<div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>

	<form action="/showRecipes">
		<label>Minimum Carbs</label>
		<input type="number" name="minCarbs" min="0" max="${carbslimit}"/><br><br>
		<label>Maximum Carbs</label>
		<input type="number" name="maxCarbs" max="${carbslimit}"/><br><br>
		<label>Minimum Protein</label>
		<input type="number" name="minProtein" min="0" max="${proteinlimit}"/><br><br>
		<label>Max Protein</label>
		<input type="number" name="maxProtein" max="${proteinlimit}"/><br><br>
		<label>Min Fats</label>
		<input type="number" name="minFats" min="0" max="${fatslimit}"/><br><br>
		<label>Max Fats</label>
		<input type="number" name="maxFats" max="${fatslimit}"/><br><br>
		<label>Number of results</label>
		<input type="number" name="number" min ="0" max="20"/><br><br><br>
		<button type="submit">Check Recipes</button>	
	</form><br><br>
	<form action="/logout">
	<button type="submit">Logout</button>
	</form>
	
</div><br><br><br>
<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>