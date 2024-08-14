

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class admin_Login_Page
 */
@WebServlet("/admin_Login_Page")
public class admin_Login_Page extends HttpServlet {
	static Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_Login_Page() {
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
			String name = request.getParameter("adm_name");
			String password=request.getParameter("pwd");
			String validateQuery="select * from admin where username = ? and password = ?";
			PreparedStatement pstmt = con.prepareStatement(validateQuery);
	        pstmt.setString(1, name);
	        pstmt.setString(2, password);
	        
	        ResultSet rs = pstmt.executeQuery();
	        con.close();
	        if(rs.next()) {
	        	String enc=generateMD5Digest(name);
	        	String encrypt=ceaserCipher(enc);
		    	Cookie cookie = new Cookie("role-type",encrypt);
		    	cookie.setMaxAge(30*60);
		    	response.addCookie(cookie);
	        	response.sendRedirect("AdminHome.jsp");
	        }
	        else {
	        		 JOptionPane.showMessageDialog(null, "Invalid username or password!!");
	        		 response.sendRedirect("admin_Login_Page.jsp");
	        		 con.close();
	        }
		}
		catch(Exception e1) {
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
