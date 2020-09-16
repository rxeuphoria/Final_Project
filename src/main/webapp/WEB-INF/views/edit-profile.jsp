<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<article>
<header><a href="/show-data" class="homepage">@DashBoard</a>
</header>
</article>

	<h1>Edit Profile</h1>
	<form action="/edit" method="post">
		<input type="hidden" name="id" value="${user.id}" /> <label>Email:</label>
		<input type="email" name="email" /><br>
		<br> <label>Password:</label> <input type="password"
			name="password" /><br>
		<br> <label>Height:</label> <input type="number" name="height"
			step=".1" /> <label>in:</label> <select name="height_unit">
			<option value="centimeter" selected="selected">centimeter</option>
			<option value="inches">inches</option>
		</select><br>
		<br> <label>Weight:</label> <input type="number" name="weight"
			step=".1" /> <label>in:</label> <select name="weight_unit">
			<option value="pound" selected="selected">pound</option>
			<option value="kilogram">kilogram</option>
		</select><br>
		<br> <label>Age:</label> <input type="number" name="age" /><br>
		<br> <label>Activity Level:</label> <select name="activity">
			<option value="1.2">Sedentary</option>
			<option value="1.375">Lightly Active</option>
			<option value="1.55">Moderately</option>
			<option value="1.725">Very Active</option>
			<option value="1.9">Extremely Active</option>
		</select><br>
		<br> <label>Shopping Interval(in days):</label> <input
			type="number" name="interval" /><br>
		<br>

		<button type="submit">Submit</button>
	</form>
</body>
</html>