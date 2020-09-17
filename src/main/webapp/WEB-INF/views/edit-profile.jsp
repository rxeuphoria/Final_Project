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
	<form action="/edit-submit" >
			<label>Gender:</label> <select name="gender">
				<option value="M">M</option>
				<option value="F">F</option>
			</select><br><br>
			<label>Height:</label>
			<input type="number" name="height" step=".1" value="${user.height}"/>
			<label>in:</label>
			<select name="height_unit" value="${user.height_unit}"> 
				<option value="cms" >centimeter</option>

				<option value="inches">inches</option>
			</select><br> <br> <label>Weight:</label>
			 <input type="number" name="weight" step=".1" value="${user.weight}"/> 
			 <label>in:</label> 
			 <select name="weight_unit">
				<option value="pound" selected="selected">pound</option>
				<option value="kg">kilogram</option>
			</select><br> <br>
			 <label>Age:</label> 
			 <input type="number"	name="age"  value="${user.age}"/><br> <br> 
			 <label>Activity Level:</label> 
			 <select	name="activity">
				<option value="1.2">Sedentary</option>
				<option value="1.375">Lightly Active</option>
				<option value="1.55">Moderately</option>
				<option value="1.725">Very Active</option>
				<option value="1.9">Extremely Active</option>

			</select><br><br>
				<label>Plan for the Interval:</label>
				<select name="change" >
					<option value="500">Gain 1 Pound</option>
					<option value="250">Gain .5 pound</option>
					<option value="0">Maintain</option>
					<option value="-250">Loose .5 pound</option>
					<option value="-500">Loose 1 pound</option>
				</select><br><br>
			Start Date: 
			<input type="date" name="datepickerStart" id="Test_Date" min="${start}" required>
			End Date:
			<input type="date" name="datepickerEnd" id="Test_Date1" min="${start}" required><br><br>

			<button type="submit" onclick="myFunction()" ondblclick="My_Date()">Save</button>
			<script>
function myFunction() {
  confirm("New Interval started with  new updated values!!");
}
function My_Date() { 
    var d = document.getElementById("Test_Date").min; 
    document.getElementById("test").innerHTML = d; 
    var e = document.getElementById("Test_Date1").min; 
    document.getElementById("test").innerHTML = d; 
}
</script>
			
		</form>
		<br> <br> 
		<form action="/logout">
			<button type="submit">Logout</button>
		</form>
	</form>
</body>
</html>