package com.chainsys.propertyrentlease.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.propertyrentlease.model.Comment;
import com.chainsys.propertyrentlease.model.PropertyImage;
import com.chainsys.propertyrentlease.model.SellerDashBoard;
import com.chainsys.propertyrentlease.model.SellerDashBoardRequest;
import com.chainsys.propertyrentlease.model.SellerPropertyForm;
import com.chainsys.propertyrentlease.model.Users;

@Repository
public interface PropertyRentLeaseDAO {
	public boolean insert(Users users);

	public Users getUserIdByEmail(Users User);
	
	public boolean insertLogin(Users user);

	public Users adminlogincheck(Users user);

	public SellerPropertyForm loggerInUser(Users user);

	public void savesProperty(int userId, String propertyType, int sqft, String furnishing, int rentPrice,
			String address, String location, java.util.Date availableFrom, java.util.Date postedOnDate,
			InputStream ebBillInputStream, List<InputStream> propertyImagesInputStreamList);

	public void subscription(Users user);
	
	public List<SellerPropertyForm> getPropertyDetails();
	
	public List<PropertyImage> getPropertyImage(int propertyid);
	
	public void approveproperty(int propertyid);
	
	public List<SellerPropertyForm> getApprovedProperties();
	
	public void comment(int userid, String comment, int propertyid);
	
	public List<Comment> getcomment(int propertyid);
	
	public List<SellerPropertyForm> searchApprovedProperties(String location, int budget);
	
    public String owneremailid(int sellerid);
	 
	public void buyerrequest(int ownersid, int buyersid, int propertesid);
	
	public List<SellerDashBoardRequest> sellerdashboard(int buyersid);
	
	public  Users checkseller(Users user);
	
	public void sellermail(int propertyId);
	
	public void buyer(int buyerid, int propertyid);
	
	public List <SellerDashBoard> sellerdashboardrequest(int buyersid);
	
	
	
}
