/**
 * 
 */
package com.myfamily.service;

import java.util.List;

import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;
import com.myfamily.model.UserDetails;

public interface UserService {

	List<UserDetails> getUserDetails();

	Boolean addUser(User user);

	Boolean creaditPoints(Leaderboard ll);

}
