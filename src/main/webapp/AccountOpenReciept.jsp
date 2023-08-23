<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="bank.OpenAccount"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Holder Details</title>
<link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
<!-- ... Your head content ... -->
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.header {
	background-color: #0046ad;
	color: #fff;
	text-align: center;
	padding: 10px;
}

.sub-header {
	text-align: center;
	margin-top: 20px;
	font-size: 24px;
}

.container {
	max-width: 600px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.details {
	text-align: left;
	margin-top: 20px;
	left: 150px;
	position: relative;
	color: black;
	font-weight: bold;
}

.footer {
	text-align: center;
	margin-top: 20px;
	padding: 10px;
	background-color: #001aad;
	color: #fff;
}

.login {
	text-align: center;
	margin-top: 20px;
	padding: 10px;
	background-color: #f06f1f;
	color: #fff;
	text-decoration: none;
}

.login a {
	text-align: center;
	margin-top: 20px;
	padding: 10px;
	background-color: #f06f1f;
	color: #fff;
	text-decoration: none;
}

.button {
	background-color: #0046ad;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.button.print {
	background-color: #00a000;
}

.profile-pic {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
	display: block;
	margin: 0 auto;
	left: -150px;
	position: relative; /* Center-align the profile picture */
}

.success-symbol {
	width: 300px;
	height: 70px;
	display: block;
	margin: 20px auto;
	left: -150px;
	position: relative; /* Center-align the success symbol */
}

.buttons {
	display: flex;
	justify-content: space-evenly;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="header">
		<h1>Welcome To ICICI Bank</h1>
	</div>
	<div class="sub-header">
		<h2>Account Holder Details</h2>
	</div>
	<div class="container">
		<!-- ... Profile picture and success symbol ... -->

		<div class="details">


			<%
			Connection conn = null;
			ResultSet resultSet = null;
			PreparedStatement pstmt;
			try {
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hdfc", "maihar");
				
				pstmt = conn.prepareStatement("insert into " + OpenAccount.accountnumber + " (netbalance) values(?)");
				pstmt.setInt(1, 0);
		
				pstmt.executeUpdate();
				CallableStatement cstmt = conn.prepareCall("{call accountopenreceipt(?,?,?,?,?,?,?,?,?)}");
				cstmt.setString(1, OpenAccount.accountnumber);
				cstmt.registerOutParameter(2, Types.VARCHAR);
				cstmt.registerOutParameter(3, Types.VARCHAR);
				cstmt.registerOutParameter(4, Types.DATE);
				cstmt.registerOutParameter(5, Types.BLOB);
				cstmt.registerOutParameter(6, Types.BIGINT);
				cstmt.registerOutParameter(7, Types.VARCHAR);
				cstmt.registerOutParameter(8, Types.VARCHAR);
				cstmt.registerOutParameter(9, Types.VARCHAR);
				cstmt.execute();
				Blob imageBlob = cstmt.getBlob(5);

				// Convert BLOB data to bytes
				byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());

				// Encode image bytes to Base64
				String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
			%>

			<!-- Display BLOB image -->
			<img src="data:image/jpeg;base64,<%=base64Image%>"
				alt="Profile Picture" class="profile-pic"> <img
				src="https://thumbs.gfycat.com/GargantuanSatisfiedHarborseal-max-1mb.gif"
				alt="Success Symbol" class="success-symbol">


			<p>
				<strong>Date Of Registraion :</strong>
				<%=new java.util.Date()%></p>
			<p>
			<p>
				<strong>Date Of Birth :</strong>
				<%=cstmt.getDate(4)%></p>
			<p>
				<strong>Account Number:</strong>
				<%=OpenAccount.accountnumber%></p>
			<p>
				<strong>Account Holder Name:</strong>
				<%=cstmt.getString(2)%></p>
			<p>
				<strong>Father Name : </strong>
				<%=cstmt.getString(3)%></p>
			<p>
				<strong>User Name :</strong>
				<%=cstmt.getString(8)%></p>
			<p>
				<strong>Mobile-Number:</strong>
				<%=cstmt.getLong(6)%></p>
			<p>
				<strong>Email:</strong>
				<%=cstmt.getString(7)%>
			</p>

			<p>
				<strong>Password:  **********</strong> 			</p>

			<%
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>


		</div>
		<script>
			function printPage() {
				window.print();
			}
		</script>
		<!-- ... Buttons and login ... -->
		<div class="buttons">
			<div class="button" onclick="window.location.href = 'BankHome.html'">Done</div>
			<div class="button print" onclick="printPage()">Print</div>
		</div>
		<script>
			window.history.replaceState({}, document.title,
					window.location.href);
		</script>
		<div class="login">
			<a href="Login.html"><strong>Login<strong></a>
		</div>
	</div>
	</div>
	<div class="footer">&copy; ICICI Bank</div>
</body>
</html>
