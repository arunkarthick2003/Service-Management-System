<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fridge Repair</title>
<style>
     body footer{
      margin-top:120px;
  }
    form{
        border:1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        box-sizing: border-box;
        display: inline-block;
        border-radius:4px;
        padding:15px;
        margin-top: 10px;
    }
    input,#vender{
        width:255px;
        height:35px;
        margin-top:6px;
        margin-left: 10px;
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
<%@ include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
<div>
    <center>
        <div style="margin-top:70px; color:#4B0082; font-size:16px;"><h1>Fridge Repair Service</h1></div>
        <form action="ServiceRegistration" id="register" method="post">
        <input type = "hidden" name = "type" value = "Fridge Repair">
            <table>
                <tr>
                    <td><label>Date:</label></td>
                    <td><input type="datetime-local" id="slot" name="slot" required></td>
                </tr>
                <tr>
                    <td><label>Address:</label></td>
                    <td><textarea id="addr" name="addr" rows="6" onkeypress="return blockSpecialCharacters(event);" style=" width:255px; margin-top:6px; margin-left: 10px;" maxlength="100" required></textarea></td>
                </tr>
                <tr> 
                    <td><label>Vendor:</label></td>
                    <td><select name="vender" id="vender" onchange="updateAmount()">
                        <option value="none" hidden></option>
                        <option value="K. Naresh" data-amount="2050/-">K. Naresh</option>
                        <option value="M. Balu" data-amount="2050/-">M. Balu</option>
                        <option value="P. Sudheer" data-amount="2090/-">P. Sudheer</option>
                    </select></td>
                </tr>
                <tr>
                    <td><label>Amount:</label></td>
                    <td><input type="text" id="amount" name="amount" readonly></td>
                </tr>
            </table>
            <button type="submit">Submit</button>
        </form>
    </center>
    </div>
    <%@include file="footer.jsp" %>
    <script>
        document.addEventListener('DOMContentLoaded',(event)=>{
          const now = new Date();
          const year = now.getFullYear();
          const month = String(now.getMonth() + 1).padStart(2, '0');
          const day = String(now.getDate()+1).padStart(2,'0');
          const hours = String(now.getHours()).padStart(2,'0');
          const minutes = String(now.getMinutes()).padStart(2,'0');
          const seconds = String(now.getSeconds()).padStart(2,'0');
          const formattedDateTime =day+"-"+month+"-"+year+" "+hours+":"+minutes;  
          document.getElementById('slot').min = year+"-"+month+"-"+day+"T"+hours+":"+minutes;
        });
        //amount selection based on vendor 
        function updateAmount(){
            var selectElement = document.getElementById("vender");
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            var amount = selectedOption.getAttribute("data-amount");
            document.getElementById("amount").value = amount;
     }
     updateAmount();
      </script>
</body>
</html>