<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
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
<jsp:include page="header.jsp"></jsp:include>
<%
String userName = null;
Cookie[] cookie = request.getCookies();
for(Cookie c : cookie){
	if(c.getName().equals("role-type")){
		userName = c.getValue();
		response.sendRedirect("AdminHome.jsp");
		//out.print(userName);
	}
}
%>
	<center>
    <h2 style="margin-top:60px; font-size: 30px;  color:#4B0082;">Admin Login</h2>
    <div>
        <form action="admin_Login_Page" method="post">
            <table>
                <tr>
                    <td><label>User Name:</label></td>
                    <td><input type="text" id="adm_name" name="adm_name" maxlength="50" required></td>
                </tr>
                <tr>
                    <td><label>Password:</label></td>
                    <td><input type="password" id="pwd" name="pwd" minlength="8" maxlength="30" required></td>
                </tr>
            </table>
        <button type="submit">Submit</button>
        </form>
    </div>
    </center>
  
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>