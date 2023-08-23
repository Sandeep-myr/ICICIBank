<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ProfileUpdate.css">
    <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
    <title>Profile Update</title>
</head>
<body>
    <header>
        <h1>Profile Updation Panel</h1>
    </header>
<% String accountnumber= (String)session.getAttribute("accountnumber");
           

      
  %>
    <main>
         <div class="profile-container">
              <div class="flex-item" id="password-flex">
                <button class="update-button">Update Password</button>
                <div class="popup" id="popup-password">
                    <form class="update-form" action="UserDetailsUpdate" method="post">
						 <input type="hidden" name="operation" value="password">
                        <h2>Update Password</h2>
                        <label for="new-password">New Password:</label>
                        <input type="password" id="new-password" name="new-password">
                        <button type="submit">Update</button>
                    </form>
                </div>
            </div>
            
            <div class="flex-item" id="profile-pic-flex">
                <button class="update-button">Update Profile Picture</button>
                <div class="popup" id="popup-profile-pic">
                    <form class="update-form" action="UserDetailsUpdate" method="post"  enctype="multipart/form-data">
						 <input type="hidden" name="operation" value="profilepic">
                        <h2>Update Profile Picture</h2>
                        <label for="new-profile-pic">New Profile Picture:</label>
                        <input type="file" id="new-profile-pic" name="new-profile-pic" accept="image/*">
                        <button type="submit">Update</button>
                    </form>
                </div>
            </div>
            
            <div class="flex-item" id="mobile-number-flex">
                <button class="update-button">Update Mobile Number</button>
                <div class="popup" id="popup-mobile-number">
                    <form class="update-form" action="UserDetailsUpdate" method="post">
						 <input type="hidden" name="operation" value="mobile">
                        <h2>Update Mobile Number</h2>
                        <label for="new-mobile-number">New Mobile Number:</label>
                        <input type="Number" id="new-mobile-number" name="new-mobile-number" maxlength=10>
                        <input type="submit" value="Update" >
                    </form>
                </div>
            </div>
            
            <div class="flex-item" id="email-id-flex">
                <button class="update-button">Update Email ID</button>
                <div class="popup" id="popup-email-id">
                    <form class="update-form" action="UserDetailsUpdate" method="post">
						 <input type="hidden" name="operation" value="email">
                        <h2>Update Email ID</h2>
                        <label for="new-email-id">New Email ID:</label>
                        <input type="email" id="new-email-id" name="new-email-id">
                        <input type="submit" value="Update">
                    </form>
                </div>
            </div>  
        </div>
       
    </main>

    <footer>
        <p>Contact :us </p><br><p> Email: sansahu921@gmail.com </p><br> Phone: 7000517223</p>
    </footer>

     <script src="ProfileUpdate.js"></script>
</body>
</html>
