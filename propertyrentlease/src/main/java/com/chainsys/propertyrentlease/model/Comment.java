package com.chainsys.propertyrentlease.model;

public class Comment {
	private int userid;
	private int commentid;
	private String commentsection;
	private int propertyid;
	public Comment(){
 
 }
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public String getCommentsection() {
		return commentsection;
	}
	public void setCommentsection(String commentsection) {
		this.commentsection = commentsection;
	}
	public int getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(int propertyid) {
		this.propertyid = propertyid;
	}
	@Override
	public String toString() {
		return "Comments [user_id=" + userid + ", comment_id=" + commentid + ", comment_section=" + commentsection
				+ ", property_id=" + propertyid + "]";
	}
	

}
