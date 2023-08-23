<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Password Entry and Confirmation</title>
  <link rel="stylesheet" href="ConfirmationPopup.css">
  <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
</head>
<body>
<% String accountnumber=(String) request.getSession().getAttribute("accountnumber");
    session.setAttribute("accountnumber", accountnumber);%>
  <div class="container">
    <h1>Account Closure</h1>
    <form id="passwordForm" action="Verification.jsp" method="post">
      <label for="password">Enter Your Password</label><br>
      <input type="password" id="password" name="password" required><br><br>
      <div class="btn-container">
        <button id="submitPassword" class="submit-button">Submit</button>
        <button id="cancelPassword" class="cancel-button">Cancel</button>
      </div>
    </form>
  </div>
  <div class="overlay" id="confirmationOverlay">
    <div class="confirmation-container">
      <h2>Account Closure Confirmation</h2>
      <p>Are you sure you want to close your bank account?</p>
      <div class="btn-container">
        <button id="confirmYes" class="yes-button">Yes</button>
        <button id="confirmNo" class="no-button">No</button>
      </div>
    </div>
  </div>
  <script>
    const passwordForm = document.getElementById('passwordForm');
    const confirmationOverlay = document.getElementById('confirmationOverlay');
    const confirmYesButton = document.getElementById('confirmYes');
    const confirmNoButton = document.getElementById('confirmNo');
    const cancelPasswordButton = document.getElementById('cancelPassword');

    passwordForm.addEventListener('submit', () => {
    	  // Do not prevent form submission
    	  confirmationOverlay.style.display = 'block';
    	});

    cancelPasswordButton.addEventListener('click', () => {
      window.history.go(-2); // Go back two steps in browser history
    });

    confirmYesButton.addEventListener('click', () => {
      // Redirect to the Confirmation.jsp page when user confirms
      window.location.href = 'Verification.jsp';
    });

    confirmNoButton.addEventListener('click', () => {
      confirmationOverlay.style.display = 'none';
    });
  </script>
</body>
</html>
