package com.chainsys.propertyrentlease.dao;

import org.springframework.stereotype.Repository;

import com.chaisys.propertyrentlease.model.SellerPropertyForm;
import com.chaisys.propertyrentlease.model.Users;

@Repository
public interface PropertyRentLeaseDAO {
   public  boolean insert(Users users);
   public Users  getUserIdByEmail(Users User);
   public Users adminlogincheck(Users user);
   public SellerPropertyForm loggerInUser(Users user);

}
