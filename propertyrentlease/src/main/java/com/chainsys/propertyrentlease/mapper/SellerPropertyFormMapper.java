package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.SellerPropertyForm;

public class SellerPropertyFormMapper implements RowMapper<SellerPropertyForm> {

	@Override
	public SellerPropertyForm mapRow(ResultSet rs, int rowNum) throws SQLException {
		 SellerPropertyForm sellerPropertyForm = new SellerPropertyForm();
	        sellerPropertyForm.setPropertyId(rs.getInt("property_id"));
	        sellerPropertyForm.setPropertyType(rs.getString("property_type"));
	        sellerPropertyForm.setSqft(rs.getInt("sqft"));
	        sellerPropertyForm.setFurnishing(rs.getString("furnishing"));
	        sellerPropertyForm.setAvailableFrom(rs.getDate("available_from"));
	        sellerPropertyForm.setRent(rs.getInt("rent"));
	        sellerPropertyForm.setAddress(rs.getString("address"));
	        sellerPropertyForm.setPostedOnDate(rs.getDate("posted_on_date"));
	        sellerPropertyForm.setLocation(rs.getString("location"));
	        sellerPropertyForm.setEbBillStream(rs.getBinaryStream("EB_Bill"));
	        sellerPropertyForm.setOwnerId(rs.getInt("owner_id"));
	        sellerPropertyForm.setRentId(rs.getInt("rent_id"));
	        sellerPropertyForm.setSubscriptionId(rs.getInt("subscription_id"));
	        sellerPropertyForm.setApproval(rs.getBoolean("is_approval"));
	        
	        return sellerPropertyForm;
	    }

}
