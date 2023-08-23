 package bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerDeposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pstmt;
	ResultSet rs;
	static int netbalance;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("oracle");
        
        int depositMoney = (int) Float.parseFloat(request.getParameter("denomination"));
        System.out.println(depositMoney);
      		try { 

      			Statement stmt  = conn.createStatement();
      			stmt.executeQuery("select * from "+ BankLogin.accountnumber+" order by tradate desc");
      			rs = stmt.getResultSet();
      			
      			rs.next();
      			int balance = rs.getInt("netbalance");
      			netbalance = (depositMoney + balance);
      			pstmt = conn.prepareStatement("Insert into "+ BankLogin.accountnumber +"(deposit , netbalance ) values (?,?)");
      			pstmt.setInt(1, depositMoney);
      			pstmt.setInt(2, netbalance);
      			pstmt.executeUpdate();
		RequestDispatcher rd =request.getRequestDispatcher("/CustomerDepositReciept.jsp");
		rd.forward(request, response);
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
        
      
	}

  }
