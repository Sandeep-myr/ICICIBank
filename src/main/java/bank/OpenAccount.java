package bank;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig
public class OpenAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String accountnumber;
	PrintWriter pw;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		pw = response.getWriter();
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("oracle");

		// Retrieve form fields
		String fullname = request.getParameter("fullname");
		String fathername = request.getParameter("fathername");
		Long mobilenumber = Long.parseLong(request.getParameter("mobileNumber"));
		String emailid = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Retrieve image/photo

		Part image = request.getPart("photo");
		InputStream photo = image.getInputStream();

		accountnumber = "ICICI" + (int) (Math.random() * 1000000);

		try {
			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = inputDateFormat.parse(request.getParameter("dob"));
			Date dob = new Date(utilDate.getTime());
			CallableStatement cstmt = conn.prepareCall("{call accountopendetails(?,?,?,?,?,?,?,?,?)}");
			cstmt.setString(1, accountnumber);
			cstmt.setString(2, fullname);
			cstmt.setString(3, fathername);
			cstmt.setDate(4, dob);
			cstmt.setBlob(5, photo);
			cstmt.setLong(6, mobilenumber);
			cstmt.setString(7, emailid);
			cstmt.setString(8, username);
			cstmt.setString(9, password);
			cstmt.execute();
	PreparedStatement pstmt1 = conn.prepareStatement("create table "+ accountnumber+
					" (TraDate date default sysdate , deposit number(7,2)  default 0,withdraw number(7,2) default 0,netbalance number(7,2) default 0) ");
			
			pstmt1.execute();
			RequestDispatcher rd = request.getRequestDispatcher("/AccountOpenReciept.jsp");
			rd.forward(request, response);
		} catch (IOException e) {
			pw.println("<html><body bgcolor=black text=grey><h1>Photo Does Not In Proper Format</h1></body></html>");
			RequestDispatcher rd = request.getRequestDispatcher("/AccountOpen.html");
			rd.forward(request, response);

		} catch (ParseException e) {

			pw.println(
					"<html><body bgcolor=black text=grey><h1>Only Number is ALlow in Mobile Field</h1></body></html>");
			RequestDispatcher rd = request.getRequestDispatcher("/AccountOpen.html");
			rd.forward(request, response);
		} catch (SQLException e) {

			pw.println("<html><body bgcolor=black text=grey><h1>User is Already Register</h1></body></html>");
			RequestDispatcher rd = request.getRequestDispatcher("/AccountOpen.html");
			rd.forward(request, response);
		} catch (ServletException e) {

			pw.println("<html><body bgcolor=black text=grey><h1>Server issue</h1></body></html>");
			RequestDispatcher rd = request.getRequestDispatcher("/AccountOpen.html");
			rd.forward(request, response);

		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
