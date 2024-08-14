<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success Page</title>
<style>
     body footer{
      margin-top:85px;
  }
    label,td{
       color: #4B0082;
    }
    td{
        padding:10px;
        font-size:25px;
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
<%-- JDBC INSERTION OF DATA --%>

<%-- HTML REGISTER SUCCESS PAGE  --%>
<%@include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
<%@page import="java.io.*,java.util.*" %>
<%
	//String id = request.;
	String vender = request.getParameter("vender");
	String slot = request.getParameter("slot");
	String type = request.getParameter("type");
%>
<center> 
    <div>
        <h1 style="color:green; margin-top:70px; margin-bottom:20px; font-size:40px;"><%=type %> Service Booked Successfully</h1>
    </div>
    <div class="bdy">
        <table>
            <tr>
                <td><label>Service Id:</label></td>
                <td id="custId">
                <%= request.getAttribute("ser_id")%>
                </td>
            </tr>
            <tr>
                <td><label>Vender Name:</label></td>
                <td id="name">
                <%=vender %>
                </td>
            </tr>
            <tr>
                <td><label>Date/Slot:</label></td>
                <td id="slot">
                <%=slot %>
                </td>
            </tr>
        </table>
    </div>
    </center>
    <%@include file="footer.jsp" %>
</body>
</html>