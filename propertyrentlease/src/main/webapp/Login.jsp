<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="eng">
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
</style>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        // Retrieve alert message from JSP attribute
        var alertMessage = "${param.alert}";

        if (alertMessage) {
            // Display sweet alert message using SweetAlert library
            swal({
                title: "Alert",
                text: alertMessage,
                icon: "info",
                button: "OK",
            });
        }
    </script>
</head>
<body>

	<div class="navbar">
		<h1 class="logo">
			<img src="image/EliteRentalslogo.jpg" alt="EliteRentals Logo">
			<span class="company-name">EliteRentals</span>
		</h1>
	</div>

	<div class="container">
		<h1>Login Page</h1>
		<form action="/Login" method="post">
			<input type="hidden" name="action" value="Login"> <input
				type="hidden" name="Login">
			<hr>
			<table>
			
				<tr>
					<th>login page</th>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" placeholder="Email"
						required></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password"
						placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&]).{5,}" required></td>
				</tr>
			</table>
			<input type="submit" value="Login">
			<hr>
			<a href="http://localhost:8080/PropertyRentLease/RegisterPage.jsp"
				class="signup-link">Signup</a>

		</form>
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
					<a href="#"><img src="insta.jpg" alt="Instagram" height="15px"
						width="15px"></a> <a href="#"><img src="facebook.jpg"
						alt="Facebook" height="15px" width="15px"></a> <a href="#"><img
						src="twitter.png" alt="Twitter" height="15px" width="15px"></a>
				</div>
			</div>
		</div>
		<p class="copyright">&copy; 2024 BrickHouse. All rights reserved.</p>
	</footer>

</body>
</html>