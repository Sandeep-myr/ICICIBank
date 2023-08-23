<!DOCTYPE html>
<html>
<head>
  <title>Cash Withdrawal Form</title>
  <link rel="stylesheet" href="Withdrwal.css">
  <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
  
  <header>
    <h1>Cash Withdrawal Form</h1>
  </header>
  
  <div class="container">
    <h2>Withdrawal Details</h2>
    <form id="withdrawal-form" action="CustomerWithdrawal" method="post">
      
      <div class="row">
        <div class="side">
          <div class="field">
            <label for="from-account">From which Account:</label><br>
            <input type="text" id="from-account" name="from-account" maxlength="12" required  value="<%= request.getSession().getAttribute("accountnumber") %>" readonly="readonly">
          </div>
          <div class="field">
            <label for="account-holder">Account Holder:</label><br>
            <input type="text" id="account-holder" name="account-holder" required value="<%= request.getSession().getAttribute("accountHolderName") %>" readonly="readonly">
          </div>
          
            <div class="field" class="user">
              <label for="payee-name">Payee Name:</label><br>
              <input type="text" id="payee-name" name="payee-name" required>
            </div>
            <div class="field">
            <label for="">Cheque Number</label><br>
            <input type="text" id="transaction-date" name="transaction-reference" required>
          </div>
            <div class="field">
              <label for="mobile-number">Mobile Number:</label><br>
              <input type="tel" id="mobile-number" name="mobile-number" maxlength=10 required value="<%= request.getSession().getAttribute("mobilenumber") %>" readonly="readonly">
            </div>
        </div>
      
         <div class="slide2">
          <div class="field">
            <label for="transaction-type">Transaction Type:</label><br>
            <select id="transaction-type" name="transaction-type">
              <option value=default>Transaction Type</option>
              <option value="self">Self</option>
              <option value="pay-to">Pay To</option>
            </select><br><br>
          <div class="field">
            <label for="transaction-date">Reference:</label><br>
            <input type="text" id="transaction-date" name="transaction-reference" required>
          </div> 
           
          
          <div class="field">
            <label for="amount">Amount:</label><br>
            <input type="number" id="amount" name="amount" required>
          </div>
          <div class="field">
            <input type="submit" value="Submit" id="submit-button">
          </div>
          
        </div>
      </div>
        
      </div>
      
    </form>
  
</div>
  <footer>
    <p>Contact us:</p>
    <p>&#x2709; Email:Sansahu921@gmail.com</p>
    <p>&#128222; Phone: 7000517223</p>
  </footer>

</body>
</html>
