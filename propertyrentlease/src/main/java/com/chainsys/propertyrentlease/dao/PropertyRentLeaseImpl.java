package com.chainsys.propertyrentlease.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.propertyrentlease.mapper.SellerPropertyFormMapper;
import com.chainsys.propertyrentlease.mapper.UserMapper;
import com.chaisys.propertyrentlease.model.SellerPropertyForm;
import com.chaisys.propertyrentlease.model.Users;

@Repository
public class PropertyRentLeaseImpl implements PropertyRentLeaseDAO {
	private final JdbcTemplate jdbcTemplate;

	@Autowired
	public PropertyRentLeaseImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean insert(Users users) {
		String query = "SELECT email FROM users WHERE email=?";
		String insert = "INSERT INTO users (user_name, password, email, phonenumber) VALUES (?, ?, ?, ?)";

		boolean emailExists = jdbcTemplate.query(query, new Object[] { users.getEmail() }, (resultSet) -> {
			return resultSet.next();
		});
		if (!emailExists) {

			jdbcTemplate.update(insert, users.getUsername(), users.getPassword(), users.getEmail(),
					users.getPhonenumber());
			return true;
		}

		return false;
	}

	@Override
	public Users getUserIdByEmail(Users users) {
	    try {
            String query = "SELECT user_id, user_name, password, email, phonenumber FROM users WHERE email=?";
            Users user = jdbcTemplate.queryForObject(query, new UserMapper(), users.getEmail());
            return user; // Return the user if found
        } catch (EmptyResultDataAccessException ex) {
            return null; // Return null if no user found
        }
	}

	@Override
	public Users adminlogincheck(Users users) {
		String query = "select user_id, user_name, password, email, phonenumber from users where email=? and password=?";
		Users user = jdbcTemplate.queryForObject(query, new UserMapper(),
				new Object[] { users.getEmail(), users.getPassword() });
		if (user == null) {
			return null;
		} else {
			return user;
		}

	}

	@Override
	public Users loggerInUser(Users user) {
		String query="select * from property_details WHERE owner_id=?";
		Users users=jdbcTemplate.queryForObject(query, new UserMapper(),new Object[] {user.getUserid()});
		if(users == null) {
		return null;
		}else {
			return users;
		}
	}

	
}
