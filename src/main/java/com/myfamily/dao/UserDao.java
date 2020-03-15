package com.myfamily.dao;

import java.util.List;

import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;

public interface UserDao {
	
	Integer addUserDao(User user);

	Leaderboard creaditPointsDao(Leaderboard ll);

	List<Leaderboard> findAll();

	Integer updateLeaderboardDao(Leaderboard ll);

}
