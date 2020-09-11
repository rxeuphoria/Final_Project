<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        
        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />

</head>
<body>
<div>
<a href="/home">Home</a>
	<table class="table">
		<tr>
			<th></th>
			<th>Calories</th>
			<th>Carbs(gm)</th>
			<th>Protein(gm)</th>
			<th>Fats(gm)</th>
		</tr>
		<tr>
			<td>Daily In-Take</td>
			<td><fmt:formatNumber value="${TEE}" pattern=".00"/>cal.</td>
			<td><fmt:formatNumber value="${carbs}" pattern=".00"/>gm</td>
			<td><fmt:formatNumber value="${protein}" pattern=".00"/>gm</td>
			<td><fmt:formatNumber value="${fats}" pattern=".00"/>gm</td>
		</tr>
		<tr>
			<td>Calories in Wallet</td>
			<td><fmt:formatNumber value="${wallet}" pattern=".00"/>cal.</td>
			<td><fmt:formatNumber value="${totalCarbs}" pattern=".00"/>gm</td>
			<td><fmt:formatNumber value="${totalProtein}" pattern=".00"/>gm</td>
			<td><fmt:formatNumber value="${totalFats}" pattern=".00"/>gm</td>
		</tr>
	</table>
</div>
</body>
</html>