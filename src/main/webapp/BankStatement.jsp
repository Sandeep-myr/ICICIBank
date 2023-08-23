
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.*"
	import="bank.BankLogin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Statement</title>
<link rel="stylesheet" href="BankStatement.css">
<link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
	<%
	Connection conn = null;
	ResultSet rs = null;

	try {
		String accountnumber = request.getParameter("accountnumber");
				
       
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		java.util.Date utilFromDate = inputDateFormat.parse(request.getParameter("from-date"));
		Date fromdate = new Date(utilFromDate.getTime());

		
		java.util.Date utilToDate = inputDateFormat.parse(request.getParameter("to-date"));
		Date todate = new Date(utilToDate.getTime());

		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hdfc", "maihar");

		PreparedStatement pstmt = conn.prepareStatement("select * from customerlogindetails where accountnumber=?");

		pstmt.setString(1, accountnumber);
		rs = pstmt.executeQuery();
		rs.next();
		String username = rs.getString("username");
		pstmt.close();
		rs.close();
		pstmt = conn.prepareStatement("select * from customerdetails where accountnumber=?");
		pstmt.setString(1, accountnumber);
		rs = pstmt.executeQuery();
		rs.next();
		String fullname = rs.getString("fullname");

		String fathername = rs.getString("fathername");

		pstmt.close();
		rs.close();
		pstmt = conn.prepareStatement("select * from customercontactdetails where accountnumber=?");
		pstmt.setString(1, accountnumber);
		rs = pstmt.executeQuery();
		rs.next();
		Long mobilenumber = rs.getLong("mobilenumber");
		String email = rs.getString("emailid");
		pstmt.close();
		rs.close();
	%>
	<h1 id="heading">ICICI BANK STATEMENT REQUEST</h1>
	<div class="container">
		<div class="user-details">
			<p>
				Account Number:
				<%=accountnumber%></p>
			<p>
				Name:
				<%=fullname%></p>
			<p>
				Father's Name:
				<%=fathername%></p>
		</div>
		<div class="flex-details">
			<p>
				Date:
				<%=new java.util.Date()%></p>
			<p>
				Mobile:
				<%=mobilenumber%></p>
			<p>
				Email:
				<%=email%></p>
		</div>
	</div>
	<div class="heading-and-button">
		<h2>Account Statement</h2>
		<button id="print-button">Print Statement</button>
	</div>
	<hr>
	<table>
		<tr>
			<th>Txn Date</th>
			<th>Deposit</th>
			<th>Withdraw</th>
			<th>Net Balance</th>
		</tr>
		<%
		pstmt = conn.prepareStatement("select * from " + accountnumber + " where tradate>=? and tradate<=TO_DATE(?, 'DD-MON-YY') + INTERVAL '1' DAY order by tradate asc ");
		pstmt.setDate(1, fromdate);
		pstmt.setDate(2, todate);
		// pstmt.setString(1,accountnumber);
		rs = pstmt.executeQuery();
		ResultSetMetaData rm = rs.getMetaData();
		int col = rm.getColumnCount();
		while (rs.next()) { %>  
			<tr>
			<%
			for (int i = 1; i <= col; i++) {
		%>
		
			<td>
    <%
        String cellValue = rs.getString(i);
        if (cellValue.equals("0")) {
            out.print("&nbsp;"); // Use HTML non-breaking space entity
        } else {
            out.print(cellValue);
        }
    %>
</td>
			
			
		
		<%
		} %>
		</tr>
		<%}
		%>
		<!-- Add more rows here -->
	</table>
	<%
	} catch (Exception e) {
	e.printStackTrace();

	}
	%>
	<footer class="footer">
		<p>Contact us:</p>
		<p>&#x2709; Gmail: Sansahu921@gmail.com</p>
		<p>&#128222; Phone : 7000517223</p>
	</footer>
	<script src="BankStatement.js"></script>
</body>
</html>
