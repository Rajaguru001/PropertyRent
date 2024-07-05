package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.SellerDashBoard;

public class SellerDashBoardMapper implements RowMapper<SellerDashBoard> {

	@Override
	public SellerDashBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
		 SellerDashBoard sellerdashboard=new SellerDashBoard();
		 sellerdashboard.setOwnerid(rs.getInt("owner_id"));
		 sellerdashboard.setRentid(rs.getInt("rent_id"));
		 sellerdashboard.setRequestid(rs.getInt("request_id"));
		 sellerdashboard.setApproval(rs.getBoolean("approval"));
		 sellerdashboard.setPropertyid(rs.getInt("property_id"));
		
		 return sellerdashboard;
	}
	

}
