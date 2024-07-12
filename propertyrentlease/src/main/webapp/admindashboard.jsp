<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl" %>
<%@ page import="com.chainsys.propertyrentlease.model.SellerPropertyForm" %>
<%@ page import="com.chainsys.propertyrentlease.model.PropertyImage" %>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
         body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: row;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            padding-top: 20px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            overflow-y: auto;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            overflow-x: auto;
        }

        /* Sidebar Styles */
        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #555;
        }

        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        
        button {
            padding: 8px 16px;
            background-color: #4D76FF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2424FF;
        }

     
        .property-image {
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            margin-right: 5px;
        }

       
        @media only screen and (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                margin-bottom: 20px;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <h2>Hello Admin</h2>
        <p>Home</p>
       <a href="contentpage.jsp"> <p>logout</p></a>
        <a href="/buyerview">Approved Property</a>
    </div>
    <div class="content">
        <h2>Waiting for your Approval!</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Property ID</th>
                    <th>Property Type</th>
                    <th>Sqft</th>
                    <th>Furnishing</th>
                    <th>Available From</th>
                    <th>Rent</th>
                    <th>Address</th>
                    <th>Posted On Date</th>
                    <th>Location</th>
                    <th>EB Bill</th>
                    <th>Images</th>
                    <th>Approval</th>
                </tr>
            </thead>
            <tbody>
                <% try {
                	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

                	PropertyRentLeaseImpl propertyLeaseimpl = (PropertyRentLeaseImpl) context.getBean("propertyRentLeaseImpl");

                       
                        List<SellerPropertyForm> propertyDetailsList = propertyLeaseimpl.getPropertyDetails();
                        if (propertyDetailsList != null) {
                            for (SellerPropertyForm property : propertyDetailsList) {
                                List<PropertyImage> propertyImages = propertyLeaseimpl.getPropertyImage((property.getPropertyId()));
                    %>
                    <tr>
                        <td><%= property.getPropertyId() %></td>
                        <td><%= property.getPropertyType() %></td>
                        <td><%= property.getSqft() %></td>
                        <td><%= property.getFurnishing() %></td>
                        <td><%= property.getAvailableFrom() %></td>
                        <td><%= property.getRent() %></td>
                        <td><%= property.getAddress() %></td>
                        <td><%= property.getPostedOnDate() %></td>
                        <td><%= property.getLocation() %></td>
                        <td>
                            <%
                                InputStream ebBillStream = property.getEbBillStream();
                                byte[] ebBillBytes = new byte[ebBillStream.available()];
                                ebBillStream.read(ebBillBytes);
                                String ebBillBase64 = Base64.getEncoder().encodeToString(ebBillBytes);
                            %> <img src="data:image/jpeg;base64,<%= ebBillBase64 %>" width="200" height="100" alt=""/>
                        </td>
                        <td>
                           		 <% for (PropertyImage image : propertyImages) { %>
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(image.getImage()) %>" width="100" height="100" / alt=""> <% } %>
                        </td>
                        <td>
                            <form action="/admindashboard" method="post">
                                <input type="hidden" name="propertyId" value="<%= property.getPropertyId() %>">
                                <button type="submit">Approval</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
            </tbody>
        </table>
    </div>
</body>
</html>
