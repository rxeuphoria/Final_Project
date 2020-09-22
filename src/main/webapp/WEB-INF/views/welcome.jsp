<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>start your diet journey</title>
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
	<header>
		<center>
			<h1>Welcome ${user.name}</h1>
			<img src="macgro.png" height="200" width="200" />
		</center>
	</header>
	<div class="container">
		<h2>Fill your profile</h2>
		<form action="/calculations">
			<label><a href="#" data-toggle="tooltip"
				title="Do you currently have hormone levels more akin to a male or female?  We ask this to prevent overfeeding/starving when calculating allowances.">Gender:
			</a></label> <select name="gender">
				<option value="M">M</option>
				<option value="F">F</option>
			</select><br>
			<br> <label>Height:</label> <input type="number" name="height"
				step=".1" /> <label>in:</label> <select name="height_unit">
				<option value="cms" selected="selected">centimeter</option>

				<option value="inches">inches</option>
			</select><br> <br> <label>Weight:</label> <input type="number"
				name="weight" step=".1" /> <label>in:</label> <select
				name="weight_unit">
				<option value="pound" selected="selected">pound</option>
				<option value="kg">kilogram</option>
			</select><br> <br> <label>Age:</label> <input type="number"
				name="age" /><br> <br> <label><a href="#"
				data-toggle="tooltip"
				title="The dirty secret here is that you're not as active as you think you are.  If you're unsure, select an activity level 1 lower than you feel could be correct.  You can always change it later if you start to exercise more or less!">Activity
					Level: </a></label> <select name="activity">
				<option value="1.2">Sedentary</option>
				<option value="1.375">Lightly Active (1-2 workouts per week)</option>
				<option value="1.55">Moderately (3-5 workouts per week)</option>
				<option value="1.725">Very Active (6-7 workouts per week)</option>
				<option value="1.9">Extremely Active (2 workouts daily)</option>

			</select><br>
			<br> <label><a href="#" data-toggle="tooltip" title="The typical interval we recommend is 7 days, so these are what we calculate to weight gain/loss per week.">Weekly goal: </a></label> <select name="change">
				<option value="500">Gain 1 Pound/Gain 0.453 Kg</option>
				<option value="250">Gain .5 pound/Gain 0.23 Kg</option>
				<option value="0">Maintain</option>
				<option value="-250">Lose .5 pound/Lose 0.23 Kg</option>
				<option value="-500">Lose 1 pound/Lose 0.453 Kg</option>
			</select><br>
			<br> <label><a href="#" data-toggle="tooltip" title="The easiest starting interval to manage is roughly a week in length.  If you start to become an expert planner, you can always add to the duration!  We've got you covered if you want build a list and shop in bulk.">Start Date:</a></label> <input type="date"
				name="datepickerStart" id="Test_Date" min="${start}"
				onchange="minEndValue()" required> <label>End Date:</label>
			<input type="date" name="datepickerEnd" id="Test_Date1" required><br>
			<br>

			<button type="submit">Save</button>
		</form>
		<br> <br>
		<form action="/logout">
			<button type="submit">Logout</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<script>
		function minEndValue() {
			var d = document.getElementById("Test_Date").value;
			var c = new Date(d);
			var end = document.getElementById("Test_Date1");
			c.setDate(c.getDate() + 2);
			var y = c.getFullYear();
			var m = c.getMonth() + 1;
			var dd = c.getDate();
			if (m < 10)
				m = "0" + m;
			if (dd < 10)
				dd = "0" + dd;
			end.min = y + "-" + m + "-" + dd;
		}
	</script>
	<footer>&copy; Copyright 2020 All rights reserved</footer>

</body>
</html>