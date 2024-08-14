<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Success</title>
<style>
     body footer{
      margin-top:70px;
  }
    a{
        text-decoration:none;
        width:30px;
        padding:8px 10px;
        border:1px solid black;
        background-color:#9370DB; 
        color:white;
        border-radius:4px;
        font-size:20px;
        margin-right:15px;
    }
    .nav-bar{
        border:1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        height:55px;
        border-radius:4px;
        padding:5px;
    }
    li{
        display:inline-block;
    }
    td{
        padding:10px;
        font-size:25px;
        color:#4B0082;
    }
    .bdy{
        border: 1px solid #4B0082;
        box-sizing: border-box;
        display: inline-block;
        background-color: #E6E6FA;
        border-radius: 4px;
        box-shadow:6px 6px 15px grey;
        margin-top: 40px;
        padding: 10px;
    }
</style>
</head>
<body>
<div class="nav-bar">
        <ul style="list-style-type:none;">
            <li style="margin-top:-35px; margin-left:-6px; color:#4B0082; font-size:18px;"><h1>Service Management System</h1></li>
            <li style="float:right;"><a href="index.jsp">Login</a></li>
        </ul>
    </div>

    <center>
    <div>
        <h1 style="color:green; margin-top:70px; margin-bottom:20px; font-size: 50px;">Registration Successful</h1>
    </div>

    <div class="bdy">
        <table>
            <tr>
                <td><label>User Id:</label></td>
                <td id="id"><%= request.getAttribute("id") %></td>
            </tr>
            <tr>
                <td><label>User Name:</label></td>
                <td id="name"><%= request.getAttribute("name1") %></td>
            </tr>
            <tr>
                <td><label>User Email:</label></td>
                <td id="mail"><%= request.getAttribute("mail") %></td>
            </tr>
        </table>
    </div>

    </center>
    <%@include file="footer.jsp" %>
</body>
</html>