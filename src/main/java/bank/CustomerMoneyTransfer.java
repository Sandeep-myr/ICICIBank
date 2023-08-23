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

public class CustomerMoneyTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pstmt;
	ResultSet rs;
	static String accountnumber;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = request.getServletContext();
		Connection conn = (Connection) sc.getAttribute("oracle");
		accountnumber = request.getParameter("accountNumber");
		if(!(accountnumber.equals(BankLogin.accountnumber))) {
		try {
		    pstmt = conn.prepareStatement("Select * from customerdetails where accountnumber=?");
		    pstmt.setString(1, accountnumber);
		    rs = pstmt.executeQuery();
		    if (rs.next()) {
		        pstmt.close();
		        rs.close();
             
		        pstmt = conn.prepareStatement("select * from " + BankLogin.accountnumber + " order by tradate desc");
		        rs = pstmt.executeQuery();
              
		        rs.next();
		       
		        double senderPreviousBalance = rs.getDouble("netbalance");

		        double withdrawalAmount = Double.parseDouble(request.getParameter("ammount"));
		        if(senderPreviousBalance>=withdrawalAmount) {
		        double updatedBalance = senderPreviousBalance - withdrawalAmount;
		        pstmt.close();
		        rs.close();

		        pstmt = conn.prepareStatement("insert into " + BankLogin.accountnumber + " (withdraw,netbalance) values(?,?)");
		        pstmt.setDouble(1, withdrawalAmount);
		        pstmt.setDouble(2, updatedBalance);
		        pstmt.executeUpdate();
		        pstmt.close();

		        pstmt = conn.prepareStatement("select * from " + accountnumber+" order by tradate desc");
		        rs = pstmt.executeQuery(); // This should be executeQuery() for SELECT queries
		        rs.next();
		        double receiverPreviousBalance = rs.getDouble("netbalance");
		        
		        updatedBalance = receiverPreviousBalance + withdrawalAmount;
		        pstmt.close();
		        
		        pstmt = conn.prepareStatement("insert into " + accountnumber + " (deposit,netbalance) values(?,?)");
		        pstmt.setDouble(1, withdrawalAmount);
		        pstmt.setDouble(2, updatedBalance);
		        pstmt.executeUpdate();

		        request.setAttribute("a/c", BankLogin.accountnumber);
		        RequestDispatcher rd = request.getRequestDispatcher("/CustomerMoneyTransferReciept.jsp");
		        rd.include(request, response);
		        }
		        
		    
		        else {
		        	PrintWriter pw = response.getWriter();
			        pw.println("<html><body text=red><h2>");
			        pw.println("Insufficient Balance ");
			        pw.println("</h2></body></html>");
			        RequestDispatcher rd = request.getRequestDispatcher("/MoneyTransfer.html");
			        rd.include(request, response);
		        }
		      }
		    else{
		        PrintWriter pw = response.getWriter();
		        pw.println("<html><body text=red><h2>");
		        pw.println("Account Number Does Not Exist ");
		        pw.println("</h2></body></html>");
		        RequestDispatcher rd = request.getRequestDispatcher("/MoneyTransfer.html");
		        rd.include(request, response);
		   }
		  } 
		 catch (SQLException e)
		{
		    e.printStackTrace();
		} 
		    
		} else {
        	PrintWriter pw = response.getWriter();
	        pw.println("<html><body text=red><h2>");
	 pw.println("Same Account You Can't Transfer Money ");
	        pw.println("</h2></body></html>");
	        RequestDispatcher rd = request.getRequestDispatcher("/MoneyTransfer.html");
	        rd.include(request, response);
        }    
		
		
}
}