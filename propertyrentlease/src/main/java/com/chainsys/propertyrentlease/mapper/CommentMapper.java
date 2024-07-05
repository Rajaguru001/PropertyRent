package com.chainsys.propertyrentlease.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.propertyrentlease.model.Comment;

public class CommentMapper implements RowMapper<Comment> {

	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment comment = new Comment();
		comment.setUserid(rs.getInt("user_id"));
		comment.setUsercomment(rs.getString("user_name"));
		comment.setCommentsection(rs.getString("comment_section"));
		comment.setPropertyid(rs.getInt("property_id"));

		return comment;
	}

}
