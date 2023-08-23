<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Account Closure Result</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
    }
    .message {
      margin-top: 100px;
      font-size: 24px;
      color: #27ae60;
    }
    .link {
      margin-top: 20px;
      font-size: 18px;
      color: #3498db;
      text-decoration: none;
    }
  </style>
</head>
<body>
<%
    String password = request.getParameter("password");
  String accountNumber = (String) session.getAttribute("accountnumber");
  System.out.println(password);
  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hdfc","maihar");
  PreparedStatement pstmt;
  try {
	  
   pstmt = conn.prepareCall("select * from customerlogindetails where accountnumber=?");
   pstmt.setString(1,accountNumber);
   
   ResultSet rs = pstmt.executeQuery();
   rs.next();
   String dataPassword = rs.getString("password");
   System.out.println(dataPassword);
   if(dataPassword.equals(password)){
	   pstmt = conn.prepareCall("delete from customerdetails where accountnumber=?");
	   pstmt.setString(1,accountNumber);
	   pstmt.executeUpdate();
	   pstmt.close();
	   pstmt = conn.prepareCall("delete from customerlogindetails where accountnumber=?");
	   pstmt.setString(1,accountNumber);
	   pstmt.executeUpdate();
	   pstmt.close(); 
	   pstmt = conn.prepareCall("delete from customercontactdetails where accountnumber=?");
	   pstmt.setString(1,accountNumber);
	   pstmt.executeUpdate();
	   pstmt.close(); 
	   
	   Statement stmt = conn.createStatement();
	   stmt.execute("drop table "+ accountNumber +" purge");
	   stmt.close();
   }
   else{
	   
	   String message="Your Password Will Be wrong";
	   request.getSession().setAttribute("message", message);

       
       request.getRequestDispatcher("Popup.jsp").include(request, response);
       request.getRequestDispatcher("/BankHome.html").include(request, response);
	   
   }
   
    
    
   
%>
    <div class="message">Your Account Has Been Closed</div>
    <a href="BankHome.html" class="link">Go To Bank Home Page</a>
<%
  } catch (Exception e) {
    e.printStackTrace();
%>
    <div class="message">An error occurred. Please try again later.</div>
<%
  }
%>
  <script>
    // Disable browser back functionality after closing the account
    history.pushState(null, null, location.href);
    window.onpopstate = function(event) {
      history.go(1);
    };
  </script>
</body>
</html>
