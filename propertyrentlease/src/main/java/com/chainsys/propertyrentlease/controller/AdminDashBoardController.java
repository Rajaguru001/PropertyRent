package com.chainsys.propertyrentlease.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;
import com.chainsys.propertyrentlease.model.SellerPropertyForm;

@Controller
public class AdminDashBoardController {
	
	@Autowired
	PropertyRentLeaseImpl propertyimpl;
	
	@PostMapping("/admindashboard")
	public String adminapproval(@RequestParam("propertyId") int propertyid) {
		propertyimpl.approveproperty(propertyid);
		
		return "admindashboard.jsp";
		
	}
	
	@GetMapping("/buyerview")
	  public String showApprovedProperties(Model model) {
            List<SellerPropertyForm> approvedProperties = propertyimpl.getApprovedProperties();
            model.addAttribute("approvedProperties", approvedProperties);
       
        return "buyerpropertyview.jsp"; 
    }
	
	

}
