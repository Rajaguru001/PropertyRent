package com.chainsys.propertyrentlease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chaisys.propertyrentlease.model.Users;

@Controller
public class UserController {
	private final Users users;

	@Autowired
	public UserController(Users users) {
		this.users = users;
	}

	@RequestMapping("/")
	public String home() {
		return "Welcome.jsp";
	}

	@RequestMapping("/Register")
	public String register(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("phonenumber") String phonenumber) {
		users.setUsername(name);
		users.setPassword(password);
		users.setEmail(email);
		users.setPhonenumber(phonenumber);
		

		return "";

	}
}
