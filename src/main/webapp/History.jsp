<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Services</title>
<style> 
	body{
    min-height: 97vh;
    display: flex;
    flex-direction: column;
    }
    li{
        display:inline-block;
    }
    td{
        font-size:15px;
        color: #4B0082;
		text-align:center;
		padding:20px;
    }
    th{
		text-align:center;
		padding:5px 10px;
		color:#4B0082;
		font-weight:bold;
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
	    margin:30px 10px;
    }
    table{
        padding:8px 10px;
        border:1px solid black;
        background-color:#E6E6FA;
        border-radius:4px;
	    margin-top:80px;
	    box-shadow:6px 6px 15px grey;
    }
    #pagination{
    	margin-top : 20px;
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
<%@include file="MainHeader.jsp" %>
<%@include file="cookievalidation.jsp" %>
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
                	String userName1 = null;
                	Cookie[] cookie1 = request.getCookies();
                	for(Cookie c : cookie1){
                		if(c.getName().equals("user")){
                			userName1 = c.getValue();
                			//System.out.println(userName1);
                		}
                	}
                	String sql = "Select * from Services where cid_encrypted = '" + userName1 +"'";
                	rs = stmt.executeQuery(sql);
                	while(rs.next()){
                		Map<String, String> row = new HashMap<>();
                         row.put("service_id", rs.getString("service_id"));
                         row.put("date", rs.getString("date"));
                         row.put("type_of_service", rs.getString("type_of_service"));
                         row.put("vendor", rs.getString("vendor"));
                         row.put("address", rs.getString("address"));
                         row.put("amount", rs.getString("amount"));
                         data.add(row);
                     }
                 } catch (Exception e) {
                     e.printStackTrace();
                 } finally {
                     try {
                         if (rs != null) rs.close();
                         if (stmt != null) stmt.close();
                         if (con != null) con.close();
                     } catch (SQLException se) {
                         se.printStackTrace();
                     }
                 }

                 // Convert the data list to a JSON string
                 StringBuilder json = new StringBuilder("[");
                 for (int i = 0; i < data.size(); i++) {
                     json.append("{");
                     json.append("\"service_id\":\"").append(data.get(i).get("service_id")).append("\",");
                     json.append("\"date\":\"").append(data.get(i).get("date")).append("\",");
                     json.append("\"type_of_service\":\"").append(data.get(i).get("type_of_service")).append("\",");
                     json.append("\"vendor\":\"").append(data.get(i).get("vendor")).append("\",");
                     json.append("\"address\":\"").append(data.get(i).get("address")).append("\",");
                     json.append("\"amount\":\"").append(data.get(i).get("amount")).append("\",");
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

        function displayTable(page) {
            const table = document.getElementById("myTable");
            const startIndex = (page - 1) * rowsPerPage;
            const endIndex = startIndex + rowsPerPage;
            const slicedData = data.slice(startIndex, endIndex);

            // Clear existing table rows
            table.innerHTML = `
            <tr>
                <th>service_id</th>
                <th>date</th>
                <th>type_of_service</th>
                <th>vendor</th>
                <th>address</th>
                <th>amount</th>
            </tr>
        `;

            // Add new rows to the table
            slicedData.forEach(item => {
                const row = table.insertRow();
                const sidCell = row.insertCell(0);
                const dateCell = row.insertCell(1);
                const tosCell = row.insertCell(2);
                const vendorCell = row.insertCell(3);
                const addrCell = row.insertCell(4);
                const amtCell = row.insertCell(5);
                sidCell.innerHTML = item.service_id;
                dateCell.innerHTML = item.date;
                tosCell.innerHTML = item.type_of_service;
                vendorCell.innerHTML = item.vendor;
                addrCell.innerHTML = item.address;
                amtCell.innerHTML = item.amount;
            });

            // Update pagination
            updatePagination(page);
        }

        function updatePagination(currentPage) {
            const pageCount = Math.ceil(data.length / rowsPerPage);
            const paginationContainer = document.getElementById("pagination");
            paginationContainer.innerHTML = "";

            for (let i = 1; i <= pageCount; i++) {
                const pageLink = document.createElement("a");
                pageLink.href = "#";
                pageLink.innerText = i;
                pageLink.onclick = function () {
                    displayTable(i);
                };
                if (i === currentPage) {
                    pageLink.style.fontWeight = "bold";
                }
                paginationContainer.appendChild(pageLink);
                paginationContainer.appendChild(document.createTextNode(" "));
            }
        }

        // Initial display
        displayTable(currentPage);
    </script>
    <%@include file="footer.jsp" %>
   </body>
</html>