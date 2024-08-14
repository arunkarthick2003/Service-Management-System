<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Services</title>
<meta charset="ISO-8859-1">
<style>
/* services boxes css */
     body footer{
      margin-top:120px;
  }
	.bdy{
	    margin-top: 50px;
	}
	.design{
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
    .container{
        display: grid;
        grid-template-columns: auto auto auto auto;
        width: 80%;
        height: 70%;
        padding: 20px 0px 20px 20px;
        margin: auto;
        margin-top: 60px;
        grid-gap:25px;
    }
    .item{
        width: 220px;
        height: 100%;
        border: 1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        border-radius:4px;
        color: #4B0082;
    }
    div>h2{
        text-align: center;
        font-size: 25px;
        margin-top: 65px;
        padding-bottom:40px;
    }
   

</style>
</head>
<body>
<%@include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
<div class="bdy">
    <div class="container">
        <a href="ac-repair.jsp" class="design"><div class="item"><h2>AC Repair <br> Service</h2></div></a>
        <a href="tv-repair.jsp" class="design"><div class="item"><h2>TV Repair <br> Service</h2></div></a>
        <a href="fridge-repair.jsp" class="design"><div class="item"><h2>Fridge Repair <br> Service</h2></div></a>
        <a href="wm-repair.jsp" class="design"><div class="item"><h2>Washing Machine <br>Repair Service</h2></div></a>
        <a href="HouseCleaning.jsp" class="design"><div class="item"><h2>House Cleaning<br> Service</h2></div></a>
        <a href="vehicle-repair.jsp" class="design"><div class="item"><h2>Vehicle Repair<br> Service</h2></div></a>
        <a href="PickAndDrop.jsp" class="design"><div class="item"><h2>Product Pickup & drop Service</h2></div></a>
        <a href="Plumbing.jsp" class="design"><div class="item"><h2>Plumbing <br>Service</h2></div></a>
    </div>
 </div>
 <%@include file="footer.jsp" %>
</body>
</html>