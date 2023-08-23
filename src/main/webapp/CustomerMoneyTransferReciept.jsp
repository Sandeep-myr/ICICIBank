<%@page import="bank.CustomerMoneyTransfer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="bank.BankLogin"
	import="bank.CustomerMoneyTransfer"%>
<!DOCTYPE html>
<html>
<head>
<title>Money Transfer Reciept</title>
<!-- ... Your head content ... -->
<link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
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
		<h2>Money Transfer Slip</h2>
	</div>
	<div class="container">
		<!-- ... Profile picture and success symbol ... -->

		<div class="details">

			<%
			int netbalance;
			try {
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hdfc", "maihar");
				Statement stmt = conn.createStatement();

				stmt.executeQuery("select * from " + request.getAttribute("a/c") + "  order by tradate desc");
				ResultSet rs = stmt.getResultSet();

				rs.next();
				netbalance = rs.getInt("netbalance");
			%>





			<img
				src="https://i.pinimg.com/originals/94/96/e7/9496e7d9729e14408f0e21272e8885c7.gif"
				alt="Payment-Success" class="profile-pic"> <img
				src="https://logos.flamingtext.com/Word-Logos/success-design-stripes-name.gif"
				alt="Success Symbol" class="success-symbol">


			<p>
				<strong>Date Of Transaction :</strong>
				<%=new java.util.Date()%></p>
			<p>
			<p>
				<strong>Transaction id :</strong>
				<%=(int) (Math.random() * 1000000)%></p>
			<p>
				<strong> Reciver Account Number:</strong>
				<%=request.getParameter("accountNumber")%></p>
			<p>


				<strong>Reciver Name:</strong>
				<%=request.getParameter("accountHolderName")%></p>
			<p>
			<p>

				<strong>Sender Account Number:</strong>
				<%=request.getAttribute("a/c")%></p>
			<p>
			<p>
				<strong>Payment Mode:</strong>
				<%=request.getParameter("option")%>
			</p>
			<p>
				<strong>Reference:</strong>
				<%=request.getParameter("reference")%>
			</p>




			<p>
				<strong> Amount:</strong>
				<%=request.getParameter("ammount")%>
			</p>
			<strong>Total Amount:</strong>

			<%=netbalance%>
			<p>
			<p>
				<strong>Thanks</strong>
			</p>


			<%
			} catch (Exception e) {
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
			<div class="button" onclick="goBackTwoSteps()">Done</div>
			<div class="button print" onclick="printPage()">Print</div>
		</div>
		<script>
			window.history.replaceState({}, document.title,
					window.location.href);
		</script>
		<div class="login">
			<a onclick="goBackTwoSteps()"><strong>Go To Dashboard<strong></a>
		</div>

	</div>
	</div>
	<script>
			window.history.replaceState({}, document.title,
					window.location.href);
			
			function goBackTwoSteps() {
			    history.go(-2);
			}
		</script>
	<div class="footer">&copy; ICICI Bank</div>
</body>
</html>
