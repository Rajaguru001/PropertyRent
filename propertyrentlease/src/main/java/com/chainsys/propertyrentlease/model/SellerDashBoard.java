package com.chainsys.propertyrentlease.model;

public class SellerDashBoard {
	private int ownerid;
	private int rentid;
	private int requestid;
	private boolean approval;
	private int propertyid;
	@Override
	public String toString() {
		return "SellerDashBoardRequest [owner_id=" + ownerid + ", rent_id=" + rentid + ", request_id=" + requestid
				+ ", approval=" + approval + ", property_id=" + propertyid + "]";
	}
	public SellerDashBoard (){
		
	}
	public SellerDashBoard(int ownerid, int rentid, int requestid, boolean approval,int propertyid) {
		super();
		this.ownerid = ownerid;
		this.rentid = rentid;
		this.requestid = requestid;
		this.approval = approval;
		this.propertyid=propertyid;
	}

	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public int getRentid() {
		return rentid;
	}
	public void setRentid(int rentid) {
		this.rentid = rentid;
	}
	public int getRequestid() {
		return requestid;
	}
	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}
	public boolean isApproval() {
		return approval;
	}
	public void setApproval(boolean approval) {
		this.approval = approval;
	}
	public int getPropertyid() {
		return propertyid;
	}
	public void setPropertyid(int propertyid) {
		this.propertyid = propertyid;
	}
	
	

}
