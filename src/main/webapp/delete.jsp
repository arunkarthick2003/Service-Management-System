<%@ page import="java.sql.*" %>
<%
String serviceId = request.getParameter("id");
int sid = Integer.parseInt(serviceId);
Connection con = null;
PreparedStatement ps = null;
try {
		String url = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
		String user = "team5";
		String password = "team5";
		
        Class.forName("org.sqlite.JDBC");
        con = DriverManager.getConnection(url, user, password);
        String deleteSql = "DELETE FROM Services WHERE service_id = ?";
        ps = con.prepareStatement(deleteSql);
        ps.setInt(1, sid);
        ps.executeUpdate();
        ps.close();
        con.close();
        out.println("<script>alert('"+serviceId+" Deleted Successfully');</script>");
        //response.sendRedirect("adminUpdate.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminUpdate.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>