
package com.chainsys.propertyrentlease.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chainsys.propertyrentlease.model.Comment;
import com.chainsys.propertyrentlease.model.SellerDashBoard;
import com.chainsys.propertyrentlease.model.SellerDashBoardRequest;
import com.chainsys.propertyrentlease.model.SellerPropertyForm;
import com.chainsys.propertyrentlease.util.EmailUtility;

@Controller
public class BuyerController {

	@Autowired
	PropertyRentLeaseImpl propertyimpl;

	@Autowired
	EmailUtility emailutil;

	@PostMapping("/saveComment")
	public String buyerComment(@RequestParam("id") int userId, @RequestParam("comment") String comment,
			@RequestParam("propertyId") int propertyId, Model model) {

		Comment comments = new Comment();
		comments.setUserid(userId);
		comments.setCommentsection(comment);
		comments.setPropertyid(propertyId);
		

		try {

			propertyimpl.comment(userId, comment, propertyId);

			propertyimpl.getcomment(propertyId);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Failed to save comment. Please try again.");
		}

		return "buyerpropertyview.jsp";
	}

	@PostMapping("/Propertybuyer")
	public String buyerbooking(@RequestParam("id") int userid, @RequestParam("propertyId") int propertyid,
			@RequestParam("sellerId") int sellerid,Model model) {
		String ownermailid = propertyimpl.owneremailid(sellerid);
		String subject1 = "Connection Details: Elite Rentals Inquiry ";
		String body1 = "Thank you for your interest in our rental property listed on Elite Rentals. We appreciate your inquiry and would like to facilitate your connection with the seller.\r\n"
				+ "\r\n" + "Here are the contact details of the seller:\r\n" + "\r\n" + "\r\n"
				+ "We advise you to reach out directly to the seller to arrange a meeting and discuss the rental terms in detail. Please remember to exercise caution and avoid online transactions for your security.\r\n"
				+ "\r\n"
				+ "If you have any further questions or need assistance, feel free to contact us. We are here to ensure a smooth and secure rental process for you.\r\n"
				+ "\r\n" + "Best regards,";
		emailutil.sendWelcomeEmail(ownermailid, subject1, body1);
		List<SellerDashBoardRequest> sellerdashboardrequest = null;

		SellerDashBoard sellerdashboard = new SellerDashBoard();
		sellerdashboard.setRentid(userid);
		sellerdashboard.setOwnerid(sellerid);
		sellerdashboard.setPropertyid(propertyid);
		propertyimpl.buyerrequest(userid, sellerid, propertyid);
		System.out.println("the sellerdashboard"+sellerdashboard.toString());
		sellerdashboardrequest =propertyimpl.sellerdashboard(sellerid);
		model.addAttribute("sellerdashboard"+sellerdashboardrequest);

		return "contentpage.jsp";

	}

	@PostMapping("/buyersearchview")
	public String buyersearch(@RequestParam("location") String location, @RequestParam("budget") int budget,
			Model model) {
		List<SellerPropertyForm> approvedProperties = propertyimpl.searchApprovedProperties(location, budget);
		model.addAttribute("approvedProperties", approvedProperties);

		return "buyerpropertyview.jsp";

	}

}
