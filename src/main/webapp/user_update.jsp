<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <title>Service Management System</title>
  <style>
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #E6E6FA;
      box-shadow: 6px 6px 15px grey;
      padding: 1em;
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

    .profile-container {
      padding: 20px;
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
    }

    .profile-img {
      flex-shrink: 0;
      margin-top: 60px;
      margin-right: 20px;
      padding: 10px 30px;
    }

    .profile-img img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      border: 4px solid #333;
    }

    .profile-details {
      background-color: #E6E6FA;
      padding: 20px;
      width: 400px;
      border-radius: 15px;
      box-shadow: 6px 6px 15px grey;
      margin-bottom: 20px;
      margin-right: 10px;
    }

    .profile-name {
      font-size: 28px;
      color: #4B0082;
      margin-top: 10px;
      margin-bottom: -5px;
    }

    .heading {
      font-size: 25px;
      color: #4B0082;
      text-shadow: grey;
      margin-bottom: 15px;
    }

    .heading1 {
      font-size: 25px;
      color: #4B0082;
      text-shadow: grey;
      margin-bottom: 15px;
      margin-top: 40px;
    }

    label {
      color: #4B0082;
      font-weight: 600;
      font-size: 23px;
    }

    td {
      padding: 10px;
      font-size: 21px;
      color: #4B0082;
      margin-bottom: 15px;
      text-align: left;
    }

    th {
      padding: 10px;
      font-size: 18px;
      color: #4B0082;
      text-align: center;
    }

    table {
      margin-top: 10px;
      width: 100%;
    }

    .btn,
    .btn1 {
      padding: 0.5em 1em;
      font-size: 18px;
      color: white;
      background-color: #4B0082;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn:hover,
    .btn1:hover {
      background-color: #9370DB;
    }

    .full-width-table {
      width: calc(92% - 80px);
      margin-left: 20px;
      background-color: #E6E6FA;
      padding: 10px;
      border-radius: 15px;
      box-shadow: 6px 6px 15px grey;
      margin-top: 10px;
      margin-bottom: 31px;
    }

    .full-width-table table {
      width: 95%;
      border-collapse: collapse;
    }

    .full-width-table th,
    .full-width-table td {
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }
     #pagination1{
    	margin-top : 30px;
    	text-align : center;
	    }
	    #pagination1 a{
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
<%@ include file="cookievalidation.jsp" %>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%
// 				int cid=Integer.parseInt(userName);
                String url = "jdbc:sqlite:C:\\Users\\2726903\\MySQLiteDB";
                String user = "team5";
                String password = "team5";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                String cid=null;
                String customerName="";
                String email="";
                String address="";
                long contact=0;
                try{
                	Class.forName("org.sqlite.JDBC");
                	con = DriverManager.getConnection(url,user,password);
                	stmt = con.createStatement();
                	String sql = "Select * from ServiceCustomer WHERE cid_encrypted= '"+userName + "'";
                	rs = stmt.executeQuery(sql);
                	while(rs.next()){
                		cid = rs.getString("cid_encrypted");
        				customerName=rs.getString("customer_name");
        				email=rs.getString("email");
        				contact=rs.getLong("contact_num");
        				address=rs.getString("address");
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
             %>
<%@ include file="MainHeader.jsp" %>

  <center>
    <h2 class="heading1">CUSTOMER DETAILS</h2>
    <div class="profile-container">
      <div class="profile-img"> <img src="demo_profile.png" alt="Profile Picture">
        <h1 class="profile-name" name="name"><%= customerName %></h1>
      </div>
      <div class="profile-details">
        <h2 class="heading">Current Details</h2>
        <table>
          <tr>
            <td><label>Email:</label></td>
            <td id="current-email" name="email1"><%= email %></td>
          </tr>
          <tr>
            <td><label>Phone:</label></td>
            <td id="current-phone" name="num1"><%= contact %></td>
          </tr>
          <tr>
            <td><label>Location:</label></td>
            <td id="current-location" name="addr1"><%= address %></td>
          </tr>
        </table>
      </div>
      <div>
        <table>
          <th></th>
        </table>
      </div>
      <form action="userupdatesuccess" method="post">
        <div class="profile-details">
          <h2 class="heading">Update Details</h2>
          <table>
            <tr>
              <td><label>Email:</label></td>
              <td><input type="email" id="update-email" name="email" onkeypress="return blockSpecialCharacters(event);" style="height: 25px; border-radius: 4px;"></td>
            </tr>
            <tr>
              <td><label>Phone:</label></td>
              <td><input type="phone" id="update-phone" name="num" onkeypress="return blockSpecialCharacters(event);" minlength="10" maxlength="10" style="height: 25px; border-radius: 4px;"></td>
              
            </tr>
            <tr>
              <td><label>Location:</label></td>
              <td><input type="text" id="update-location" name="addr" maxlength="100" style="height: 25px; border-radius: 4px;"></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align: center;"> <button type="submit" class="btn">Update</button> </td>
            </tr>
          </table>
        </div>
      </form>
    </div>
    <div class="full-width-table">
      <h2 class="heading">Active Customer Services</h2>
      <table id="myTable">
        <%@ page import="java.time.*,java.time.format.DateTimeFormatter" %>
        <%
                List<Map<String,String>> dataActive = new ArrayList<>();
        List<Map<String,String>> dataInactive = new ArrayList<>();
                try{
                	Class.forName("org.sqlite.JDBC");
                	con = DriverManager.getConnection(url,user,password);
                	stmt = con.createStatement();
                	String sql = "Select * from Services WHERE cid_encrypted='"+cid+"'";
                	rs = stmt.executeQuery(sql);
                	while(rs.next()){
                		String date1=rs.getString("date");
                		LocalDateTime now=LocalDateTime.now();
                		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                		LocalDateTime input=LocalDateTime.parse(date1,formatter);
                		if(input.isAfter(now)){
                			Map<String, String> row = new HashMap<>();
                   			row.put("service_id", rs.getString("service_id"));
                   		 	row.put("vendor",rs.getString("vendor"));
                            row.put("date", rs.getString("date"));
                            row.put("type", rs.getString("type_of_service"));
                            row.put("address", rs.getString("address"));
                            dataActive.add(row);
                		}else{
                			Map<String, String> row1 = new HashMap<>();
                   			row1.put("service_id", rs.getString("service_id"));
                   		 	row1.put("vendor",rs.getString("vendor"));
                            row1.put("date", rs.getString("date"));
                            row1.put("type", rs.getString("type_of_service"));
                            row1.put("address", rs.getString("address"));
                            dataInactive.add(row1);
                		}
                		
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

                 // Convert the data list to a jsonActive string
                 StringBuilder jsonActive = new StringBuilder("[");
                 for (int i = 0; i < dataActive.size(); i++) {
                     jsonActive.append("{");
                     jsonActive.append("\"service_id\":\"").append(dataActive.get(i).get("service_id")).append("\",");
                     jsonActive.append("\"vendor\":\"").append(dataActive.get(i).get("vendor")).append("\",");
                     jsonActive.append("\"date\":\"").append(dataActive.get(i).get("date")).append("\",");
                     jsonActive.append("\"type\":\"").append(dataActive.get(i).get("type")).append("\",");
                     jsonActive.append("\"address\":\"").append(dataActive.get(i).get("address")).append("\",");
                     jsonActive.append("}");
                     if (i < dataActive.size() - 1) {
                         jsonActive.append(",");
                     }
                 }
                 jsonActive.append("]");
                 
              // Convert the data list to a jsonActive string
                 StringBuilder jsonInactive = new StringBuilder("[");
                 for (int i = 0; i < dataInactive.size(); i++) {
                     jsonInactive.append("{");
                     jsonInactive.append("\"service_id\":\"").append(dataInactive.get(i).get("service_id")).append("\",");
                     jsonInactive.append("\"vendor\":\"").append(dataInactive.get(i).get("vendor")).append("\",");
                     jsonInactive.append("\"date\":\"").append(dataInactive.get(i).get("date")).append("\",");
                     jsonInactive.append("\"type\":\"").append(dataInactive.get(i).get("type")).append("\",");
                     jsonInactive.append("\"address\":\"").append(dataInactive.get(i).get("address")).append("\",");
                     jsonInactive.append("}");
                     if (i < dataInactive.size() - 1) {
                         jsonInactive.append(",");
                     }
                 }
                 jsonInactive.append("]");
                 
             %>
      </table>
      <div id = "pagination1"></div>
    </div>
    <div class="full-width-table">
      <h2 class="heading">Service Rendered</h2>
      <table id="active-services">
        
      </table>
      <div id = "pagination1"></div>
    </div>
  </center>
  <script>
  const data1 = <%= jsonActive.toString() %>;
  const data2 = <%= jsonInactive.toString() %>;
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
          <th>Service Id</th>
          <th>Vendor</th>
          <th>Date</th>
          <th>Type of Services</th>
          <th>Address</th>
          <th>Delete</th>
      </tr>
  `;

      // Add new rows to the table
      slicedData.forEach(item => {
          const row = table.insertRow();
          const idCell = row.insertCell(0);
          const vendorCell = row.insertCell(1);
          const dateCell = row.insertCell(2);
          const typeCell = row.insertCell(3);
          const addressCell = row.insertCell(4);
          const actionCell = row.insertCell(5);
          idCell.innerHTML = item.service_id;
          console.log(idCell.innerHTML);
          vendorCell.innerHTML = item.vendor;
          dateCell.innerHTML=item.date;
          typeCell.innerHTML=item.type;
          addressCell.innerHTML=item.address;
         // actionCell.innerHTML=`<button onclick="deleteRow('${idCell.innerHTML}')" >Delete</button>`;
          /*var x = `deleteRow(${idCell.innerHTML})`;
         
          actionCell.innerHTML = "<button id='deleteBtn'>Delete</button>";
          var del = document.getElementById('deleteBtn');
        
          del.addEventListener('click', function(){
            deleteRow(idCell.innerHTML);
          });*/

          const deleteButton = document.createElement('button');
          deleteButton.textContent = 'DELETE';
          deleteButton.addEventListener('click',()=>deleteRow(item.service_id));
          actionCell.appendChild(deleteButton);
      });

      // Update pagination
      updatePagination1(page,data);
  }
  function displayTableInactive(page,data) {
      const table = document.getElementById("active-services");
      const startIndex = (page - 1) * rowsPerPage;
      const endIndex = startIndex + rowsPerPage;
      const slicedData = data.slice(startIndex, endIndex);
      // Clear existing table rows
      table.innerHTML = `
      <tr>
          <th>Service Id</th>
          <th>Vendor</th>
          <th>Date</th>
          <th>Type of Services</th>
          <th>Address</th>
      </tr>
  `;

      // Add new rows to the table
      slicedData.forEach(item => {
          const row = table.insertRow();
          const idCell = row.insertCell(0);
          const vendorCell = row.insertCell(1);
          const dateCell = row.insertCell(2);
          const typeCell = row.insertCell(3);
          const addressCell = row.insertCell(4);
          idCell.innerHTML = item.service_id;
          vendorCell.innerHTML = item.vendor;
          dateCell.innerHTML=item.date;
          typeCell.innerHTML=item.type;
          addressCell.innerHTML=item.address;
      });

      // Update pagination
      updatePagination2(page,data);
  }
  function deleteRow(serviceId) { 
	 // alert(serviceId);
	  if (confirm("Are you sure you want to delete this service?")) { 
		  window.location.href = 'user_delete.jsp?id=' + serviceId; 
	} 
	 }

  function updatePagination1(currentPage,data) {
      const pageCount = Math.ceil(data.length / rowsPerPage);
      const paginationContainer = document.getElementById("pagination1");
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
  function updatePagination2(currentPage,data) {
      const pageCount = Math.ceil(data.length / rowsPerPage);
      const paginationContainer = document.getElementById("pagination2");
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


  displayTable(currentPage,data1); 
  displayTableInactive(currentPage,data2);
  
  // Initial display
//     function updateDetails() {
//       const email = document.getElementById('update-email').value;
//       const phone = document.getElementById('update-phone').value;
//       const location = document.getElementById('update-location').value;
//       if (email) document.getElementById('current-email').innerText = email;
//       if (phone) document.getElementById('current-phone').innerText = phone;
//       if (location) document.getElementById('current-location').innerText = location;
//     }

//     function deleteService(button) {
//       const row = button.closest('tr');
//       const confirmation = confirm("Are you sure you want to delete this service?");
//       if (confirmation) {
//         row.parentNode.removeChild(row);
//       }
//     }
  </script>
  <%@include file="footer.jsp" %>
</body>

</html>