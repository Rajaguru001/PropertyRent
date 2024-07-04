package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.Users;

public class UserMapper implements RowMapper<Users> {

	@Override
	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		Users users = new Users();
		int userid = rs.getInt("user_id");
		String username = rs.getString("user_name");
		String password = rs.getString("password");
		String email = rs.getString("email");
		String phonenumber = rs.getString("phonenumber");


		users.setUserid(userid);
		users.setUsername(username);
		users.setPassword(password);
		users.setEmail(email);
		users.setPhonenumber(phonenumber);

		return users;
	}


}
