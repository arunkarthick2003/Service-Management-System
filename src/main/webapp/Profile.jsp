<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
    /* Body css */
    body{
	    min-height: 97vh;
	    display: flex;
	    flex-direction: column;
    }
    .profile-container { 
        padding: 20px;
        display: flex;
        justify-content:center;
    }
    .profile-img {
        flex-shrink: 0;
        margin-right: 20px;
        padding:10px 30px;
    }

    .profile-img img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #333;
    }

    .profile-details {
        background-color: #E6E6FA;
        padding:10px 5px 0px 5px;
        width: 400px;
        border-radius: 5px;
        box-shadow:6px 6px 15px grey;
    }

    .profile-name {
        font-size:28px;
        color: #4B0082;
        margin-top: 10px;
        margin-bottom: -5px;
    }
    .heading{
        font-size:25px;
        color: #4B0082;
        margin-top: 80px;
        text-shadow: grey;
    }
    label{
       color: #4B0082;
       font-weight: 600;
       font-size: 23px;
    }
    td{
        padding:10px;
        font-size:23px;
        color: #4B0082;
    }
    table{
        margin-top: 10px;
    }
    </style>
</head>
<body>
<%@ include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
 <center>
    <h2 class="heading">Contact Information</h2>
    <div class="profile-container">
            <div class="profile-img">
                <img src="demo_profile.png" alt="Profile Picture">                 
                <h1 class="profile-name"><%= request.getAttribute("name") %></h1>
            </div>
           
                <div class="profile-details">
                    <table>
                        <tr>
                            <td><label>Email:</label></td>
                            <td id="email">
                            
                            <%= request.getAttribute("email")%>
                            
                            </td>
                        </tr>
                        <tr>
                            <td><label>Phone:</label></td>
                            <td id="phn">
                            
                            <%= request.getAttribute("num")%>
                            
                            </td>
                        </tr>
                        <tr>
                            <td><label>Location:</label></td>
                            <td id="location">
                            <%= request.getAttribute("addr")%>
                            </td>
                        </tr>
                    </table>
                </div>
    </div>
</center>
<%@include file="footer.jsp" %>
</body>
</html>