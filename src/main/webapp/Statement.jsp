<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Statement Request</title>
  <link rel="stylesheet" href="Statement.css">
  <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
  <header>
    <h1>ICICI Bank Statment Panel</h1>
  </header>
  <% String accountnumber= (String)session.getAttribute("accountnumber");
           
  %>

  <div class="container">
    <h2>Statement Request Form</h2>
    <form id="statement-form" action="BankStatement.jsp" method="post">
      <label for="from-date">From Date:</label>
      <input type="date" id="from-date" name="from-date" required><br>

      <label for="to-date">To Date:</label>
      <input type="date" id="to-date" name="to-date" required><br>
      
    
<input type="hidden" name="accountnumber" value="<%= accountnumber %>">
      <button type="submit">Generate Statement</button>
    </form>
  </div>
 
    

  <footer>
    <p>Contact us:</p>
    <p>&#x2709; Gmail: Sansahu921@gmail.com</p>
    <p> &#128222;Phone : 7000517223</p>
  </footer>

  <script src="script.js"></script>
</body>
</html>
