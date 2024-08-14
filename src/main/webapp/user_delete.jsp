<%@ page import="java.sql.*" %>
<%
String serviceId = request.getParameter("id");
if (serviceId != null) {
int sid = Integer.parseInt(serviceId);
Connection con = null;
PreparedStatement ps = null;
try {
String url = "jdbc:sqlite:C:\\Users\\2726903\\MySQLiteDB";
String user = "team5";
String password = "team5";

        Class.forName("org.sqlite.JDBC");
        con = DriverManager.getConnection(url, user, password);

        String deleteSql = "DELETE FROM Services WHERE service_id = ?";
        ps = con.prepareStatement(deleteSql);
        ps.setInt(1, sid);
        ps.executeUpdate();
        
        response.sendRedirect("user_update.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
}
%>