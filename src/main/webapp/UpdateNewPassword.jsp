<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>
<% 
PreparedStatement pstmt;
    ResultSet rs;
    String message="";
    String accountnumber =(String) request.getSession().getAttribute("accountnumber");
    try{
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hdfc","maihar");
     String newPassword = request.getParameter("newPassword");
     pstmt = conn.prepareCall("update  customerlogindetails set password=? where accountnumber=?");
 	pstmt.setString(1,newPassword);
 	pstmt.setString(2,accountnumber);
 	pstmt.execute();
 	
 	message="Password Updated Succesfully";
 	request.getSession().setAttribute("message", message);

    
    request.getRequestDispatcher("Popup.jsp").include(request, response);
    request.getRequestDispatcher("/Login.html").include(request, response);
 	
    }catch(Exception e){
    	e.printStackTrace();
    }
     %>
</body>
</html>