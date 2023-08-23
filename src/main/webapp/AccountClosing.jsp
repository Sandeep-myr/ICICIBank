<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Account Closing Form</title>
  <link rel="stylesheet" href="AccountClosing.css">
  <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
<%  String accountnumber =(String) request.getSession().getAttribute("accountnumber"); 
System.out.println(accountnumber);
%>
   
  <div class="container">
    <h1>Account Closing Form</h1>
    <form id="accountClosingForm" action="Confirmation.jsp" method="post">
      <div class="form-section">
      <label for="fullName">Full Name</label>
      <input type="text" id="fullName" name="fullName" required value="<%= request.getSession().getAttribute("accountHolderName") %>" readonly="readonly">
      
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" required value="<%= request.getSession().getAttribute("emailid") %>" readonly="readonly">
      
      <label for="username">Username</label>
      <input type="text" id="username" name="username" value="<%= request.getSession().getAttribute("username") %>" readonly="readonly">
      </div>
      
      <div class="form-section">
      
      <label for="accountNumber">Account Number or ID</label>
      <input type="text" id="accountNumber" name="accountNumber" value="<%= request.getSession().getAttribute("accountnumber") %>" readonly="readonly">
      
      <label for="phoneNumber">Phone Number</label>
      <input type="text" id="phoneNumber" name="phoneNumber" required value="<%= request.getSession().getAttribute("mobilenumber") %>" readonly="readonly">
      
      <label for="reason">Reason for Account Closure</label>
      <select id="reason" name="reason" required>
        <option value="" disabled selected>Select a reason</option>
        <option value="notSatisfied">Not satisfied with the service</option>
        <option value="moving">Moving to a different provider</option>
        <option value="privacy">Privacy concerns</option>
        <option value="security">Account security concerns</option>
        <option value="noNeed">No longer need the account</option>
        <option value="other">Other</option>
      </select>
      </div>
      <div id="otherReasonContainer" style="display: none;">
      <label for="otherReason">Other Reason</label>
      <textarea id="otherReason" name="otherReason"></textarea>
    </div>
    <label>
    <input type="checkbox" id="confirmation" name="confirmation" required>
    I understand that closing the account is irreversible.
  </label>
  
  <label for="feedback">Feedback</label>
  <textarea id="feedback" name="feedback"></textarea>
      <div class="btn-container">
        <button type="submit">Submit</button>
      </div>
    </form>
  </div>
  <script src="AccountClosing.js"></script>
</body>
</html>
