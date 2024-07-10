package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.SellerDashBoardRequest;

public class SellerDashBoardRequestMapper implements RowMapper<SellerDashBoardRequest>{

	@Override
	public SellerDashBoardRequest mapRow(ResultSet rs, int rowNum) throws SQLException {
		  SellerDashBoardRequest request = new SellerDashBoardRequest();
	        request.setOwner_id(rs.getInt("owner_id"));
	        request.setOwner_name(rs.getString("owner_name"));
	        request.setOwner_email(rs.getString("owner_email"));
	        request.setOwner_phonenumber(rs.getString("owner_phonenumber"));
	        request.setRenter_id(rs.getInt("renter_id"));
	        request.setRenter_name(rs.getString("renter_name"));
	        request.setRenter_email(rs.getString("renter_email"));
	        request.setRenter_phonenumber(rs.getString("renter_phonenumber"));
	        request.setProperty_id(rs.getInt("property_id"));
	        request.setProperty_type(rs.getString("property_type"));
	        request.setSqft(rs.getInt("sqft"));
	        request.setFurnishing(rs.getString("furnishing"));
	        request.setAvailable_from(rs.getDate("available_from"));
	        request.setRent(rs.getInt("rent"));
	        request.setAddress(rs.getString("address"));
	        request.setPosted_on_date(rs.getDate("posted_on_date"));
	        request.setEB_Bill(rs.getBytes("EB_Bill"));
	    
	        return request;
	}

}
