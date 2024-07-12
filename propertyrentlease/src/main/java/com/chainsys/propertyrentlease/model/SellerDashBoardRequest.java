package com.chainsys.propertyrentlease.model;

import java.sql.Date;
import java.util.Arrays;

public class SellerDashBoardRequest {
	private int owner_id;
	private String owner_name;
	private String owner_email;
	private String owner_phonenumber;
	private int renter_id;
	private String renter_name;
	private String renter_email;
	private String renter_phonenumber;
	private int property_id;
	private String property_type;
	private int sqft;
	private String furnishing;
	private Date available_from;
	private int rent;
	private String address;
	private Date posted_on_date;
	private byte[] EB_Bill;

	public int getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public String getOwner_email() {
		return owner_email;
	}

	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}

	public String getOwner_phonenumber() {
		return owner_phonenumber;
	}

	public void setOwner_phonenumber(String owner_phonenumber) {
		this.owner_phonenumber = owner_phonenumber;
	}

	public int getRenter_id() {
		return renter_id;
	}

	public void setRenter_id(int renter_id) {
		this.renter_id = renter_id;
	}

	public String getRenter_name() {
		return renter_name;
	}

	public void setRenter_name(String renter_name) {
		this.renter_name = renter_name;
	}

	public String getRenter_email() {
		return renter_email;
	}

	public void setRenter_email(String renter_email) {
		this.renter_email = renter_email;
	}

	public String getRenter_phonenumber() {
		return renter_phonenumber;
	}

	public void setRenter_phonenumber(String renter_phonenumber) {
		this.renter_phonenumber = renter_phonenumber;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public int getSqft() {
		return sqft;
	}

	public void setSqft(int sqft) {
		this.sqft = sqft;
	}

	public String getFurnishing() {
		return furnishing;
	}

	public void setFurnishing(String furnishing) {
		this.furnishing = furnishing;
	}

	public Date getAvailable_from() {
		return available_from;
	}

	public void setAvailable_from(Date available_from) {
		this.available_from = available_from;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getPosted_on_date() {
		return posted_on_date;
	}

	public void setPosted_on_date(Date posted_on_date) {
		this.posted_on_date = posted_on_date;
	}

	public byte[] getEB_Bill() {
		return EB_Bill;
	}

	public void setEB_Bill(byte[] EB_Bill) {
		this.EB_Bill = EB_Bill;
	}

	@Override
	public String toString() {
		return "SellerDashBoardRequest [owner_id=" + owner_id + ", owner_name=" + owner_name + ", owner_email="
				+ owner_email + ", owner_phonenumber=" + owner_phonenumber + ", renter_id=" + renter_id
				+ ", renter_name=" + renter_name + ", renter_email=" + renter_email + ", renter_phonenumber="
				+ renter_phonenumber + ", property_id=" + property_id + ", property_type=" + property_type + ", sqft="
				+ sqft + ", furnishing=" + furnishing + ", available_from=" + available_from + ", rent=" + rent
				+ ", address=" + address + ", posted_on_date=" + posted_on_date + ", EB_Bill="
				+ Arrays.toString(EB_Bill) + "]";
	}

}
