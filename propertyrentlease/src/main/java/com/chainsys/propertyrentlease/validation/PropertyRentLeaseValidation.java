package com.chainsys.propertyrentlease.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
public class PropertyRentLeaseValidation {

	public boolean validateUsername(String username) throws PropertyRentLeaseException {

	String regex = "[A-Za-z]+";
	Pattern pattern = Pattern.compile(regex);
	Matcher matcher = pattern.matcher(username);
	Boolean bool =matcher.matches();
	if(Boolean.TRUE.equals(bool)) {
	 return true;
	}
	else {
		throw new PropertyRentLeaseException() ;
	}
	
	}

	public boolean validateMobile(String mobile) throws PropertyRentLeaseException{

		String regex = "^[6-9]\\d{9}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mobile);
		return matcher.matches();
//		Boolean bool =matcher.matches();
		
	}

	public boolean validateEmail(String email) {

		String regex = "^[a-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public boolean passwordsMatch(String confirmPassword) {
		String regex = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&$]).{5,}";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(confirmPassword);
		return matcher.matches();
	}

}
