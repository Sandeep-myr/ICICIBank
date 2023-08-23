package bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BankLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String username;
	static String accountnumber;
	PreparedStatement pstmt;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("oracle");
		username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			pstmt = conn.prepareStatement("select * from customerlogindetails where username=? and password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
                accountnumber= rs.getString("accountnumber");
                
               request.getSession().setAttribute("a/c", accountnumber);
                request.setAttribute("accountnumber", accountnumber);
				RequestDispatcher rd = request.getRequestDispatcher("/UserDashboard.jsp");
				rd.forward(request, response);
			} else {
				String message=" x Invalid Username/password";
				   request.getSession().setAttribute("message", message);

			       
			       request.getRequestDispatcher("Popup.jsp").include(request, response);
			       request.getRequestDispatcher("/BankHome.html").include(request, response);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
