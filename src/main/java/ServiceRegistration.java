import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
 * Servlet implementation class AcRepair
 */
@WebServlet("/ServiceRegistration")
public class ServiceRegistration extends HttpServlet {
	static Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
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
			
			Random r=new Random();
			int ser_id = 100 + r.nextInt(999);
			String checkId="select service_id from Services;";
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(checkId);
			while(rs.next()) {
				if(rs.getInt("service_id")==ser_id) {
					ser_id = 100 + r.nextInt(999);
				}
			}
			request.setAttribute("id", ser_id);
			String userName = null;
			Cookie[] cookie = request.getCookies();
			for(Cookie c : cookie){
				if(c.getName().equals("user")){
					userName = c.getValue();
				}
			}
			String vendor = request.getParameter("vender");
			String slot = request.getParameter("slot");
			String type = request.getParameter("type");
			String addr1 = request.getParameter("addr");
			String amtstr = request.getParameter("amount");
			int amount = Integer.parseInt(amtstr.substring(0,amtstr.length()-2));
			
			String insertQuery="insert into Services(service_id,cid_encrypted,date,type_of_service,vendor,address,amount)"
						+" values (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(insertQuery);
	        pstmt.setInt(1, ser_id);
	        pstmt.setString(2, userName);
	        pstmt.setString(3, slot);
	        pstmt.setString(4, type);
	        pstmt.setString(5, vendor);
	        pstmt.setString(6, addr1);
	        pstmt.setInt(7, amount);
	        
	        pstmt.executeUpdate();
	        request.setAttribute("ser_id", ser_id);
	        RequestDispatcher rd = request.getRequestDispatcher("ServiceRegistrationSuccess.jsp");
	    	rd.forward(request,response);
			con.close();
		} catch (SQLException e1) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
	    	rd.forward(request,response);
		}
	}

}
