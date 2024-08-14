<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>House Cleaning Services</title>
<link rel="stylesheet" href="headercss.css">
<style>
     body footer{
      margin-top:120px;
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
        margin-top: -10px;
        margin-left: 200px;
        grid-gap: 25px 120px;
    }
    .item{
        width: 215px;
        height: 100%;
        border: 1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        border-radius:4px;
        color: #4B0082;   
    }
    #item3{
        grid-row: 1/3;
        grid-column: 3/5;
    }
    #item4{
        grid-row: 2/3;
        grid-column: 1/2;
    }
    #item5{
        grid-row: 2/3;
        grid-column: 2/3;
    }
    div>h2{
        text-align: center;
        font-size: 28px;
        margin-top: 70px;
    }
    form{
        border:1px solid black;
        background-color:#E6E6FA;
        box-shadow:6px 6px 15px grey;
        box-sizing: border-box;
        display: inline-block;
        border-radius:4px;
        padding:15px;
        margin-top: 30px;`
        margin-left: 20px;
    }
    input,#vendor{
        width:255px;
        height:38px;
        margin-top:8px;
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
        margin:30px 0px 10px 110px;
    }

</style>
<script src="script.js"></script>
</head>
<body>
<%@include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
<center><div style="margin-top:35px; color:#4B0082; font-size:16px;"><h1>House Cleaning Service</h1></div></center>
    <div class="container">
        <div class="design"><div class="item" id="item1" onclick="house(1)"><h2>1 BHK <br>Cleaning</h2></div></div>
        <div class="design"><div class="item" id="item2" onclick="house(2)"><h2>2 BHK <br>Cleaning</h2></div></div>
        <div id="item3">
            <form action="ServiceRegistration" id="register" method = "post">
            <input type = "hidden" name = "type" id="type" value="House cleaning">
                <table>
                    <tr>
                        <td><label>Date:</label></td>
                        <td><input type="datetime-local" id="slot" name="slot" required></td>
                    </tr>
                    <tr>
                        <td><label>Address:</label></td>
                        <td><textarea id="addr" name="addr" rows="7" onkeypress="return blockSpecialCharacters(event);" style=" width:255px; margin-top:6px; margin-left: 10px;" maxlength="100" required></textarea></td>
                    </tr>
                    <tr>
                        <td><label>vendor:</label></td>
                        <td><select name="vender" id="vendor"  onchange="updateAmount()">
                            <option value="" disabled selected hidden>Choose a Service</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td><label>Amount:</label></td>
                        <td><input type="text" id="amount" name="amount" placeholder="Select type of service" readonly></td>
                    </tr>
                </table>
                <button type="submit">Submit</button>
            </form>
        </div>
        <div class="design"><div class="item" id="item4" onclick="house(3)"><h2>3 BHK<br>Cleaning</h2></div></div>
        <div class="design"><div class="item" id="item5" onclick="house(4)"><h2>Bathroom<br>Cleaning</h2></div></div>
    </div>
 <script>
 function house(buttonId) {
	    var selectElement = document.getElementById("vendor");
	    selectElement.style.display="block";
	    selectElement.innerHTML = "";
	    var options;
	    if (buttonId === 1) {
	        options = [
	            { value: 'hide', text: '',amount:"Select the vendor ", },
	            { value: 'K. Surya', text: 'K. Surya', amount: "1000/-"},
	            { value: 'M. Mahendra', text: 'M. Mahendra', amount: "1200/-"},
	            { value: 'A. Rakesh', text: 'A. Rakesh', amount: "1150/-"}
	        ];
	    } else if (buttonId === 2) {
	        options = [
	             { value: 'hide', text: '',amount:"Select the vendor "},
	            { value: 'S. Sudheer', text: 'S. Sudheer', amount: "2000/-" },
	            { value: 'P. Karthik', text: 'P. Karthik', amount: "2100/-" },
	            { value: 'M. Ramesh', text: 'M. Ramesh', amount: "2050/-" }
	        ];
	    }
	    else if (buttonId === 3) {
	        options = [
	             { value: 'hide', text: '',amount:"Select the vendor "},
	            { value: 'M. Ravi', text: 'M. Ravi', amount: "2900/-" },
	            { value: 'P. Mahesh', text: 'P. Mahesh', amount: "2950/-" },
	            { value: 'M. Koushik', text: 'M. Koushik', amount: "3000/-" }
	        ];
	    }
	    else if (buttonId === 4) {
	        options = [
	             { value: 'hide', text: '',amount:"Select the vendor "},
	            { value: 'S. Raj Kumar', text: 'S. Raj Kumar', amount: "1000/-" },
	            { value: 'P. Manikantha', text: 'P. Manikantha', amount: "1100/-" },
	            { value: 'M. Uday Kumar', text: 'M. Uday Kumar', amount: "1050/-" }
	        ];
	    }

	    options.forEach(function(option,index) {
	        var newOption = document.createElement("option");
	        newOption.value = option.value;
	        newOption.text = option.text;
	        newOption.setAttribute("amount", option.amount);
	        if(index === 0) newOption.hidden=true;
	        selectElement.appendChild(newOption);

	    });
	    
	    updateAmount();
	}

	function updateAmount() {
	    var selectElement = document.getElementById("vendor");
	    var selectedOption = selectElement.options[selectElement.selectedIndex];
	    var amount = selectedOption.getAttribute("amount");
	    document.getElementById("amount").value = amount;
	}
</script>
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
      </script>
<%@include file="footer.jsp" %>
</body>
</html>