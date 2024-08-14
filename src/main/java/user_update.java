
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminMain
 */
@WebServlet("/userupdatesuccess")
public class user_update extends HttpServlet {
	static Connection con;
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String id=null;
		Cookie[] cookie = request.getCookies();
	    for(Cookie c : cookie){
	        if(c.getName().equals("user")){
	            id = c.getValue();
	        }
	    }
		try {
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			Class.forName("org.sqlite.JDBC");
			String url = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
            String user = "team5";
            String password = "team5";
			String email = request.getParameter("email").trim();
			String address=request.getParameter("addr");
			String contact = request.getParameter("num").trim();
			con=DriverManager.getConnection(url,user,password);
			if(!email.isEmpty()) {
                String UpdateQuery = "update ServiceCustomer set email=? where cid_encrypted='"+id+"'";
                PreparedStatement pstmt = con.prepareStatement(UpdateQuery);
                pstmt.setString(1, email);
                pstmt.executeUpdate();
            }
            if(contact != "") {
                long contact_num = Long.parseLong(contact);
                String UpdateQuery = "update ServiceCustomer set contact_num=? where cid_encrypted='"+id+"'";
                PreparedStatement pstmt = con.prepareStatement(UpdateQuery);
                pstmt.setLong(1, contact_num);
                pstmt.executeUpdate();
            }
            if(address != "") {
                String UpdateQuery = "update ServiceCustomer set address=? where cid_encrypted='"+id+"'";
                PreparedStatement pstmt = con.prepareStatement(UpdateQuery);
                pstmt.setString(1, address);
                pstmt.executeUpdate();
            }
	        //request.setAttribute(Integer.parseInt(id), "id");
	        RequestDispatcher rd = request.getRequestDispatcher("user_update.jsp");
	    	rd.forward(request,response);
			con.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println(e1);
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); //not created yet
	    	rd.forward(request,response);
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
