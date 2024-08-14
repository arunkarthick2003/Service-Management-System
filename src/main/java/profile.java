

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class profile
 */
@WebServlet("/profile")
public class profile extends HttpServlet {
	static Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
		
		
		
		
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			String jdbcUrl = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
			String user = "team5";
			String pwd = "team5";
			con = DriverManager.getConnection(jdbcUrl,user,pwd);
			String userName = null;
			Cookie[] cookie = request.getCookies();
			for(Cookie c : cookie){
				if(c.getName().equals("user")){
					userName = c.getValue();
					//out.print(userName);
				}
			}
			if(userName == null) response.sendRedirect("index.jsp");
//			int id = Integer.parseInt(userName);
			
			String validateQuery="select * from ServiceCustomer where cid_encrypted = ?";
			PreparedStatement pstmt = con.prepareStatement(validateQuery);
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("customer_name");
				String email = rs.getString("email");
				long num = rs.getLong("contact_num");
				String addr = rs.getString("address");
				
				request.setAttribute("email", email);
				request.setAttribute("addr", addr);
				request.setAttribute("num", num);
				request.setAttribute("name", name);
//				pw.println(addr);
				RequestDispatcher rd = request.getRequestDispatcher("Profile.jsp");
		    	rd.forward(request,response);
			}
//	        out.println()
	        //request.setAttribute(Integer.parseInt(id), "id");
//	        pw.print("Successfully registered Complaint");
	        
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			pw.println(e1);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
