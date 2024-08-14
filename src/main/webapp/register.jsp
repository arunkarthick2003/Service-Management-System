<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register Here</title>
<style>
     body footer{
      margin-top:100px;
  }
    form{
        border:1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        box-sizing: border-box;
        display: inline-block;
        border-radius:4px;
        padding:15px;
    }
    input{
        width:255px;
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
    <script src="script.js"></script>
</head>

<body>
	<%@include file="header.jsp" %>
    <center>
    <div>
        <h3 style="color:#4B0082; font-size:25px; margin-top:60px; margin-bottom:20px;">Register Here</h3>
        <form action="Success" id="register" method="post">
        <table>
            <tr>
                <td><label>User Name:</label></td>
                <td><input type="text" id="name" name="name" onkeypress="return blockSpecialCharacters(event);" maxlength="50" required></td>
            </tr>
            <tr>
                <td><label>Email:</label></td>
                <td><input type="email" id="email" name="email" onkeypress="return blockSpecialCharacters(event);" required></td>
            </tr>
            <tr>
                <td><label>Password:</label></td>
                <td><input type="password" id="pwd" name="pwd" minlength="8" maxlength="30" required></td>
            </tr>
            <tr>
                <td><label>Confirm password:</label></td>
                <td><input type="password" id="cnf_pwd" name="cnf_pwd" minlength="8" maxlength="30" required></td>
            </tr>
            <div id="message" style="color:red"></div>
            <tr>
                <td><label>Address:</label></td>
                <td><textarea id="addr" name="addr" rows="6" onkeypress="return blockSpecialCharacters(event);" style="width:255px; margin-top:6px;" maxlength="100" required></textarea></td>
            </tr>
            <tr>
                <td><label>Contact Number:</label></td>
                <td><input type="phone" id="num" name="num" minlength="10" maxlength="10" pattern="[0-9]{10}" required></td>
            </tr>
        </table>
        <button type="submit">Submit</button>
        </form>
    </div>
    </center>  
    <script>
    <% 
    try{
        %>if(<%=(int)session.getAttribute("st")%> == 1){
            document.getElementById('message').innerHTML = "Password and confirm password does not match!";
            <% session.setAttribute("st",0); %>
        }
        
        <%
    }catch(Exception e){}
    %>
    </script>
    <%@include file="footer.jsp" %>
</body>
</html>