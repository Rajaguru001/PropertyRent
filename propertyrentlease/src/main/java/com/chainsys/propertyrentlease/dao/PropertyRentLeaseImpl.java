package com.chainsys.propertyrentlease.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.chaisys.propertyrentlease.model.Users;

public class PropertyRentLeaseImpl implements PropertyRentLeaseDAO {
	private static JdbcTemplate jdbcTemplate;

	@Autowired
	public  PropertyRentLeaseImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(Users users) {
        
		return false;
	}

}
