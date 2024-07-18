package com.chainsys.propertyrentlease.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PropertyRentLeaseException extends Exception{
	 
	public boolean PropertyRentLeaseException(String username) {
		System.out.println("invalid Username");
        String regex = "[A-Za-z]+";
    	Pattern pattern = Pattern.compile(regex);
    	Matcher matcher = pattern.matcher(username);
    	return matcher.matches();
        

    }	
}

