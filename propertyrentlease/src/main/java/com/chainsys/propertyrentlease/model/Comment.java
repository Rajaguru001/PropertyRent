package com.chainsys.propertyrentlease.model;

public class Comment {
	private int userid;
	private int commentid;
	private String usercomment;
	private String commentsection;
	private int propertyid;
	
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
	
	public String getUsercomment() {
		return usercomment;
	}
	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
	}
	@Override
	public String toString() {
		return "Comment [userid=" + userid + ", commentid=" + commentid + ", usercomment=" + usercomment
				+ ", commentsection=" + commentsection + ", propertyid=" + propertyid + "]";
	}
	

}
