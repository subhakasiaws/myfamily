package com.myfamily.dao;

import java.util.List;

import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;
import com.myfamily.model.UserDetails;

public interface UserDao {
	
	List<UserDetails> getUserDetails();

	Boolean addUserDao(User user);

	Integer creaditPointsDao(Leaderboard ll);

	List<Leaderboard> findAll();

	Integer updateLeaderboardDao(Leaderboard ll);

}
