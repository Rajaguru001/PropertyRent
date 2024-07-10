package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.SellerDashBoardRequest;

public class SellerDashBoardRequestMapper implements RowMapper<SellerDashBoardRequest>{

	@Override
	public SellerDashBoardRequest mapRow(ResultSet rs, int rowNum) throws SQLException {
		 SellerDashBoardRequest sellerDashBoard = new SellerDashBoardRequest();
	        
	        sellerDashBoard.setPropertyId(rs.getInt("property_id"));
	        sellerDashBoard.setPropertyType(rs.getString("property_type"));
	        sellerDashBoard.setSqft(rs.getInt("sqft"));
	        sellerDashBoard.setFurnishing(rs.getString("furnishing"));
	        sellerDashBoard.setAvailableFrom(rs.getDate("available_from"));
	        sellerDashBoard.setRent(rs.getInt("rent"));
	        sellerDashBoard.setAddress(rs.getString("address"));
	        sellerDashBoard.setPostedOnDate(rs.getDate("posted_on_date"));
	        sellerDashBoard.setEbBill(rs.getBinaryStream("EB_Bill"));
	        sellerDashBoard.setOwnerId(rs.getInt("owner_id"));
	        sellerDashBoard.setRentId(rs.getInt("rent_id"));
	        sellerDashBoard.setSubscriptionId(rs.getInt("subscription_id"));
	        sellerDashBoard.setApproval(rs.getBoolean("is_approval"));
	        sellerDashBoard.setOwnerName(rs.getString("owner_name"));
	        sellerDashBoard.setOwnerEmail(rs.getString("owner_email"));
	        sellerDashBoard.setOwnerPhoneNumber(rs.getString("owner_phonenumber"));
	        sellerDashBoard.setRenterName(rs.getString("renter_name"));
	        sellerDashBoard.setRenterEmail(rs.getString("renter_email"));
	        sellerDashBoard.setRenterPhoneNumber(rs.getString("renter_phonenumber"));
	        sellerDashBoard.setImageId(rs.getInt("image_id"));
	        sellerDashBoard.setImages(rs.getBytes("images"));
	       
	        return sellerDashBoard;
	        
	}

}
