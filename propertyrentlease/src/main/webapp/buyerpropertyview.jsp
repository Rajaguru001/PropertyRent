<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.propertyrentlease.model.SellerPropertyForm" %>
<%@ page import="com.chainsys.propertyrentlease.model.Users" %>
<%@ page import="com.chainsys.propertyrentlease.model.PropertyImage" %>
<%@ page import="com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl" %>
<%@ page import="com.chainsys.propertyrentlease.model.Comment" %>
<%@ page import="java.util.List"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.Base64"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Approved Properties</title>
<style>
#properties-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	align-items: flex-start;
	margin-top: 20px;
}



.property {
	width: 1000px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	margin-bottom: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.property h2 {
	margin-top: 0;
}

.property p {
	margin: 5px 0;
}

.property img {
	margin-bottom: 10px;
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

.logo {
	display: flex;
	align-items: center;
	justify-content: center;
}

.logo img {
	max-height: 30px;
	margin-right: 10px;
}

button[type="submit"] {
	background-color: #FF204E;
	color: white;
	border: none;
	cursor: pointer;
	padding: 12px 24px;
	border-radius: 4px;
	transition: background-color 0.3s, box-shadow 0.3s;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

button[type="submit"]:hover {
	background-color: #FF1654;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.comment-box {
	margin-top: 20px;
	background-color: #f0f2f5;
	border-radius: 8px;
	padding: 20px;
}

.comment-box textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: none;
	font-family: Arial, sans-serif;
	font-size: 14px;
}

.comment-box textarea:focus {
	border-color: #FF204E;
	outline: none;
	box-shadow: 0 0 5px rgba(255, 32, 78, 0.5);
}

.property p {
	margin: 5px 0;
	font-family: 'Arial', sans-serif;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
	text-decoration: none;
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

.search-container {
	display: inline-block;
	text-align: center;
	width: 75%;
	max-width: 700px;
	margin: 0 auto;
	margin-top: 1.5%;
	margin-left:250px;
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

.navbar h6{
padding:0px;
margin:0px;

}

</style>
<script>
function bookNow() {
    alert("Property booked successfully!");
    alert("Thank you for booking!");
}
</script>
</style>
</head>
<body>
	<div class="navbar">
		<h1 class="logo">
			<img src="image/EliteRentalslogo.jpg" alt="EliteRentals Logo">
			<span class="company-name">EliteRentals</span>
		</h1>
		<a href="ContentPage.jsp"><h6>Home</h6></a>
	</div>
	<form action="buyerview" method="post">
	<input type="hidden" name="action" value="search">
	<input type="hidden" name="search" value="search">
		<div class="search-container">

				<select name="location" id="location" required>
					<option value="">Select Location</option>
					<option value="Madurai">Madurai</option>
					<option value="Coimbatore">Coimbatore</option>
					<option value="Chennai">Chennai</option>
					<option value="Trichy">Trichy</option>
					<option value="Theni">Theni</option>
				</select> <select name="budget" id="budget" required>
					<option value="">Select Budget</option>
					<option value="1000">1000</option>
					<option value="5000">5000</option>
					<option value="10000">10000</option>
					<option value="20000">20000</option>
					<option value="50000">50000</option>
				</select>
				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
		</div>
	</form>
 	

		<h1>Properties List</h1>
		<div id="properties-container">
			<%
        
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

        	PropertyRentLeaseImpl propertyLeaseimpl = (PropertyRentLeaseImpl) context.getBean("propertyRentLeaseImpl");
        List<SellerPropertyForm> approvedProperties = (List<SellerPropertyForm>) request.getAttribute("approvedProperties");
        if (approvedProperties != null && !approvedProperties.isEmpty()) {
            for (SellerPropertyForm property : approvedProperties) {
                List<PropertyImage> propertyImages = propertyLeaseimpl.getPropertyImage((property.getPropertyId()));
                    List<Comment> comments=propertyLeaseimpl.getcomment(property.getPropertyId());    
    %>

			<div class="property">
				<p>
					
					<% for (PropertyImage image : propertyImages) { %>
					<img
						src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(image.getImage()) %>"
						width="250" height="200"  alt="">
					<% } %>
				</p>
				<p>
					Type:
					<%= property.getPropertyType() %></p>
				<p>
					Square Feet:
					<%= property.getSqft() %></p>
				<p>
					Furnishing:<%= property.getFurnishing() %></p>
				<p>
					AvailableFrom:<%= property.getAvailableFrom() %></p>
				<p>
					Price:<%= property.getRent() %></p>
				<p>
					Address:<%= property.getAddress() %></p>
				<p>
					Posted On Date:<%= property.getPostedOnDate() %></p>
				<p>
					Location:<%= property.getLocation() %></p>
				<p></p>


				<p>Property Reviews</p>

				<%
            Users userId=(Users)session.getAttribute("user"); 
        %>
			   	<p>
					<% for(Comment comment : comments) { %>

				<p><%=userId.getUsername()%>
					:<%= comment.getCommentsection() %></p>
                
         <%} %>     
</p>
				
      <form id="Propertybuyer" action="PropertyRentBuyer" method="post">
       
        <input type="hidden" value=<%=userId.getUserid()%> name="id">
        <input type="number" value=<%= property.getPropertyId()%>
					name="propertyId"> 
         <input type="hidden" value=<%=userId.getEmail() %> name="buyerId">
          <input type="text" value=<%= property.getOwnerId()%>
					name="sellerId">
         
        <button type="submit" >Book Now</button>
    
	</form>
	
    <form action="/saveComment" method="post">
    <%
    
    %>
    
        <input type="hidden" value=<%=userId.getUserid()%> name="id">
        <input type="text" value=<%= property.getPropertyId()%>
			name="propertyId">    
        <input type="hidden" value=<%=userId.getUsername()%>
			name="username">
        <div class="comment-box">
            <textarea rows="4" cols="50" name="comment"
				placeholder="Enter your comment here..."></textarea>
            <button type="submit" >Comment</button>
        </div>
    </form>
   
        
    </div>
    <%
            }
        } 
        else {
    %>
    <p>No properties have been approved yet.</p>
    <%
        }
    %>
    
</div>
</body>
</html>
