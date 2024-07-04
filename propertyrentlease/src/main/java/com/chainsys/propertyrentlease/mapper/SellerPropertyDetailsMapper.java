package com.chainsys.propertyrentlease.mapper;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.SellerProperty;

public class SellerPropertyDetailsMapper implements RowMapper<SellerProperty> {

	@Override
	public SellerProperty mapRow(ResultSet rs, int rowNum) throws SQLException {
		SellerProperty sellerproperty = new SellerProperty();
		sellerproperty.setPropertyId(rs.getInt("property_id"));
		sellerproperty.setPropertyType(rs.getString("property_type"));
		sellerproperty.setSqft(rs.getInt("sqft"));
		sellerproperty.setFurnishing(rs.getString("furnishing"));
		sellerproperty.setAvailableFrom(rs.getDate("available_from"));
		sellerproperty.setRent(rs.getInt("rent"));
		sellerproperty.setAddress(rs.getString("address"));
		sellerproperty.setPostedOnDate(rs.getDate("posted_on_date"));
		sellerproperty.setLocation(rs.getString("location"));
		sellerproperty.setEbBillStream(rs.getBinaryStream("EB_Bill"));
		sellerproperty.setOwnerId(rs.getInt("owner_id"));
		sellerproperty.setRentId(rs.getInt("rent_id"));
		sellerproperty.setSubscriptionId(rs.getInt("subscription_id"));
		sellerproperty.setApproval(rs.getBoolean("is_approval"));
		List<InputStream> images = new ArrayList<>();
	     
	        InputStream imageStream = rs.getBinaryStream("images");
	        if (imageStream != null) {
	            images.add(imageStream);
	        }
	        sellerproperty.setImages(images);
	        
	        return sellerproperty;
	    
}

}
