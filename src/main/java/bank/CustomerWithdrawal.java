package bank;

import java.io.IOException;
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


public class CustomerWithdrawal extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pstmt;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext sc = request.getServletContext();
		Connection conn = (Connection) sc.getAttribute("oracle");
		String account_number = request.getParameter("from-account"); 
		float withdraw = Float.parseFloat(request.getParameter("amount"));
		
	    try {
		pstmt = conn.prepareStatement("select * from "+BankLogin.accountnumber +" order by tradate desc");
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		float previousBalance = rs.getFloat("netbalance");
		if(withdraw<=previousBalance) {
		float  updatedBalance = previousBalance-withdraw;
		pstmt = conn.prepareStatement("insert into "+account_number+" (withdraw , netbalance) values(?,?)");
		pstmt.setFloat(1, withdraw);
		pstmt.setFloat(2, updatedBalance);
		pstmt.execute();
		RequestDispatcher rd = request.getRequestDispatcher("/CustomerWithdrawReciept.jsp");
				rd.forward(request, response);
		}
		else {
			String message = "Insufficient Balance ";
			 request.getSession().setAttribute("message", message);
			request.getRequestDispatcher("Popup.jsp").include(request, response);
			request.getRequestDispatcher("UserDashboard.jsp").include(request, response);
			
			
		}
	    } catch (SQLException e) {
			
			e.printStackTrace();
		}
	
	}

}
