<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="bank.BankLogin" %>
<!DOCTYPE html>
<html>
<head>
    <title>ICICI Bank User Details</title>
    <link rel="stylesheet" type="text/css" href="Profile.css">
    <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
<% Connection conn= null;
   ResultSet rs=null;
   String base64Image;
   try{
	  
	    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hdfc","maihar");
	    String accountnumber = request.getParameter("accountNumber");
	    
	     PreparedStatement pstmt = conn.prepareStatement("select * from customerlogindetails where accountnumber=?");
	     
	     pstmt.setString(1,accountnumber);
	      rs = pstmt.executeQuery();
	      rs.next();
	      String username= rs.getString("username");
	     pstmt.close();
	     rs.close();
	      pstmt = conn.prepareStatement("select * from customerdetails where accountnumber=?");
	      pstmt.setString(1, accountnumber);
	      rs = pstmt.executeQuery();
	      rs.next();
	      String fullname = rs.getString("fullname");
	      Blob imageBlob = rs.getBlob("profilepic");

			// Convert BLOB data to bytes
			byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());

			// Encode image bytes to Base64
			 base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
			String fathername = rs.getString("fathername");
			String dob = rs.getString("dob");
			pstmt.close();
			rs.close();
			pstmt = conn.prepareStatement("select * from customercontactdetails where accountnumber=?");
			pstmt.setString(1,accountnumber);
			rs= pstmt.executeQuery();
			rs.next();
	Long mobilenumber = rs.getLong("mobilenumber");
	String email = rs.getString("emailid");
	pstmt.close();
	rs.close();
   %>
    <div class="container">
        <div class="header">
            <h1 class="heading">ICICI Bank User Details</h1>
        </div>
        
        <div class="icons">
            <a href="#" id="downloadIcon" class="icon-link"><img src="download.png" alt="Download"></a>
            <a href="#" id="printIcon" class="icon-link"><img src="print.png" alt="Print"></a>
        </div>
        <div class="receipt">
            <h2 class="receipt-heading">User Profile Details</h2>
            <img src="data:image/jpeg;base64,<%=base64Image%>"
			alt="Profile Picture"  id="aks">
            <p><strong>Account Number:</strong> <%= accountnumber %></p>
            <p><strong>Account Holder Name:</strong> <%= fullname %></p>
            <p><strong>Father's Name:</strong> <%= fathername %></p>
            <p><strong>Date of Birth:</strong> <%= dob %></p>
            <p><strong>Username:</strong> <%= username %></p>
            <p><strong>Mobile Number:</strong><%= mobilenumber %></p>
            <p><strong>Email ID:</strong> <%=email %></p>
        </div>
        <% 
		}catch(Exception e)
		{
		 e.printStackTrace(); 
		 
		 }  %>
   
        <div class="footer">
            <p>Contact Us:</p>
            <p class="contact-info">Mobile: 7000517223</p>
            <p class="contact-info">Email: Sansahu921@gmail.com</p>
        </div>
    </div>

    <script src="Profile.js"></script>
</body>
</html>
