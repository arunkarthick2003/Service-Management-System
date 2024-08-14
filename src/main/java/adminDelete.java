//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/Delete")
//public class adminDelete extends HttpServlet {
//private static final long serialVersionUID = 1L;
//
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    // Database connection parameters
//    String jdbcUrl = "jdbc:sqlite:C:\\Users\\YourPath\\MySQLiteDB";
//    String user = "team5";
//    String pass = "team5";
//    String id = null;
//    Cookie[] cookie = request.getCookies();
//    for(Cookie c : cookie){
//        if(c.getName().equals("cid")){
//            id = c.getValue();
//        }
//    }
//
//    // Get customer ID from the request
//    int cid = Integer.parseInt(id);
//
//    // SQL query for deletion
//    String sql = "DELETE FROM ServiceCustomer WHERE customer_id = ?";
//
//    // Response writer
//    PrintWriter out = response.getWriter();
//    response.setContentType("text/html");
//
//    try {
//        // Establish database connection
//        Class.forName("org.sqlite.JDBC");
//        Connection conn = DriverManager.getConnection(jdbcUrl,user,pass);
//                // Prepare statement
//        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setInt(1, cid);
//        System.out.println("Ok");
//        // Execute update
//        ps.executeUpdate();
//        
////        // Check if the delete was successful
////        if(result > 0) {
////            out.println("<h3>Customer ID " + id + " deleted successfully.</h3>");
////        } else {
////            out.println("<h3>Failed to delete Customer ID " + id + ".</h3>");
////        }
//
//        // Close resources
//        out.println("<html><body><script>alert('"+cid+" Deleted Successfully');</script></body></html>");
//        ps.close();
//        conn.close();
//        
//    } catch (ClassNotFoundException | SQLException e) {
//        out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
//        e.printStackTrace(out);
//    }
//   
//
//    //Redirect to the main admin page after deletion
//   RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
//   dispatcher.forward(request, response);
//}
//}


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class adminDelete extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Database connection parameters
	String jdbcUrl = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
    String user = "team5";
    String pass = "team5";
    String id = null;
    Cookie[] cookie = request.getCookies();
    for(Cookie c : cookie){
        if(c.getName().equals("enc")){
            id = c.getValue();
        }
    }

    // Get customer ID from the request

    // SQL query for deletion
    String sql = "DELETE FROM ServiceCustomer WHERE cid_encrypted = '"+id+"'";

    // Response writer
    PrintWriter out = response.getWriter();
    response.setContentType("text/html");

    try {
        // Establish database connection
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection(jdbcUrl,user,pass);

        // Prepare statement
        PreparedStatement ps = conn.prepareStatement(sql);

        // Execute update
        ps.executeUpdate();
        ps.close();
        conn.close();
        out.println("<script>alert(Deleted Successfully)</script>");
    } catch (ClassNotFoundException | SQLException e) {
        out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
        e.printStackTrace(out);
    }
   

    //Redirect to the main admin page after deletion
   RequestDispatcher dispatcher = request.getRequestDispatcher("AdminHome.jsp");
   dispatcher.include(request, response);
}
}