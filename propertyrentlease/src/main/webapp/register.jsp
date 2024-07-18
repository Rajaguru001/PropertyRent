<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

.navbar {
	background-color: #FF204E;
	overflow: hidden;
	margin-bottom: 20px;
}

.navbar a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #29252C;
}

.container {
	margin: 0 auto 20px;
	background-color: white;
	padding: 50px;
	border-radius: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
	max-width: 300px;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
	input[type="submit"] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #FF204E;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #29252C;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 20px 0;
}

.signup-link {
	text-align: center;
	margin-top: 10px;
}

.footer-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	padding: 0 20px;
}

.footer-col {
	flex: 1;
	margin: 0 10px;
}

.footer-col h4 {
	margin-bottom: 10px;
}

.footer-col ul {
	list-style-type: none;
	padding: 0;
}

.footer-col ul li {
	margin-bottom: 5px;
}

.social-links img {
	margin-right: 10px;
}

.social-links a {
	color: #fff;
}

.copyright {
	margin-top: 20px;
}

.navbar img {
	max-height: 30px;
	margin-right: 10px;
}

.logo {
	display: flex;
	align-items: center;
	justify-content: center;
}

.logo img {
	max-height: 30px;
	margin-right: 10px;
}

.company-name {
	font-family: 'Arial', sans-serif;
	font-size: 24px;
	font-style: italic;
	font-weight: bold;
	color: white;
}

.alert {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
}

.alert-danger {
	color: #721c24;
	background-color: #f8d7da;
	border-color: #f5c6cb;
}

.error-message {
	color: red;
	font-size: 12px;
	text-align: left;
	margin-top: -10px;
	margin-bottom: 10px;
}
</style>
<script>
        function validateUsername() {
            const username = document.getElementsByName('name')[0].value;
            const regex = /^[A-Za-z]+$/;
            const errorMessage = document.getElementById('username-error');
            if (!regex.test(username)) {
                errorMessage.textContent = 'Invalid username';
            } else {
                errorMessage.textContent = '';
            }
        }

        function validatePassword() {
            const password = document.getElementsByName('password')[0].value;
            const regex = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&$]).{5,}/;
            const errorMessage = document.getElementById('password-error');
            if (!regex.test(password)) {
                errorMessage.textContent = 'Invalid password';
            } else {
                errorMessage.textContent = '';
            }
        }

        function validateEmail() {
            const email = document.getElementsByName('email')[0].value;
            const regex = /^[a-z0-9+_.-]+@[A-Za-z0-9.-]+\.[a-zA-Z]{2,}$/;
            const errorMessage = document.getElementById('email-error');
            if (!regex.test(email)) {
                errorMessage.textContent = 'Invalid email';
            } else {
                errorMessage.textContent = '';
            }
        }

        function validatePhoneNumber() {
            const phoneNumber = document.getElementsByName('phonenumber')[0].value;
            const regex = /^[6-9]\d{9}$/;
            const errorMessage = document.getElementById('phonenumber-error');
            if (!regex.test(phoneNumber)) {
                errorMessage.textContent = 'Invalid phone number';
            } else {
                errorMessage.textContent = '';
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            document.getElementsByName('name')[0].addEventListener('input', validateUsername);
            document.getElementsByName('password')[0].addEventListener('input', validatePassword);
            document.getElementsByName('email')[0].addEventListener('input', validateEmail);
            document.getElementsByName('phonenumber')[0].addEventListener('input', validatePhoneNumber);
        });
    </script>
</head>
<body>

	<div class="navbar">
		<h2 class="logo">
			<img src="image/EliteRentalslogo.jpg" alt="EliteRentals Logo">
			<span class="company-name">Rent. Love. Live.</span>
		</h2>
	</div>

	<div class="container">
		<% if (request.getAttribute("success") != null) { %>
		<div class="alert alert-success"><%= request.getAttribute("success") %></div>
		<% } %>

		<% if (request.getAttribute("error") != null) { %>
		<div class="alert alert-danger"><%= request.getAttribute("error") %></div>
		<% } %>
		<form action="/registeruser" method="post">
			<hr>
			<table>
				<th>Sign Up</th>

				<tr>
					<td>UserName</td>
					<td><input type="text" name="name" placeholder="UserName"
						>
						<div id="username-error" class="error-message"></div></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"
						placeholder="Password"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&$]).{5,}" required>
						<div id="password-error" class="error-message"></div></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email" placeholder="email"
						required>
						<div id="email-error" class="error-message"></div></td>
				</tr>
				<tr>
					<td>PhoneNumber</td>
					<td><input type="text" name="phonenumber"
						placeholder="phonenumber" pattern="[6,7,8,9]{1}[0-9]{9}" required>
						<div id="phonenumber-error" class="error-message"></div></td>
				</tr>

			</table>
			<input type="submit" value="SignUp">
			<hr>

		</form>
		<div class="error"
			style="display: ${not empty errorMessage ? 'block' : 'none'};">
			${errorMessage}</div>
	</div>

	<footer>
		<div class="footer-container">
			<div class="footer-col">
				<h4>Company</h4>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Our Services</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Our Facility</a></li>
				</ul>
			</div>
			<div class="footer-col">
				<h4>Follow Us</h4>
				<div class="social-links">
					<a href="#"><img src="image/insta.jpg" alt="Instagram"
						height="15px" width="15px"></a> <a href="#"><img
						src="image/facebook.jpg" alt="Facebook" height="15px" width="15px"></a>
					<a href="#"><img src="image/twitter.jpg" alt="Twitter"
						height="15px" width="15px"></a>
				</div>
			</div>
		</div>
		<div class="copyright">&copy; 2023 EliteRentals. All rights
			reserved.</div>
	</footer>
</body>
</html>
