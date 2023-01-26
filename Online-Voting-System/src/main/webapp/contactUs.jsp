<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Registration</title>
<link rel = "stylesheet"  type = "text/css" href = "style.css">

</head>
<%@ include file="navbar.jsp" %>
<body>

<div class="form-container">
<form action="Contact1"  method="post">
<label for="uName">Name :</label>
<br>
<input name ="uName" id="uName" type="text">

<label for="pNumber">Phone Number :</label>
<br>
<input name ="pNumber" id="pNumber" type="number">

<label for="email">Email :</label>
<br>
<input name ="email" id="email" type="email">

<label for="comments">Comments :</label>
<br>
<textarea name ="comments" id="comments"  rows="4" cols="8"></textarea>


<button type="submit">Submit</button>

</form>
</div>

</body>
</html>