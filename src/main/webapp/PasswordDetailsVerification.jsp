<%@page import="oracle.net.aso.d"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" import="java.text.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%  PreparedStatement pstmt;
    ResultSet rs;
    String message="";
    try{
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hdfc","maihar");
     String username = request.getParameter("username");
     Long number = Long.parseLong(request.getParameter("mobilenumber"));
     
     SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = inputDateFormat.parse(request.getParameter("dob"));
		Date dob = new Date(utilDate.getTime());
		
	pstmt = conn.prepareCall("select * from customerlogindetails where username=?");
	pstmt.setString(1,username);
    rs= pstmt.executeQuery();
    if(rs.next()){
    	String accountnumber = rs.getString("accountnumber");
    	rs.close();
    	pstmt.close();
    	session.setAttribute("accountnumber",accountnumber);
    	pstmt = conn.prepareCall("select * from customercontactdetails where accountnumber=?");
    	pstmt.setString(1,accountnumber);
        rs= pstmt.executeQuery();
        rs.next();
        Long mobilenumber = rs.getLong("mobilenumber");
       
        rs.close();
    	pstmt.close();
    	
    	pstmt = conn.prepareCall("select * from customerdetails where accountnumber=?");
    	pstmt.setString(1,accountnumber);
        rs= pstmt.executeQuery();
        rs.next();
        Date date = rs.getDate("dob");
        rs.close();
    	pstmt.close();
    	
    	if(date.equals(dob) && number.equals(mobilenumber) ){
    		 request.getRequestDispatcher("/SetNewPassword.jsp").include(request, response);
    		
    	}else
    	{
    		message=" ! Inavlid Credentials";
        	
        	request.getSession().setAttribute("message", message);

            
            request.getRequestDispatcher("Popup.jsp").include(request, response);
            request.getRequestDispatcher("/ForgetPassword.html").include(request, response);
    	}
    	
    }
    else{
    	message=" ! Inavlid Credentials";
    	
    	request.getSession().setAttribute("message", message);

        
        request.getRequestDispatcher("Popup.jsp").include(request, response);
        request.getRequestDispatcher("/ForgetPassword.html").include(request, response);
    }
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    %>
</body>
</html>