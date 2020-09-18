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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src=https://code.jquery.com/jquery-1.12.4.js></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<header><center><h1>Welcome ${user.name}</h1>
<img src="macgro.png" height="200" width="200"/></center></header>
	<div class="container">
		<h2>Fill your profile</h2>
		<form action="/calculations">
			<label>Gender:</label> <select name="gender">
				<option value="M">M</option>
				<option value="F">F</option>
			</select><br><br>
			<label>Height:</label>
			<input type="number" name="height" step=".1"/>
			<label>in:</label>
			<select name="height_unit"> 
				<option value="cms" selected="selected">centimeter</option>

				<option value="inches">inches</option>
			</select><br> <br> <label>Weight:</label> <input type="number"
				name="weight" step=".1" /> <label>in:</label> <select
				name="weight_unit">
				<option value="pound" selected="selected">pound</option>
				<option value="kg">kilogram</option>
			</select><br> <br> <label>Age:</label> <input type="number"
				name="age" /><br> <br> <label>Activity Level:</label> <select
				name="activity">
				<option value="1.2">Sedentary</option>
				<option value="1.375">Lightly Active</option>
				<option value="1.55">Moderately</option>
				<option value="1.725">Very Active</option>
				<option value="1.9">Extremely Active</option>

			</select><br><br>
				<label>Plan for the Interval:</label>
				<select name="change">
					<option value="500">Gain 1 Pound</option>
					<option value="250">Gain .5 pound</option>
					<option value="0">Maintain</option>
					<option value="-250">Loose .5 pound</option>
					<option value="-500">Loose 1 pound</option>
				</select><br><br>
			<label>Start Date:</label> 
			<input type="date" name="datepickerStart" id="Test_Date" min="${start}" max="${start}" required>
			<label>End Date:</label>
			<input type="date" name="datepickerEnd" id="Test_Date1" min="${end}" required><br><br>

			<button type="submit"  ondblclick="My_Date()">Save</button>
		</form>
		<br> <br> 
		<form action="/logout">
			<button type="submit">Logout</button>
		</form>
	</div><br><br><br>
	<script> 
            function My_Date() { 
                var d = document.getElementById("Test_Date").min; 
                document.getElementById("test").innerHTML = d; 
                var e = document.getElementById("Test_Date1").min; 
                document.getElementById("test").innerHTML = e; 
            } 
            
        </script> 
  <footer>&copy; Copyright 2020 All rights reserved</footer>
        
</body>
</html>