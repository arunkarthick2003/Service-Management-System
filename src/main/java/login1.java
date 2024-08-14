

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static javax.swing.JOptionPane.showMessageDialog;

/**
 * Servlet implementation class login1
 */
@WebServlet("/home")
public class login1 extends HttpServlet {
	static Connection con;

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
			String name = request.getParameter("name").trim();
			int id = Integer.parseInt(name);
			String password=request.getParameter("pwd");
			String encrypt = generateMD5Digest(password); 
			String encrypt_pwd = ceaserCipher(encrypt);
			String validateQuery="select * from ServiceCustomer where customer_id = ? and password = ?";
			PreparedStatement pstmt = con.prepareStatement(validateQuery);
	//	    pstmt.setInt(1, id);
		    pstmt.setInt(1, id);
	//	        pstmt.setString(3, email);
	//	        pstmt.setLong(4, mobile);
		    pstmt.setString(2, encrypt_pwd);
	//	        pstmt.setString(6, add);
	//	        pstmt.executeUpdate();
		        
		    ResultSet rs = pstmt.executeQuery();
		    if(rs.next()) {
	//	    pw.print("Successfully registered Complaint");
		    	String c = String.valueOf(id);
		    	String encrypt1 = generateMD5Digest(c); 
				String encrypt_cookie = ceaserCipher(encrypt1);
		    	Cookie cookie = new Cookie("user",encrypt_cookie);
		    	cookie.setMaxAge(30*60);
		    	response.addCookie(cookie);
	//	    RequestDispatcher rd = request.getRequestDispatcher("Services.jsp");
	//		rd.forward(request,response);
	//	    System.out.println("ok");
		        response.sendRedirect("Services.jsp");
			    con.close();
		       }
		        else {
		        	int st =1;
					HttpSession session = request.getSession();
					session.setAttribute("st", st);
//					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//			    	rd.forward(request,response);
					response.sendRedirect("index.jsp");
		        	con.close();
		        }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			pw.println(e1);
//			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
//	    	rd.forward(request,response);
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
