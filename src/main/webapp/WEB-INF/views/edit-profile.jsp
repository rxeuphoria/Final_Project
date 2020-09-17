<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<article>
<header><a href="/show-data" class="homepage">@DashBoard</a>
<center><img src="macgro.png" height="200" width="200"/></center>

</header>
</article>

	<h1>Edit Profile</h1>
	<form action="/edit-submit" >
			<label>Gender:</label> <select name="gender" >
				
				<option value="M" <c:if test="${user.gender=='M'}"> selected </c:if>>M</option>
				<option value="F" <c:if test="${user.gender=='F'}"> selected </c:if>>F</option>
			</select><br><br>
			<label>Height:</label>
			<input type="number" name="height" step=".1" value="${user.height}"/>
			<label>in:</label>
			<select name="height_unit"> 
				<option value="cms" <c:if test="${user.height_unit=='cms'}"> selected </c:if>>centimeter</option>

				<option value="inches" <c:if test="${user.height_unit=='inches'}"> selected </c:if>>inches</option>
			</select><br> <br> <label>Weight:</label>
			 <input type="number" name="weight" step=".1" value="${user.weight}"/> 
			 <label>in:</label> 
			 <select name="weight_unit">
				<option value="pound" <c:if test="${user.weight_unit=='pound'}"> selected </c:if>>pound</option>
				<option value="kg" <c:if test="${user.weight_unit=='kg'}"> selected </c:if>>kilogram</option>
			</select><br> <br>
			 <label>Age:</label> 
			 <input type="number"	name="age"  value="${user.age}"/><br> <br> 
			 <label>Activity Level:</label> 
			 <select	name="activity">
				<option value="1.2" <c:if test="${user.activityLevel=='1.2'}"> selected </c:if>>Sedentary</option>
				<option value="1.375" <c:if test="${user.activityLevel=='1.375'}"> selected </c:if>>Lightly Active</option>
				<option value="1.55" <c:if test="${user.activityLevel=='1.55'}"> selected </c:if>>Moderately</option>
				<option value="1.725" <c:if test="${user.activityLevel=='1.725'}"> selected </c:if>>Very Active</option>
				<option value="1.9" <c:if test="${user.activityLevel=='1.9'}"> selected </c:if>>Extremely Active</option>

			</select><br><br>
				<label>Plan for the Interval:</label>
				<select name="change" >
					<option value="500" <c:if test="${user.plan=='Gain 1 pound'}"> selected </c:if>>Gain 1 Pound</option>
					<option value="250" <c:if test="${user.plan=='Gain 0.5 pound'}"> selected </c:if>>Gain .5 pound</option>
					<option value="0" <c:if test="${user.plan=='Maintain'}"> selected </c:if>>Maintain</option>
					<option value="-250" <c:if test="${user.plan=='Loose 0.5 pound'}"> selected </c:if>>Loose .5 pound</option>
					<option value="-500" <c:if test="${user.plan=='Loose 1 pound'}"> selected </c:if>>Loose 1 pound</option>
				</select><br><br>
			Start Date: 
			<input type="date" name="datepickerStart" id="Test_Date" min="${start}"  max="${start}" required/>
			End Date:
			<input type="date" name="datepickerEnd" id="Test_Date1" min="${end}" required/><br><br>

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
	</form><br><br><br>
	<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>