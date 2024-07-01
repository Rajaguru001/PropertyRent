package com.chainsys.propertyrentlease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chaisys.propertyrentlease.model.Users;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private final PropertyRentLeaseImpl propertyimpl;

	public UserController(PropertyRentLeaseImpl propertyimpl) {
		this.propertyimpl = propertyimpl;
	}

	@RequestMapping("/")
	public String home() {
		return "ContentPage.jsp";
	}

	@RequestMapping("/Register")
	public String registerpage() {
		return "Register.jsp";
	}

	@PostMapping("/Registeruser")
	public String register(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("phonenumber") String phonenumber,
			RedirectAttributes redirectAttributes) {
		Users users = new Users();
		users.setUsername(name);
		users.setPassword(password);
		users.setEmail(email);
		users.setPhonenumber(phonenumber);
		if (propertyimpl.insert(users)) {
			return "Login.jsp";
		} else {
			redirectAttributes.addFlashAttribute("alert", "You already have an account.");
			return "redirect:/Login.jsp";
		}
	}

	@PostMapping("/Login")
	public String login(HttpSession session, @RequestParam("email") String email,
			@RequestParam("password") String password) {
		Users user = new Users();
		user.setEmail(email);
		user.setPassword(password);
		Users users = propertyimpl.getUserIdByEmail(user);
		session.setAttribute("email", users);
		Users adminlogincheck = propertyimpl.adminlogincheck(users);
		if (adminlogincheck != null) {
			if (user.getEmail().matches("\\b[A-Za-z0-9._%+-]+@eliterental\\.com\\b")
					&& user.getPassword().matches("Raju@123")) {
				return "AdminDashBoard.jsp";
			} else {
				return "ContentPage.jsp";
			}

		} else {

			return "RegisterPage.jsp";
		}

	}

}
