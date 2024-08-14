<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="headercss.css">
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache,no-store,must revalidate");
%>
	<nav class="navbar">
    <div><h1 style=" margin-top:-5px; margin-bottom: 0px; color:#4B0082; font-size: 32px;" >Service Management System</h1></div>
      <ul class="nav-links">
          <li><a href="Services.jsp">Home</a></li>
          <li><a href="user_update.jsp">ModifyDetails</a></li>
          <li><a href="History.jsp">History</a></li>
          <li><a href="profile">Profile</a></li>      
          <li><a href="checkcookie">Logout</a></li>
      </ul>
  </nav>
</body>
</html>