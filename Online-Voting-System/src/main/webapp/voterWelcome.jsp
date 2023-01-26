<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@include file="navbar.jsp" %>

<body>
<div class ="form-container">
<form action="Vote" method="post">
<h4> Please fill the required details:</h4>

<label for= "voterNumber">VOTER ID</label>
<br>
<input  name="voterNumber"  id="voterNumber"  type="text" >

<label for="partie">Choose a partie:</label>
<br>
<select name="partie" id="partie">

  <option value="Aap">Aam Aadmi Party</option>
  <option value="bjp">BJP</option>
  <option value="bsp">BSP</option>
   <option value="congress">Congress</option>
  <option value="cpi">CPI</option>
  
</select>

<button type ="submit">Submit</button>

</form>
</div>
</body>
</html>