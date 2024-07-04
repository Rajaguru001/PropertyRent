
package com.chainsys.propertyrentlease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chainsys.propertyrentlease.model.Comment;

@Controller
public class BuyerController {

	@Autowired
	PropertyRentLeaseImpl propertyimpl;

	@PostMapping("/saveComment")
	public String buyerComment(@RequestParam("id") int userId, @RequestParam("comment") String comment,
			@RequestParam("propertyId") int propertyId, Model model) {

		Comment comments = new Comment();
		comments.setUserid(userId);
		comments.setCommentsection(comment);
		comments.setPropertyid(propertyId);

		try {

			propertyimpl.getcomment(propertyId);

			propertyimpl.comment(userId, comment, propertyId);

			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Failed to save comment. Please try again.");
		}

		return "buyerpropertyview.jsp";
	}
}
