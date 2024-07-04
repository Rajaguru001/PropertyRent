package com.chainsys.propertyrentlease.model;

import org.springframework.context.annotation.Configuration;

@Configuration
public class Users {
	private int userId;
	private String userName;
	private String password;
	private String email;
	private String phoneNumber;
	boolean paymentstatus;

	public int getUserid() {
		return userId;
	}

	public void setUserid(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return userName;
	}

	public void setUsername(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phoneNumber;
	}

	public void setPhonenumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

	public boolean isPaymentstatus() {
		return paymentstatus;
	}

	public void setPaymentstatus(boolean paymentstatus) {
		this.paymentstatus = paymentstatus;
	}

	public Users() {

	}

}
