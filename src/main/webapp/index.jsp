<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
	body footer{
	      margin-top:120px;
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
<%@include file="header.jsp" %>
<%
String userName = null;
Cookie[] cookie = request.getCookies();
for(Cookie c : cookie){
	if(c.getName().equals("user")){
		userName = c.getValue();
		response.sendRedirect("Services.jsp");
		//out.print(userName);
	}
}
%>
	<center>
    <h2 style="margin-top:60px; font-size: 30px;  color:#4B0082;">Login Here</h2>
    <div>
        <form action="home" method="post">
            <table>
                <tr>
                    <td><label>User Id:</label></td>
                    <td><input type="text" id="name" name="name" minlength="7" maxlength="7" pattern=[0-9]{7} required></td>
                </tr>
                <tr>
                    <td><label>Password:</label></td>
                    <td><input type="password" id="pwd" name="pwd" minlength="8" maxlength="30" required></td>
                </tr>
                <div id="message" style="color:red"></div>
            </table>
        <button type="submit">Submit</button>
        </form>
    </div>
    </center>
    <script>
    <% 
    try{
        %>if(<%=(int)session.getAttribute("st")%> == 1){
            document.getElementById('message').innerHTML = "Invalid Credentials!";
            <% session.setAttribute("st",0); %>
        }
        
        <%
    }catch(Exception e){}
    %>
    </script>
    <%@include file="footer.jsp" %>
</body>
</html>