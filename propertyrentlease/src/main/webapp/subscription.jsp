<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.propertyrentlease.model.Users" %>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Subscription</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

body {
	background-color: #fff;
	padding: 30px 10px;
}

.card {
	max-width: 500px;
	margin: auto;
	color: black;
	border-radius: 20px;
	background-color: #D3D3D3;
	padding: 20px;
}

p {
	margin: 0px;
}

.container .h8 {
	font-size: 30px;
	font-weight: 800;
	text-align: center;
	color: #333;
}

.btn.btn-primary {
	width: 50%;
	margin-left: 100px;
	margin-top: 20px;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 15px;
	background-image: linear-gradient(to right, #77A1D3 0%, #79CBCA 51%, #77A1D3 100%);
	border: none;
	transition: 0.5s;
	background-size: 200% auto;
}

.btn.btn.btn-primary:hover {
	background-position: right center;
	color: #fff;
	text-decoration: none;
}

.btn.btn-primary:hover .fas.fa-arrow-right {
	transform: translate(15px);
	transition: transform 0.2s ease-in;
}

.form-control {
	color: #333;
	background-color: #e9ecef;
	border: 2px solid transparent;
	height: 60px;
	padding-left: 20px;
	vertical-align: middle;
	width: 350px;
	margin-left: 40px;
}

.form-control:focus {
	color: #333;
	background-color: #d6d6d6;
	border: 2px solid #2d4dda;
	box-shadow: none;
}

.text {
	font-size: 14px;
	font-weight: 600;
}

::placeholder {
	font-size: 14px;
	font-weight: 600;
}

</style>
</head>
<body>
<form action="/subscription" method="post">
	<div class="container p-0">
		<div class="card px-4">
			<p class="h8 py-3">Payment Details</p>
			<div class="row gx-3">
				<div class="col-12">
					<div class="d-flex flex-column">
						<p class="text mb-1">UserID</p>
						<% 
							Users userId=(Users)session.getAttribute("user"); 
						%>
						<input class="form-control mb-3" name="userID" type="text" placeholder="Name" value="<%=userId.getUsername()%>">
						 <input type="hidden" value=<%=userId.getUserid()%> name="id">
						
					</div>
						
					<div class="col-12">
					<div class="d-flex flex-column">
						<p class="text mb-1">Card Number</p>
						<input class="form-control mb-3"  name="cardNumber" type="text"
							placeholder="1234 5678 435678">
					</div>
				</div>
				<div class="col-6">
					<div class="d-flex flex-column">
						<p class="text mb-1">Expiry</p>
						<input class="form-control mb-3" name="expiry" type="text" placeholder="MM/YYYY">
					</div>
				</div>
				<div class="col-6">
					<div class="d-flex flex-column">
						<p class="text mb-1">CVV/CVC</p>
						<input class="form-control mb-3 pt-2 " name="cvv" type="password"
							placeholder="***">
					</div>
				</div>
				<div class="col-12">
					<div class="btn btn-primary mb-3">
						<span class="ps-3"><button type="submit">Pay:200</button></span> <span class="fas fa-arrow-right"></span>
					</div>
				</div>
				<div>
				<input type="hidden" name="status" value="false">
				</div>
			</div>
		</div>
	</div>
					
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>

