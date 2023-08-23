<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Status</title>
    <link rel="icon" href="https://companieslogo.com/img/orig/IBN-af38b5c0.png?t=1648383607" type="image/icon type">
    <style>
        /* Style for the alert box */
        .alert {
            padding: 20px;
            background-color: lightgreen;
            color: black;
            font-size: 18px;
            border-radius: 10px;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
        }
    </style>
    <script>
        // Retrieve the message from the JSP attribute
        var message = '<%= session.getAttribute("message") %>';
        
        // Show the alert if there's a message
        if (message) {
            alert(message);
        }
    </script>
</head>
<body>
</body>
</html>
