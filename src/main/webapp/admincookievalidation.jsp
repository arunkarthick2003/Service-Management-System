<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userName = null;
String enc = null;
Cookie[] cookie = request.getCookies();
for(Cookie c : cookie){
	if(c.getName().equals("role-type")){
		userName = c.getValue();
		//out.print(userName);
	}
	if(c.getName().equals("enc")){
		enc = c.getValue();
	}
}
if(userName == null) response.sendRedirect("admin_Login_Page.jsp");

response.setHeader("Cache-Control", "no-cache,no-store,must revalidate");
%>
</body>
</html>