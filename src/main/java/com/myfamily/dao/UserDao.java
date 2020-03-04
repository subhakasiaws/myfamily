package com.myfamily.dao;

import java.util.List;

import com.myfamily.model.User;
import com.myfamily.model.UserDetails;

public interface UserDao {
	
	List<UserDetails> getUserDetails();

	Boolean addUserDao(User user);

}
