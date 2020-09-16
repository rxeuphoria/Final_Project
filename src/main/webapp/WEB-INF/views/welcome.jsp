<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div class="container">
	<h1>Welcome ${user.name}</h1>
	<h2>Fill your profile</h2>
		<form action="/calculations">
			<label>Gender:</label>
			<select name="gender">
				<option value="M">M</option>
				<option value="F">F</option>
			</select><br><br>
			<label>Height:</label>
			<input type="number" name="height" step=".1"/>
			<label>in:</label>
			<select name="height_unit"> 
				<option value="centimeter" selected="selected">centimeter</option>
				<option value="inches">inches</option>
			</select><br><br>
			<label>Weight:</label>
			<input type="number" name="weight" step=".1"/>
			<label>in:</label>
			<select name="weight_unit">
				<option value="pound" selected="selected">pound</option>
				<option value="kilogram">kilogram</option>
			</select><br><br>
			<label>Age:</label>
			<input type="number" name="age"/><br><br>
			<label>Activity Level:</label>
			<select name="activity">
				<option value="1.2" >Sedentary</option>
				<option value="1.375">Lightly Active</option>
				<option value="1.55">Moderately</option>
				<option value="1.725">Very Active</option>
				<option value="1.9">Extremely Active</option>
			</select><br><br>
			<label>Shopping Interval(in days):</label>
			<input type="number" name="interval"/><br><br>
			<button type="submit">Save</button>
		</form><br><br><br>
		
		
	<form action="/logout">
	<button type="submit">Logout</button>
	</form>
</div>
</body>
</html>