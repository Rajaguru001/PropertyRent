<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.propertyrentlease.model.Users" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Rent Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        
        form {
            display: flex;
            flex-direction: column;
        }
        
        label {
            margin-bottom: 10px;
        }
        
        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="file"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
        }
        
        select {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
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
            font-size: 16px;
        }
        
        button[type="submit"]:hover {
            background-color: #FF1654;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
        
        .navbar h6 {
            padding: 0px;
            margin: 0px;
            margin-left: 30px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1 class="logo">
            <img src="image/EliteRentalslogo.jpg" alt="EliteRentals Logo">
            <span class="company-name">EliteRentals</span>
        </h1>
        <a href="ContentPage.jsp">
            <h6>Home</h6>
        </a>
    </div>
    <div class="container">
        <h2>Property Rent Form</h2>
        <form id="propertyForm" action="/postpropertydetails" method="post" enctype="multipart/form-data">
            <label for="property_type">Property Type:</label>
            <select id="property_type" name="property_type" required>
                <option value="house">House</option>
                <option value="apartment">Apartment</option>
                <option value="pg">PG</option>
                <option value="land">Land</option>
            </select>
            
            <label for="sqft">Sqft:</label>
            <input type="number" id="sqft" name="sqft" required>
            
            <label for="furnishing">Furnishing:</label>
            <select id="furnishing" name="furnishing" required>
                <option value="unfurnished">Unfurnished</option>
                <option value="semifurnished">Semi-furnished</option>
                <option value="furnished">Furnished</option>
            </select>
            
            <label for="available_from">Available From:</label>
            <input type="date" id="available_from" name="available_from" min="2024-06-14" required>
            
            <label for="rent_price">Rent Price:</label>
            <input type="number" id="rent_price" name="rent_price" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="posted_on_date">Posted on Date:</label>
            <input type="date" id="posted_on_date" name="posted_on_date" min="2024-06-14" required>
            
            <label for="location">Location:</label>
            <select id="location" name="location" required>
                <option value="Theni">Theni</option>
                <option value="Chennai">Chennai</option>
                <option value="Madurai">Madurai</option>
                <option value="Trichy">Trichy</option>
                <option value="Coimbatore">Coimbatore</option>
            </select>
            
            <label for="EB_Bill">EB Bill:</label>
            <input type="file" id="EB_Bill" name="EB_Bill" accept="image/*" required>
            
            <label for="property_images">Property Images:</label>
            <input type="file" id="property_images" name="property_images" accept="image/*" multiple required>
            
            <% 
            Users userId = (Users) session.getAttribute("user");
            %>
            <input type="text" value=<%=userId.getUserid()%> name="id">
            
            <button type="submit">Submit</button>
        </form>
    </div>
   <script>
        // JavaScript to set the default value of Posted on Date to today's date
        document.addEventListener("DOMContentLoaded", function() {
            var currentDate = new Date();
            var year = currentDate.getFullYear();
            var month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // Adding 1 because getMonth() returns zero-based index
            var day = currentDate.getDate().toString().padStart(2, '0');
            var today = year + '-' + month + '-' + day;
            
            document.getElementById('posted_on_date').value = today;
        });
    </script>
</body>
</html>
