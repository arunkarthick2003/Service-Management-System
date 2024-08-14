import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Random;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class servers
 */
@WebServlet("/Success")
public class servers extends HttpServlet {
	static Connection con;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.setContentType("text/html");//setting the content type  
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
				Random r=new Random();
				String name = request.getParameter("name");
				String email = request.getParameter("email").trim();
				String password=request.getParameter("pwd").trim();
				String conf_password=request.getParameter("cnf_pwd").trim();
				String add=request.getParameter("addr");
				long mobile=Long.parseLong(request.getParameter("num").trim());
				if(password.equals(conf_password)) {
					String encrypt = generateMD5Digest(password); 
					String encrypt_pwd = ceaserCipher(encrypt);
					int id=1000000+r.nextInt(8999999);
					String cid_e=generateMD5Digest(String.valueOf(id));
					String cid_encrypt=ceaserCipher(cid_e);
					
					String insertQuery="insert into ServiceCustomer(customer_id,customer_name,email,contact_num,password,address,cid_encrypted)"
								+" values (?,?,?,?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(insertQuery);
			        pstmt.setInt(1, id);
			        pstmt.setString(2, name);
			        pstmt.setString(3, email);
			        pstmt.setLong(4, mobile);
			        pstmt.setString(5, encrypt_pwd);
			        pstmt.setString(6, add);
			        pstmt.setString(7, cid_encrypt);
			        pstmt.executeUpdate();
			        request.setAttribute("id", id);
			        request.setAttribute("name1", name);
			        request.setAttribute("mail",email);
	//		        out.println()
			        //request.setAttribute(Integer.parseInt(id), "id");
	//		        pw.print("Successfully registered Complaint");
			        RequestDispatcher rd = request.getRequestDispatcher("RegisterSuccess.jsp");
			    	rd.forward(request,response);
					con.close();
				}
				else {
//					pw.println("Password and confirm password not same");
					int st =1;
					HttpSession session = request.getSession();
					session.setAttribute("st", st);
//					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//			    	rd.forward(request,response);
					response.sendRedirect("register.jsp");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
//				pw.println(e1);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
		    	rd.forward(request,response);
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

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doHead(HttpServletRequest, HttpServletResponse)
	 */
	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doOptions(HttpServletRequest, HttpServletResponse)
	 */
	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}