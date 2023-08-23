<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="bank.BankLogin"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="UserDashboard.css">
<link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
<title>ICICI Bank User Dashboard</title>
</head>
<body>
<style>
		* {
    box-sizing: border-box;
}
.image-slideshow {
	padding: 0% ;
  max-width: 1000px;
  position: relative;
  margin: 20px;
  top:auto;
}
 .image-slideshow img {
  width: 1300px;
  height: 300px;
}
.fade {
  animation-name: fade;
  animation-duration: 2s;
}
@keyframes fade {
  from {opacity: .5}
  to {opacity: 1}
}
	</style>
   <%! public static String accountnumber;%>
	<% Connection conn= null;
   ResultSet rs=null;
   String base64Image;
   try{
	   String username=request.getParameter("username");
	    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hdfc","maihar");
	     PreparedStatement pstmt = conn.prepareStatement("select * from customerlogindetails where username=?");
	     
	     pstmt.setString(1,username);
	      rs = pstmt.executeQuery();
	      rs.next();
	       accountnumber= rs.getString("accountnumber");
	      session.setAttribute("accountnumber", accountnumber);
	     session.setAttribute("username",username);
	      pstmt = conn.prepareStatement("select * from customerdetails where accountnumber=?");
	      pstmt.setString(1, accountnumber);
	      rs = pstmt.executeQuery();
	      rs.next();
	      String fullname = rs.getString("fullname");
	      Blob imageBlob = rs.getBlob("profilepic");
	      session.setAttribute("accountHolderName",fullname);
			// Convert BLOB data to bytes
			byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());

			// Encode image bytes to Base64
			 base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
			
			pstmt = conn.prepareStatement("select * from "+ accountnumber + " order by tradate desc");
			rs= pstmt.executeQuery();
			rs.next();
			int balance  = Integer.parseInt(rs.getString("netbalance")); 
			 session.setAttribute("accountnumber", accountnumber);
			   pstmt.close();
			   rs.close();
			   
			   pstmt = conn.prepareStatement("select * from customercontactdetails where accountnumber=?");
			      pstmt.setString(1, accountnumber);
			      rs = pstmt.executeQuery();
			      rs.next();
	Long mobilenumber = rs.getLong("mobilenumber");	
	String emailid =  rs.getString("emailid");
    session.setAttribute("mobilenumber",mobilenumber);
    session.setAttribute("emailid",emailid);
    pstmt.close();
    rs.close();
    
   %>

	<header >
		<h1>ICICI Bank User Dashboard</h1>
		<img src="data:image/jpeg;base64,<%=base64Image%>"
			alt="Profile Picture" >
	</header>

	<div class="user-details">
		<div class="balance-box">

			<h3>
				Welcome To <span id="username"><%= fullname %></span>
			</h3>
			<h3>
				Your Account Balance is <span id="balance"><%= balance%></span>
			</h3>
			<h3>
				Account number: <span id="account-number"><%=accountnumber %></span>
			</h3>
		</div>
		
		
		 <a href="ProfileData.jsp?accountNumber=<%= accountnumber %>" id="logout-btn">User Profile</a>&nbsp&nbsp&nbsp
		 <a href="BankHome.html"
			id="logout-btn">Log Out</a>
	</div>
	
	<div class="operation-flex">
		<div class="operations">
			<a href="MoneyTransfer.html"> <img
				src="https://onlinedigitalsevakendra.in/Content/HomePage/images/moneyTransfer%20Home.png"
				alt="MoneyTransfer"> <br> Money Transfer
			</a>
		</div>
		<%  session.setAttribute("accountNumber", accountnumber);
		session.setAttribute("accountHolderName", fullname);
 %>
		<div class="operations">
			<a href="CashDeposit.jsp"> <img
				src="https://dcbpithoragarh.co.in/wp-content/uploads/2020/05/deposit-1.jpg"
				alt="Deposit"> <br> Deposit
			</a>
		</div>
		<div class="operations">
			<a href="Withdrwal.jsp"> <img
				src="https://cdn-icons-png.flaticon.com/512/5024/5024335.png"
				alt="Withdrawal"> <br> Withdrwal
			</a>
		</div>
		<div class="operations">
			<a href="ProfileUpdate.jsp"> <img
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHZZ3A4y0KNpIrpoy1NNjsYUV1hfr9NZXHM-8Ykace_R92WyMKAgGNHCOu6O4nutfSR28&usqp=CAU"
				alt="Profile update"> <br> Profile Update
			</a>
		</div>
		<div class="operations">
			<a href="AccountClosing.jsp"> <img
				src="https://cdn5.vectorstock.com/i/1000x1000/61/04/closed-bank-icon-simple-style-vector-30736104.jpg">
				<br> Account Close
			</a>
		</div>
		<div class="operations">
		
			<a href="Statement.jsp"  > <img
				src="https://icon-library.com/images/statement-icon/statement-icon-8.jpg">
				<br> Statement
			</a>
		</div>
	</div>
	<% 
	
		}catch(Exception e)
		{
		 e.printStackTrace(); 
		 
		 }  %>
		 
		 <div class="image-slideshow">
      <div class="image fade">
        <img src="https://www.icicibank.com/content/dam/icicibank/india/managed-assets/images/offer-zone/ease-my-trip-offer.webp" >
      </div>        
      <div class="image fade">
        <img src="https://www.icicibank.com/content/dam/icicibank/optimized-webp-images/india/managed-assets/insta-banking/images/infinite.webp" >
      </div>        
      <div class="image fade">
        <img src="https://www.icicibank.com/content/dam/icicibank/india/managed-assets/images/offer-zone/credit-debit-card/tcl-banner.webp">
      </div>
      <div class="image fade">
        <img src="https://d2xamzlzrdbdbn.cloudfront.net/BlogImages/072a2ddf-d4de-4364-8786-79b886de292f.jpg" >
      </div>
	<footer>
		<p>Contact us:</p>
		<p>&#x2709; Gmail: Sansahu921@gmail.com</p>
		<p>&#128222;Phone : 7000517223</p>
	</footer>
	
	<script src="UserDashboard.js"></script>
	
	
</body>
</html>
