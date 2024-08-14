<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Service Management System</title>
    <style>
	    body footer{
		    margin-top:65px;
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
            font-size: 20px;
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
</head>
<body>
<%@include file="admincookievalidation.jsp" %>
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
    <div class="bdy">
    <center>    
        <div id="table">   
            <table id="myTable">
                <tr>
                    <th>Customer Id</th>
                    <th>User Name</th>
                </tr>
                <%
                String url = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
                String user = "team5";
                String password = "team5";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                List<Map<String,String>> data = new ArrayList<>();
                try{
                	Class.forName("org.sqlite.JDBC");
                	
                	con = DriverManager.getConnection(url,user,password);
                	stmt = con.createStatement();
                	
                	String sql = "Select * from ServiceCustomer";
                	rs = stmt.executeQuery(sql);
                	
                	while(rs.next()){
                		Map<String, String> row = new HashMap<>();
                		 row.put("customer_id", rs.getString("customer_id"));
                         row.put("customer_name", rs.getString("customer_name"));
                         row.put("email", rs.getString("email"));
                         row.put("contact_num", rs.getString("contact_num"));
                         row.put("address", rs.getString("address"));
                         data.add(row);
                     }
                 } catch (Exception e) {
                     e.printStackTrace();
                     out.println(e);
                 } finally {
                     try {
                         if (rs != null) rs.close();
                         if (stmt != null) stmt.close();
                         if (con != null) con.close();
                     } catch (SQLException se) {
                         se.printStackTrace();
                         out.println(se);
                     }
                 }

                 // Convert the data list to a JSON string
                 StringBuilder json = new StringBuilder("[");
                 for (int i = 0; i < data.size(); i++) {
                     json.append("{");
                     json.append("\"customer_id\":\"").append(data.get(i).get("customer_id")).append("\",");
                     json.append("\"customer_name\":\"").append(data.get(i).get("customer_name")).append("\",");
                     json.append("\"email\":\"").append(data.get(i).get("email")).append("\",");
                     json.append("\"contact_num\":\"").append(data.get(i).get("contact_num")).append("\",");
                     json.append("\"address\":\"").append(data.get(i).get("address")).append("\",");
                     json.append("}");
                     if (i < data.size() - 1) {
                         json.append(",");
                     }
                 }
                 json.append("]");
                 
             %>
             
             
             
               </table>
            <div id = "pagination"></div>
         </div>	

	
     </center> 
     </div>
 <script>
 const data = <%= json.toString() %>;
 const rowsPerPage = 3;
 let currentPage = 1;

 function displayTable(page,data) {
     const table = document.getElementById("myTable");
     const startIndex = (page - 1) * rowsPerPage;
     const endIndex = startIndex + rowsPerPage;
     const slicedData = data.slice(startIndex, endIndex);

     // Clear existing table rows
     table.innerHTML = `
     <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Email</th>
         <th>Contact</th>
         <th>Address</th>
     </tr>
 `;

     // Add new rows to the table
     slicedData.forEach(item => {
         const row = table.insertRow();
         const idCell = row.insertCell(0);
         const nameCell = row.insertCell(1);
         const emailCell = row.insertCell(2);
         const contactCell = row.insertCell(3);
         const addressCell = row.insertCell(4);
         idCell.innerHTML = item.customer_id;
         nameCell.innerHTML = item.customer_name;
         emailCell.innerHTML=item.email;
         contactCell.innerHTML=item.contact_num;
         addressCell.innerHTML=item.address;
     });

     // Update pagination
     updatePagination(page,data);
 }

 function updatePagination(currentPage,data) {
     const pageCount = Math.ceil(data.length / rowsPerPage);
     const paginationContainer = document.getElementById("pagination");
     paginationContainer.innerHTML = "";

     for (let i = 1; i <= pageCount; i++) {
         const pageLink = document.createElement("a");
         pageLink.href = "#";
         pageLink.innerText = i;
         pageLink.onclick = function () {
             displayTable(i,data);
         };
         if (i === currentPage) {
             pageLink.style.fontWeight = "bold";
         }
         paginationContainer.appendChild(pageLink);
         paginationContainer.appendChild(document.createTextNode(" "));
     }
 }


 displayTable(currentPage,data); 
 
 // Initial display

 </script>
 <%@include file="footer.jsp" %>
</body>
</html>