<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link href="style.css" rel="stylesheet" />

</head>
<body background="cherry.jpg">
<form action="/logout"> <button type="submit" class="button button4" style="float: right">Logout</button></form>
<article>
<header>
<a href="/show-data"><button class="button button4" >DashBoard </button></a>
<center><img src="macgro.png" height="100" width="100"/></center>

</header>
</article>

	<h1>Edit Profile</h1>
	<form action="/edit-submit" >
			<label><a href="#" data-toggle="tooltip"
				title="Do you currently have hormone levels more akin to a male or female?  We ask this to prevent overfeeding/starving when calculating allowances.">Gender:
			</a></label> <select name="gender" >
				
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
			 <label><a href="#"
				data-toggle="tooltip"
				title="The dirty secret here is that you're not as active as you think you are.  If you're unsure, select an activity level 1 lower than you feel could be correct.  You can always change it later if you start to exercise more or less!">Activity
					Level: </a></label> 
			 <select	name="activity">
				<option value="1.2" <c:if test="${user.activityLevel=='1.2'}"> selected </c:if>>Sedentary</option>
				<option value="1.375" <c:if test="${user.activityLevel=='1.375'}"> selected </c:if>>Lightly Active (1-2 workouts per week)</option>
				<option value="1.55" <c:if test="${user.activityLevel=='1.55'}"> selected </c:if>>Moderately (3-5 workouts per week)</option>
				<option value="1.725" <c:if test="${user.activityLevel=='1.725'}"> selected </c:if>>Very Active (6-7 workouts per week)</option>
				<option value="1.9" <c:if test="${user.activityLevel=='1.9'}"> selected </c:if>>Extremely Active (2 workouts daily)</option>

			</select><br><br>
				<label><a href="#" data-toggle="tooltip" title="The typical interval we recommend is 7 days, so these are what we calculate to weight gain/loss per week.">Weekly goal: </a></label>
				<select name="change" >
					<option value="500" <c:if test="${user.plan=='Gain 1 pound'}"> selected </c:if>>Gain 1 Pound/Gain 0.453 Kg</option>
					<option value="250" <c:if test="${user.plan=='Gain 0.5 pound'}"> selected </c:if>>Gain .5 pound/Gain 0.23 Kg</option>
					<option value="0" <c:if test="${user.plan=='Maintain'}"> selected </c:if>>Maintain</option>
					<option value="-250" <c:if test="${user.plan=='Loose 0.5 pound'}"> selected </c:if>>Lose .5 pound/Lose 0.23 Kg</option>
					<option value="-500" <c:if test="${user.plan=='Loose 1 pound'}"> selected </c:if>>Lose 1 pound/Lose 0.453 Kg</option>
				</select><br><br>
			<label><a href="#" data-toggle="tooltip" title="New interval starts here.  We recommend a week, but it should be tailored to what you can manage and use to prevent any spoiled food.">Start Date:</a></label>
			<input type="date" name="datepickerStart" id="Test_Date" min="${start}" onchange="minEndValue()" required>
			<label>End Date:</label>
			<input type="date" name="datepickerEnd" id="Test_Date1"  required><br><br>
			<button type="submit" onclick="myFunction()">Save</button>
	</form><br><br><br>
				<script>
function myFunction() {
  confirm("New Interval started with  new updated values!!");
}
function minEndValue(){
	var d=document.getElementById("Test_Date").value;
	var c=new Date(d);
	var end=document.getElementById("Test_Date1");
	 c.setDate(c.getDate()+2);
	 var y=c.getFullYear();
	 var m=c.getMonth()+1;
	 var dd=c.getDate();
		if(m<10)
			m="0"+m;
		if(dd<10)
			dd="0"+dd;
		end.min=y+"-"+m+"-"+dd;          
}
</script>
	<footer>&copy; Copyright 2020 All rights reserved </footer>
</body>
</html>