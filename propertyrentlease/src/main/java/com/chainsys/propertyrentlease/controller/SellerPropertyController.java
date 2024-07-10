package com.chainsys.propertyrentlease.controller;
import com.chainsys.propertyrentlease.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chainsys.propertyrentlease.model.PropertyImage;
import com.chainsys.propertyrentlease.model.SellerPropertyForm;
import com.chainsys.propertyrentlease.model.Users;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SellerPropertyController {

	@Autowired
	PropertyRentLeaseImpl propertyimpl;
	
	@Autowired
	EmailUtility emailutil;

	@PostMapping("/postpropertydetails")
	public String propertydetails(@RequestParam("property_type") String propertyType, @RequestParam("sqft") int sqft,
			@RequestParam("furnishing") String furnishing, @RequestParam("available_from") String availableFromStr,
			@RequestParam("rent_price") int rentPrice, @RequestParam("address") String address,
			@RequestParam("posted_on_date") String postedDateStr, @RequestParam("location") String location,
			@RequestParam("EB_Bill") MultipartFile ebBill,
			@RequestParam("property_images") MultipartFile[] propertyImages, @RequestParam("id") int userId,
			RedirectAttributes redirectAttributes) {

		SellerPropertyForm sellerProperty = new SellerPropertyForm();
		PropertyImage propertyimage = new PropertyImage();
		Date availableFrom = parseDate(availableFromStr);
		Date postedOnDate = parseDate(postedDateStr);

		InputStream ebBillInputStream = null;
		if (!ebBill.isEmpty()) {
			try {
				ebBillInputStream = ebBill.getInputStream();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		List<InputStream> propertyImagesInputStreamList = new ArrayList<>();
		for (MultipartFile propertyImage : propertyImages) {
			if (!propertyImage.isEmpty()) {
				try {
					propertyImagesInputStreamList.add(propertyImage.getInputStream());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		try {
			propertyimpl.savesProperty(userId, propertyType, sqft, furnishing, rentPrice, address, location,
					availableFrom, postedOnDate, ebBillInputStream, propertyImagesInputStreamList);
			redirectAttributes.addFlashAttribute("message", "Property details saved successfully!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Failed to save property details. Please try again.");
			e.printStackTrace();
		}

		return "subscription.jsp";
	}

	private Date parseDate(String dateStr) {
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	@PostMapping("/subscription")
	public String payment(@RequestParam("id") int ownerId, @RequestParam("userID") String userID,
			@RequestParam("cardNumber") String cardNumber, @RequestParam("expiry") String expiry,
			@RequestParam("cvv") String cvv, @RequestParam("status") boolean status) {
		Users users = new Users();

		users.setPaymentstatus(status);
		users.setUserid(ownerId);

		return "contentpage.jsp";
	}

	@PostMapping("/sellermail")
	public String sellermail(@RequestParam("propertyId") int propertyid, @RequestParam("rentid") int rentid) {
		propertyimpl.sellermail(propertyid);
		String rentmail = propertyimpl.owneremailid(rentid);
		System.out.println("the email is"+rentmail);
		String subject=" Important Notice: Regarding Your Recent Inquiry on Elite Rentals";
		String body="Thank you for your interest in Elite Rentals. We appreciate your inquiry and are delighted to assist you in finding the perfect rental solution. However, we want to ensure that your experience is safe and secure.\r\n"
				+ "\r\n"
				+ "It has come to our attention that some users may be encountering fraudulent activities online. Therefore, we would like to emphasize the importance of caution when conducting transactions. Elite Rentals does not endorse or facilitate online payments for rental transactions. We strongly advise against sending money online to any party claiming to be associated with us.\r\n"
				+ "\r\n"
				+ "For your safety and security, we recommend connecting directly with the seller for further discussions and arrangements. Direct meetings provide an opportunity for clear communication and transparency, ensuring a smooth rental process.\r\n"
				+ "\r\n"
				+ "Should you require any assistance or have further questions, please do not hesitate to contact us. Our team is here to support you every step of the way.\r\n"
				+ "\r\n"
				+ "Thank you for choosing Elite Rentals. We look forward to assisting you in finding your ideal rental property.\r\n"
				+ "\r\n"
				+ "Best regards, ";
		emailutil.sendWelcomeEmail(rentmail, subject, body);
		return "sellerdashboard.jsp";

	}

}
