import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 * Servlet implementation class AcRepair
 */
@WebServlet("/AdminMainSearch")
public class AdminMainSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainSearch() {
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
		String jdbcUrl = "jdbc:sqlite:C:\\Users\\Yourpath\\MySQLiteDB";
		String user = "team5";
		String pwd = "team5";
		Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String uname = "";
	    int count = 0;
	    int cid=0;
	    try{
	    	int id = Integer.parseInt(request.getParameter("id"));
        	Class.forName("org.sqlite.JDBC");
        	con = DriverManager.getConnection(jdbcUrl,user,pwd);
        	stmt = con.createStatement();
        	String sql = "Select * from ServiceCustomer where customer_id= " + id;
//        	System.out.println(id);
        	rs = stmt.executeQuery(sql);
        	if(rs.next()){
        		uname = rs.getString("customer_name");
        		cid = rs.getInt("customer_id");
        		request.setAttribute("uname", uname);
        		String enc=generateMD5Digest(String.valueOf(request.getParameter("id")));
        		String encrypt=ceaserCipher(enc);
        		//System.out.println(encrypt);
        		Cookie cookie = new Cookie("enc",encrypt);
                cookie.setMaxAge(30*60);
                response.addCookie(cookie);
        		
                count++;
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
		//PrintWriter out = response.getWriter();
		//out.println(type);
//		System.out.println(email);
//		PrintWriter out = response.getWriter();
//		response.setContentType("text/html");
//		out.println("<html><head></head><body><h1>Success Page</h1></body></html>");
		RequestDispatcher d = request.getRequestDispatcher("search.jsp");
		RequestDispatcher e = request.getRequestDispatcher("SearchFail.jsp");
		if(count==0) {
			e.forward(request,response);
		}
		else {
			d.forward(request,response);
		}
		
	}
private static int SHIFT=3;
	
	private String generateMD5Digest(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digest = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static String ceaserCipher(String text) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < text.length(); i++) {
            char ch = text.charAt(i);
            // Encrypt uppercase characters
            if (Character.isUpperCase(ch)) {
                char c = (char) (((ch + SHIFT - 65) % 26) + 65);
                result.append(c);
            }
            // Encrypt lowercase characters
            else if (Character.isLowerCase(ch)) {
                char c = (char) (((ch + SHIFT - 97) % 26) + 97);
                result.append(c);
            }
            // Encrypt digits
            else if (Character.isDigit(ch)) {
                char c = (char) (((ch - '0' + SHIFT) % 10) + '0');
                result.append(c);
            } else {
                // Non-alphabetic and non-digit characters are appended as is
                result.append(ch);
            }
        }
        return result.toString();
    }


}
