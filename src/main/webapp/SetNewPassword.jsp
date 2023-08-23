<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="ForgotPassword.css">
</head>
<body>
<% String accountnumber =(String)request.getSession().getAttribute("accountnumber") ;
session.setAttribute("accountnumber",accountnumber); %>
    <div class="popup-container">
        <div class="popup">
            <h2>Reset Password</h2>
            <form action="UpdateNewPassword.jsp" method="post" onsubmit="return validatePasswords();">
                <div class="input-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <span id="passwordError" style="color: red;"></span>
                </div>
                <button type="submit" class="btn">Reset Password</button>
            </form>
        </div>
    </div>
    
    <script>
        function validatePasswords() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var passwordError = document.getElementById("passwordError");
            
            if (newPassword !== confirmPassword) {
                passwordError.textContent = "Passwords do not match.";
                document.getElementById("confirmPassword").style.borderColor = "red";
                return false;
            } else {
                passwordError.textContent = "";
                document.getElementById("confirmPassword").style.borderColor = "#ccc";
                return true;
            }
        }
    </script>
</body>
</html>
