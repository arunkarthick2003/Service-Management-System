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
Cookie[] cookie = request.getCookies();
for(Cookie c : cookie){
	if(c.getName().equals("user")){
		userName = c.getValue();
		//out.print(userName);
	}
}
if(userName == null) response.sendRedirect("index.jsp");

response.setHeader("Cache-Control", "no-cache,no-store,must revalidate");
%>
</body>
</html>