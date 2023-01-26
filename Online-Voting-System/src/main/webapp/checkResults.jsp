<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel = "stylesheet"  type = "text/css" href = "style.css">

<%
   
    Integer a[] = new Integer[100];
 
    Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevotingdb","root","Becemysql20@");
	
	PreparedStatement preparedStatement = con.prepareStatement("select partie,count(partie) as c from vote group by partie");
	ResultSet rs=((java.sql.Statement) preparedStatement).executeQuery("select partie,count(partie) as c from vote group by partie");
	
    int i=0;
    while(rs.next()){
        int temp = Integer.valueOf(rs.getString("c"));
        a[i]=temp-1;
        i++;
    }
    %>
    
</head>

<%@include file="adminNavbar.jsp" %>

<body>

<div class="checkTable">
<table>
<tr>
<th>
Parties
</th>
<th>
Names
</th>
<th>
Votes
</th>
</tr>

<tr>
<td>
<img src="https://th.bing.com/th/id/R.d31e7d7eafddf44bea42e0b971f6cead?rik=Y6HbJDOCtYFSQg&riu=http%3a%2f%2fwww.newsshare.in%2fwp-content%2fuploads%2f2017%2f01%2fAam-Aadmi-Party-Logo-4-180x180.jpg&ehk=5e1%2fW407Gcnc2ugjTaRbox8oaY%2bc6rpx%2fL6t4uU4OV4%3d&risl=&pid=ImgRaw&r=0" alt=AAP>
</td>
<td>Aam Aadmi Party</td>
<td><%=a[0]==null?0:a[0]%></td>
</tr>

<tr>
<td>
<img src="https://th.bing.com/th/id/OIP.Q0XqyfnzWbNBTRokg7OM5gHaHa?pid=ImgDet&rs=1" alt=BJP>
</td>
<td>BJP</td>
<td><%=a[1]==null?0:a[1]%></td>
</tr>

<tr>
<td>
<img src="https://th.bing.com/th/id/OIP.9mRVsx4aGnTnWXPfsWweXQAAAA?pid=ImgDet&rs=1" alt=BSP>
</td>
<td>BSP</td>
<td><%=a[2]==null?0:a[2]%></td>
</tr>

<tr>
<td>
<img src="https://clipground.com/images/congress-party-logo-png-12.png" alt=Congress>
</td>
<td>Congress</td>
<td><%=a[3]==null?0:a[3]%></td>
</tr>

<tr>
<td>
<img src="https://www.kindpng.com/picc/m/128-1286831_cpi-logo-communist-party-of-india-hd-png.png" alt=CPI>
</td>
<td>CPI</td>
<td><%=a[4]==null?0:a[4]%></td>
</tr>

</table>
</div>

</body>
</html>