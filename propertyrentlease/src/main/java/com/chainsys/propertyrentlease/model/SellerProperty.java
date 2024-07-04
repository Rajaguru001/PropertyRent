package com.chainsys.propertyrentlease.model;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class SellerProperty {
	private int propertyId;
	private String propertyType;
	private int sqft;
	private String furnishing;
	private Date availableFrom;
	private int rent;
	private String address;
	private Date postedOnDate;
	private InputStream ebBillStream;
	private String location;
	private int ownerId;
	private int rentId;
	private int subscriptionId;
	private boolean isApproval;
	private int imageId;
	private List<InputStream> images;

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public List<InputStream> getImages() {
		return images;
	}

	public void setImages(List<InputStream> images) {
		this.images = images;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
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

	public Date getAvailableFrom() {
		return availableFrom;
	}

	public void setAvailableFrom(Date availableFrom) {
		this.availableFrom = availableFrom;
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

	public Date getPostedOnDate() {
		return postedOnDate;
	}

	public void setPostedOnDate(Date postedOnDate) {
		this.postedOnDate = postedOnDate;
	}

	public InputStream getEbBillStream() {
		return ebBillStream;
	}

	public void setEbBillStream(InputStream ebBillStream) {
		this.ebBillStream = ebBillStream;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public int getRentId() {
		return rentId;
	}

	public void setRentId(int rentId) {
		this.rentId = rentId;
	}

	public int getSubscriptionId() {
		return subscriptionId;
	}

	public void setSubscriptionId(int subscriptionId) {
		this.subscriptionId = subscriptionId;
	}

	public boolean isApproval() {
		return isApproval;
	}

	public void setApproval(boolean isApproval) {
		this.isApproval = isApproval;
	}

}
