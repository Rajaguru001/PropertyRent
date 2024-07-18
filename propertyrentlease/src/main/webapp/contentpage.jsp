<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chainsys.propertyrentlease.model.Users"%>
<%
    Users user = (Users) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EliteRentals</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Roboto', sans-serif;
	background-image: url('image/pexels-sevenstormphotography-443383.jpg');
	background-size: cover;
	background-position: center;
	height: 100vh;
}

nav {
	background-color: #FF204E;
	color: #fff;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-family: 'Roboto', sans-serif;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
}

nav img {
	max-height: 30px;
	margin-right: 10px;
}

nav a {
	color: #fff;
	text-decoration: none;
	margin: 0 10px;
	transition: all 0.3s ease-in-out;
}

nav a:hover {
	text-decoration: underline;
	transform: scale(1.1);
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn i.fa-caret-down {
	margin-left: 5px;
}

.content {
	margin-top: 100px;
	text-align: center;
}

.carousel {
	width: 80%;
	margin: 0 auto;
	margin-top: 20px;
}

.carousel img {
	width: 100%;
	height: 500px;
	object-fit: cover;
}

.search-container {
	display: inline-block;
	text-align: center;
	width: 75%;
	max-width: 700px;
	margin: 0 auto;
	margin-top: 6.5%;
}

.search-container form {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(255, 255, 255, 0.7);
	border: 2px solid #FF204E;
	border-radius: 20px;
	padding: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.search-container select, .search-container input[type="number"] {
	border: none;
	padding: 8px;
	font-family: 'Roboto', sans-serif;
	font-size: 16px;
	outline: none;
	margin-right: 10px;
	border-radius: 5px;
}

.search-container button {
	border: none;
	background-color: #FF204E;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 20px;
	padding: 8px 20px;
	font-size: 14px;
}

.search-container button i {
	color: white;
}

.search-container button:hover {
	background-color: red;
}

.dropdown-buttons .dropdown button.dropbtn {
	background-color: transparent;
	color: #fff;
	border: none;
	padding: 10px 15px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.dropdown-buttons .dropdown button.dropbtn:hover {
	background-color: #333;
}

.bold-text {
	font-weight: bold;
	font-size: 35px;
	margin-bottom: 20px;
	font-family: 'Merriweather', serif;
}

.post-property-button {
	margin-top: 8px;
	text-align: center;
}

.post-property-button form {
	display: inline-block;
}

.post-property-button button {
	background-color: white;
	color: #FF204E;
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 20px;
	font-weight: bold;
	font-family: 'Roboto', sans-serif;
	transition: background-color 0.3s ease;
	position: relative;
	border: 2px solid #FF204E;
	cursor: pointer;
}

.post-property-button button:before {
	content: '\f005';
	color: #FFD505;
	font-family: 'Font Awesome 5 Free';
	position: absolute;
	left: 3px;
	top: 50%;
	transform: translateY(-50%);
}

.post-property-button button:hover {
	background-color: #f5f5f5;
}

.search-container .location-icon {
	color: red;
	margin-right: 5px;
}

.search-container .house-icon {
	color: red;
	margin-right: 5px;
}

.search-container input[type="number"]::-webkit-inner-spin-button,
	.search-container input[type="number"]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.profile-dropdown {
	display: flex;
	align-items: center;
	cursor: pointer;
	position: relative;
}

.profile-dropdown img {
	border-radius: 50%;
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

.profile-dropdown .username {
	color: #fff;
	margin-right: 10px;
}

.profile-dropdown .down-arrow {
	color: #fff;
}

.profile-content {
	display: none;
	position: absolute;
	right: 0;
	top: 40px;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.profile-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.profile-content a:hover {
	background-color: #ddd;
}

footer {
	background-color: #FF204E;
	color: white;
	text-align: center;
	padding: 20px 0;
	position: fixed;
	width: 100%;
	bottom: 0;
}

footer a {
	color: white;
	margin: 0 15px;
	text-decoration: none;
}

footer a:hover {
	text-decoration: underline;
}


</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const profileDropdown = document.querySelector(".profile-dropdown");
    const profileContent = document.querySelector(".profile-content");

    profileDropdown.addEventListener("click", function() {
      profileContent.style.display = profileContent.style.display === "block" ? "none" : "block";
    });

    window.addEventListener("click", function(event) {
      if (!profileDropdown.contains(event.target)) {
        profileContent.style.display = "none";
      }
    });

    $('.carousel').slick({
      dots: true,
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      adaptiveHeight: true,
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: true,
      centerMode: true,
      variableWidth: true
    });
  });
</script>
</head>
<body>
	<nav>
		<div>
			<img src="image/EliteRentalslogo.jpg" alt="EliteRentals Logo">
		</div>

		<div class="dropdown-buttons">
			<div class="dropdown">
				<button class="dropbtn">
					Buy <i class="fas fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="/buyerview">Buy Flat</a> <a href="#">Buy House</a> <a
						href="http://localhost:8080/PropertyRentLease/AdminDashboard">Buy
						PG Hostel</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">
					Sell <i class="fas fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="#">Rent House</a> <a href="#">Rent Flat</a> <a href="#">Rent
						PG</a>
				</div>
			</div>
		</div>

		<% if (!isLoggedIn) { %>
		<div class="login-signup">
			<a href="login.jsp">Login/Signup</a>
		</div>
		<% } else { %>
		<div class="profile-dropdown">
			<img src="images/profilepic.png" alt="Profile Image"> <span
				class="username"><%= user.getUsername() %></span> <i
				class="fas fa-caret-down down-arrow"></i>
			<div class="profile-content">
				<form action="/logout" method="post">
					<button type="submit"
						style="background: none; border: none; padding: 10px; width: 100%; text-align: left;">Logout</button>
				</form>
			</div>
		</div>
		<% } %>

		<div class="post-property-button">
			<form action="/postproperty" method="post">
				<button type="submit">Post Property</button>
			</form>
		</div>
	</nav>
	<div class="content">
		<div class="bold-text">Welcome back! Let's continue your search
		</div>

		<footer>

			<a href="https://www.instagram.com"><i class="fab fa-instagram"></i>
				Instagram</a> <a href="https://www.facebook.com"><i
				class="fab fa-facebook-f"></i> Facebook</a> <a
				href="https://www.twitter.com"><i class="fab fa-twitter"></i>
				Twitter</a>
		</footer>
</body>
</html>
