package com.chainsys.propertyrentlease.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
public class PropertyRentLeaseValidation {
	
	

	    

	    public boolean validateUsername(String username) {
	       
	        String regex = "[A-Za-z]+";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(username);
	        return matcher.matches();
	    }

	    public boolean validateMobile(String mobile) {
	       
	    	
	        String regex = "^[6-9]\\d{9}$";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(mobile);
	        return matcher.matches();
	    }

	    public boolean validateEmail(String email) {
	       
	        String regex = "^[a-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,}$";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(email);
	        return matcher.matches();
	    }

	    public boolean passwordsMatch(String confirmPassword) {
	        String regex ="(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&$]).{5,}";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(confirmPassword);
	        return matcher.matches();
	    }
	

}
