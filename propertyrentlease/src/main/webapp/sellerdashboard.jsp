<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.chainsys.propertyrentlease.model.Users"%>
<%@ page import="com.chainsys.propertyrentlease.model.SellerDashBoard"%>
<%@ page
	import="com.chainsys.propertyrentlease.model.SellerDashBoardRequest"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.Base64"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page
	import="com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Seller Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

header {
	background-color: #FF204E;
	color: #fff;
	padding: 10px;
	text-align: center;
}

nav {
	background-color: #FF204E;
	padding: 10px;
	text-align: center;
}

nav a {
	color: #fff;
	text-decoration: none;
	padding: 10px;
}

nav a:hover {
	background-color: #555;
}

.container {
	width: 80%;
	margin: auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content {
	padding: 20px;
}

.owner, .buyer {
	display: flex;
	flex-direction: column;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	position: fixed;
	width: 100%;
	bottom: 0;
}

button.approve-button {
	background-color: #FF204E;
	color: white;
	border: none;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
}

button.approved {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: default;
}
.owner {
	flex: 1;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	width:50%;
}

.buyer {
	flex: 1;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	width:100%;
}
.profile-img {
	width: 100px; 
	height: 100px;
	border-radius: 50%;
	margin-right: 10px;
	object-fit: cover;
}

</style>

</head>
<body>
	<header>
		<h1>Elite Rentals	</h1>
	</header>

	<nav>
		<a href="contentPage.jsp">Home</a> <a href="#">Logout</a> <a
			href="postproperty.jsp">post property</a>
	</nav>
	<h2>
		Welcome back,
		<%=((Users) session.getAttribute("user")).getUsername()%>!
	</h2>
	<p>This is your Seller Dashboard.</p>

	<div class="container">
		<div class="content">
			<%
			Users userId = (Users) session.getAttribute("user");
			%>

			<%
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

			PropertyRentLeaseImpl propertyLeaseimpl = (PropertyRentLeaseImpl) context.getBean("propertyRentLeaseImpl");

			List<SellerDashBoardRequest> sellerdashboard = propertyLeaseimpl.sellerdashboard(userId.getUserid());
			if (sellerdashboard != null && !sellerdashboard.isEmpty()) {
				for (SellerDashBoardRequest requests : sellerdashboard) {
			%> 
			

			<div class="buyer">
			<img src="images/man.png" alt="Buyer Profile" class="profile-img" >
		<%-- 	<p>
					BuyerName:
					<%=requests.getOwnerId()%></p>
					<p>
					BuyerName:
					<%=requests.getRentId()%></p> --%>
				<p>
					BuyerName:
					<%=requests.getRenter_name()%></p>
				<p>
					BuyerEmail:
					<%=requests.getRenter_email()%></p>
				<p>
					BuyerPhonenumber:
					<%=requests.getRenter_phonenumber()%></p>
					<form action="/sellermail" method="post">
				<input type="text" name="propertyId"
					value="<%=requests.getProperty_id()%>"> <input type="text"
					name="rentid" value="<%=requests.getRenter_id()%>">
				<button type="submit" class="approve-button">Approval</button>
			</form>
					

			</div>
			


			<hr>
			<%
			}
			} else {
			%>
			<p>No data available</p>
			<%
			}
			%>






		</div>
	</div>

	<footer> &copy; 2024 PropertyRent. All rights reserved. </footer>

	
</body>
</html>
