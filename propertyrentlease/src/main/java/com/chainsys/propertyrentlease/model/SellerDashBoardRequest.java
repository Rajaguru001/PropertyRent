package com.chainsys.propertyrentlease.model;

import java.io.InputStream;
import java.sql.Date;

public class SellerDashBoardRequest {
	 private int propertyId;
	    private String propertyType;
	    private int sqft;
	    private String furnishing;
	    private Date availableFrom;
	    private double rent;
	    private String address;
	    private Date postedOnDate;
	    private InputStream ebBill;
	    private int ownerId;
	    private int rentId;
	    private int subscriptionId;
	    private boolean approval;
	    private String ownerName;
	    private String ownerEmail;
	    private String ownerPhoneNumber;
	    private String renterName;
	    private String renterEmail;
	    private String renterPhoneNumber;
	    private int imageId;
	    private byte[] images; // Assuming images are stored as byte array

	    // Constructors, getters, and setters
	    // Constructor
	    public void SellerDashBoard() {
	        // Default constructor
	    }
	    
	    // Getters and Setters
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

	    public double getRent() {
	        return rent;
	    }

	    public void setRent(double rent) {
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

	    public InputStream isEbBill() {
	        return ebBill;
	    }

	    public void setEbBill(InputStream ebBill) {
	        this.ebBill = ebBill;
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
	        return approval;
	    }

	    public void setApproval(boolean approval) {
	        this.approval = approval;
	    }

	    public String getOwnerName() {
	        return ownerName;
	    }

	    public void setOwnerName(String ownerName) {
	        this.ownerName = ownerName;
	    }

	    public String getOwnerEmail() {
	        return ownerEmail;
	    }

	    public void setOwnerEmail(String ownerEmail) {
	        this.ownerEmail = ownerEmail;
	    }

	    public String getOwnerPhoneNumber() {
	        return ownerPhoneNumber;
	    }

	    public void setOwnerPhoneNumber(String ownerPhoneNumber) {
	        this.ownerPhoneNumber = ownerPhoneNumber;
	    }

	    public String getRenterName() {
	        return renterName;
	    }

	    public void setRenterName(String renterName) {
	        this.renterName = renterName;
	    }

	    public String getRenterEmail() {
	        return renterEmail;
	    }

	    public void setRenterEmail(String renterEmail) {
	        this.renterEmail = renterEmail;
	    }

	    public String getRenterPhoneNumber() {
	        return renterPhoneNumber;
	    }

	    public void setRenterPhoneNumber(String renterPhoneNumber) {
	        this.renterPhoneNumber = renterPhoneNumber;
	    }

	    public int getImageId() {
	        return imageId;
	    }

	    public void setImageId(int imageId) {
	        this.imageId = imageId;
	    }

	    public byte[] getImages() {
	        return images;
	    }

	    public void setImages(byte[] images) {
	        this.images = images;
	    }

	    // Override toString() method for debugging purposes
	    @Override
	    public String toString() {
	        return "SellerDashBoard{" +
	                "propertyId=" + propertyId +
	                ", propertyType='" + propertyType + '\'' +
	                ", sqft=" + sqft +
	                ", furnishing='" + furnishing + '\'' +
	                ", availableFrom=" + availableFrom +
	                ", rent=" + rent +
	                ", address='" + address + '\'' +
	                ", postedOnDate=" + postedOnDate +
	                ", ebBill=" + ebBill +
	                ", ownerId=" + ownerId +
	                ", rentId=" + rentId +
	                ", subscriptionId=" + subscriptionId +
	                ", approval=" + approval +
	                ", ownerName='" + ownerName + '\'' +
	                ", ownerEmail='" + ownerEmail + '\'' +
	                ", ownerPhoneNumber='" + ownerPhoneNumber + '\'' +
	                ", renterName='" + renterName + '\'' +
	                ", renterEmail='" + renterEmail + '\'' +
	                ", renterPhoneNumber='" + renterPhoneNumber + '\'' +
	                ", imageId=" + imageId +
	                '}';
	    }

}
