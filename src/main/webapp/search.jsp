<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Service Management System</title>
    <style>
     body footer{
		    margin-top:215px;
		}
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #E6E6FA;
            box-shadow: 6px 6px 15px grey;
            padding: 1em;
        }
        li {
            display: inline-block;
        }
        .nav-links {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        .nav-links li {
            position: relative;
        }
        .nav-links a {
            color: #4B0082;
            text-decoration: none;
            font-size: 20px;
            font-weight: 500;
            padding: 0.20em 0.8em;
            display: block;
        }
        .nav-links a:hover {
            background-color: #9370DB;
            border-radius: 4px;
            color: white;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            border: 1px solid grey;
            border-radius: 4px;
            background-color: #E6E6FA;
            min-width: 145px;
            z-index: 1;
            top: 100%;
            left: 0;
        }
        .dropdown-content a {
            padding: 0.40em 1.5em;
            text-decoration: none;
            display: block;
            color: #4B0082;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }
            .nav-links {
                flex-direction: column;
                width: 100%;
            }
            .nav-links li {
                width: 100%;
            }
            .nav-links a {
                width: 100%;
            }
            .dropdown-content {
                position: static;
            }
        }
        td {
            font-size: 15px;
            color: #4B0082;
            text-align: center;
            padding: 10px 15px;
        }
        th {
            text-align: center;
            padding: 5px 10px;
            color: #4B0082;
            font-weight: bold;
            font-size: 20px;
        }
        #left{
            text-decoration: none;
            width: 100px;
            padding: 8px 10px;
            border: 1px solid black;
            background-color: #9370DB;
            color: white;
            border-radius: 4px;
            font-size: 20px;
        }
        #right{
            text-decoration: none;
            width: 100px;
            padding: 8px 10px;
            border: 1px solid black;
            background-color: #9370DB;
            color: white;
            border-radius: 4px;
            font-size: 20px;
        }
        table {
            padding: 8px 10px;
            border: 1px solid black;
            background-color: #E6E6FA;
            border-radius: 4px;
            box-shadow: 6px 6px 15px grey;
            margin: 30px 10px;
        }
        .search-container {
            display: flex;
            align-items: center;
            position: relative;
        }
        .search-input {
            width: 0;
            padding: 10px;
            border: none;
            border-radius: 4px;
            outline: none;
            transition: width 0.4s ease-in-out;
            opacity: 0;
            visibility: hidden;
        }
        .search-button {
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .searchbutton {
            background-color: #E6E6FA;
            border: 0px;
        }
        .action-button {
            border: none;
            background-color: #E6E6FA;
            color: #4B0082;
            width: 50px;
            padding: 8px 10px;
        }
        .action-button:hover{
            text-decoration: none;
            width: 50px;
            padding: 8px 10px;
            background-color: #9370DB;
            color: white;
            border-radius: 4px;
        }
        
        #pagination{
    	margin-top : 30px;
    	text-align : center;
	    }
	    #pagination a{
	    	text-decoration: none;
	    	border: 1px solid black;
	    	padding:5px 10px;
	    	background-color:#9370DB;
	    	color:white;
	    	border-radius:4px;
	    	margin-right:5px;
	    }
    </style>
    <script src="script.js"></script>
</head>
<body>
	<nav class="navbar">
        <div>
            <h1 style="margin-top: -5px; margin-bottom: 0px; color: #4B0082; font-size: 32px;"><a style="text-decoration: none; color: #4B0082;"  href="AdminHome.jsp" >Service Management System</a></h1>
        </div>
        <ul class="nav-links">
            <div class="search-container">
                <form action="AdminMainSearch" id="register" method="post">
                	<input type="phone" id="search" name = "id" minlength="7" maxlength="7" pattern="[0-9]{7}" placeholder="Search by ID" required>
                	<button type="submit" value="&#x1F50D">&#x1F50D</button>
                </form>
                <li><a href="admincheckcookie">Logout</a></li>
            </div>
        </ul>
    </nav>
    <center>
        <div style="margin-top: 70px; color: #4B0082; font-size: 16px;">
            <h1>Welcome, Admin!</h1>
        </div>
    </center>
     <%@ page import="java.sql.*, java.util.*" %>
     <%
     	Object uname = request.getAttribute("uname");
  		String id = request.getParameter("id");
        String userName = null;
        Cookie[] cookie1 = request.getCookies();
        for(Cookie c : cookie1){
        	if(c.getName().equals("role-type")){
        		userName = c.getValue();
        		//out.print(userName);
        	}
        }
        if(userName == null) response.sendRedirect("admin_Login_Page.jsp");

        response.setHeader("Cache-Control", "no-cache,no-store,must revalidate");
        
	%>
    <div class="bdy">
    <center>    
        <div id="table">   
            <table id="myTable">
                <tr>
                    <th>Customer Id</th>
                    <th>User Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <th><%= id %></th>
                    <th><%=uname %></th>
                    <th><button><a href = "adminUpdate.jsp">Edit</a></button></th>
                    <th><button><a href ="Delete">Delete</a>
                    </button></th>
                </tr>
                </table>
                </div>
                </center>
                </div>
         <%@include file="footer.jsp" %>
  </body>
</html>