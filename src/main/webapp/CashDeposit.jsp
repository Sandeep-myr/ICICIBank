<!DOCTYPE html>
<html>
<head>
  <title>Cash Deposit Form</title>
  <link rel="stylesheet" href="CashDeposit.css">
  <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
  <header>
    <h1>Cash Deposit Form</h1>
  </header>
  <div class="Common">
    <div class="container">
      <h2>Deposit Details</h2>

       

      <form id="deposit-form" action="CustomerDeposit" method="post">
        <div class="deposit">
          <br>
          <label for="account-text">To which Account (12-digit Account Number):</label><br>
          <input type="text" id="account-number" name="account-number" maxlength="12" required
                 value="<%= request.getSession().getAttribute("accountNumber") %>" readonly="readonly"><br>
          <br>
          <label for="account-holder">Name of The Account Holder:</label><br>
          <input type="text" id="account-holder" name="account-holder" required
                 value="<%= request.getSession().getAttribute("accountHolderName") %>" readonly="readonly"><br>
          <br>
          <label for="depositer-mobile">Depositer Mobile Number:</label><br>
      <input type="tel" id="depositer-mobile" name="depositer-mobile"  required  value="<%= request.getSession().getAttribute("mobilenumber") %>" readonly="readonly"><br>
      <br>
      <label for="denomination">Denomination (in Rupees):</label><br>
      <input type="number" id="denomination" name="denomination" required><br><br>
      <input type="submit" value="Proceed" id="button">
    </div>
       <div class="column-layout">
        <div class="money-description">Money Description</div>
        <div class="user-entry">
          <table >
            <tr>
                <th id="th-500">500 &#8377</th>
                <th><input type="Text" min="0" ></th>
            </tr>
            <tr>
              <th id="th-200">200 &#8377</th>
              <th><input type="text" min="0"></th>
            </tr>
            <tr>
              <th id="th-100">100 &#8377</th>
              <th><input type="text"  min="0"></th>
            </tr>
            <tr>
              <th id="th-50">50 &#8377</th>
              <th><input type="text"  min="0"></th>
            </tr>
            <tr>
              <th id="th-20">20 &#8377</th>
              <th><input type="text"  min="0"></th>
            </tr>
            <tr>
              <th id="th-10">10 &#8377</th>
              <th><input type="text"  min="0"></th>
            </tr>
            <tr>
              <th id="th-5">5 &#8377</th>
              <th><input type="text"  min="0"></th>
            </tr>
            <tr>
              <th id="th-2">2 &#8377</th>
              <th><input type="text" min="0"></th>
            </tr>
            <tr>
              <th id="th-1">1 &#8377</th>
              <th><input type="Text"  min="0"></th>
            </tr>
            <tr>
              <th>Total</th>
              <th><input type="Text"  min="0"  name="total"></th>
            </tr>
        </table>
        

        </div>
      </div>

      
    </form>
  </div>
</div>
  <footer>
    <p>Contact us:</p>
    <p>&#x2709; Email: Sansahu921@gmail.com</p>
    <p>&#128222; Phone: 7000517223</p>
  </footer>
  <script src="CashDeposit.js"></script>
</body>
</html>
