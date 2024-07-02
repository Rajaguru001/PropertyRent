package com.chainsys.propertyrentlease.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chaisys.propertyrentlease.model.SellerPropertyForm;
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
		return "contentpage.jsp";
	}

	@RequestMapping("/register")
	public String registerpage() {
		return "register.jsp";
	}

	@PostMapping("/registeruser")
	public String register(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("phonenumber") String phonenumber,
			RedirectAttributes redirectAttributes) {
		Users users = new Users();
		users.setUsername(name);
		users.setPassword(password);
		users.setEmail(email);
		users.setPhonenumber(phonenumber);
		if (propertyimpl.insert(users)) {
			return "login.jsp";
		} else {
			redirectAttributes.addFlashAttribute("alert", "You already have an account.");
			return "redirect:/Login.jsp";
		}
	}

	@PostMapping("/login")
	public String login(HttpSession session, @RequestParam("email") String email,
			@RequestParam("password") String password, RedirectAttributes redirectAttributes) {
		Users user = new Users();
		user.setEmail(email);
		user.setPassword(password);
		Users users = propertyimpl.getUserIdByEmail(user);
		if (users == null) {
			redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
			return "redirect:/register.jsp";
		}

		session.setAttribute("user", users);

		Users adminLoginCheck = propertyimpl.adminlogincheck(users);
		if (adminLoginCheck != null) {
			if (user.getEmail().matches("\\b[A-Za-z0-9._%+-]+@eliterental\\.com\\b")
					&& user.getPassword().matches("Raju@123")) {
				return "admindashboard.jsp";
			} else {
				return "contentpage.jsp";
			}
		} else {
			return "register.jsp";
		}
		
	
	}
	
	@PostMapping("/postproperty")
	 public String postProperty(HttpSession session, RedirectAttributes redirectAttributes) {
	        Users loggedInUser = (Users) session.getAttribute("user");
	       
	        if (loggedInUser == null) {
	            redirectAttributes.addFlashAttribute("error", "Please log in to post a property.");
	            return "login.jsp";
	        }

	     
	          return "postproperty.jsp";
	   
	    }
}
