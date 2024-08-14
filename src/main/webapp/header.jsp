<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style>
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
    form{
        border:1px solid black;
        background-color:#E6E6FA;
        box-shadow:10px 10px 12px grey;
        display: inline-block;
        box-sizing: border-box;
        border-radius:4px;
        padding:15px;
        margin-top:20;
    }
    input{
        width:228px;
        height:35px;
        margin-top:6px;
    }
    label{
        font-size:20px;
        color:#4B0082; 
        font-weight:normal;
    }
    button{
        text-decoration:none;
        width:100px;
        padding:8px 10px;
        border:1px solid black;
        background-color:#9370DB;
        color:white;
        border-radius:4px;
        font-size:20px;
        margin-top:15px;
    }
    </style>
</head>
<body>
	<div class="nav-bar">
        <ul style="list-style-type:none;">
            <li style="margin-top:-35px; margin-left:-6px; color:#4B0082; font-size:18px;"><h1>Service Management System</h1></li>
            <li style="float:right;"><a href="index.jsp">Login</a></li>
            <li style="float:right;"><a href="register.jsp">Register</a></li>
        </ul>
    </div>
</body>
</html>