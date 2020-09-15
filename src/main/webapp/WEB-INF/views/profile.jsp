<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

</head>
<body>
<a href="/home">Do Shopping</a>
<table class=table>
	<tr>
		<th>Gender</th>
		<th>Height</th>
		<th>Weight</th>
		<th>Age</th>
		<th>Shopping Interval</th>
		<th>Calories in Wallet</th>
		<th>Carbs in Wallet</th>
		<th>Protein in Wallet</th>
		<th>Fats in Wallet</th>
	</tr>
	<tr>
		<td>${gender}</td>
		<td>${height}</td>
		<td>${weight}</td>
		<td>${age}</td>
		<td>${interval} days</td>
		<td><fmt:formatNumber value="${cal}" pattern=".00"/>cal.</td>
		<td><fmt:formatNumber value="${carbs}" pattern=".00"/>gm</td>
		<td><fmt:formatNumber value="${protein}" pattern=".00"/>gm</td>
		<td><fmt:formatNumber value="${fats}" pattern=".00"/>gm</td>
	</tr>
	</table>

</body>
</html>