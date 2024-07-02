package com.chainsys.propertyrentlease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.chainsys.propertyrentlease.dao.PropertyRentLeaseImpl;

@Controller
public class SellerPropertyDetailsController {
   @Autowired
   PropertyRentLeaseImpl  propertyimpl;
   
   @PostMapping("postpropertydetails")
   public String propertydetails()
   
}
	


