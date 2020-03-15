/**
 * 
 */
package com.myfamily.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myfamily.dao.UserDao;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;
import com.myfamily.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public Integer addUser(User user) {
		return userDao.addUserDao(user);
	}

	@Override
	public Leaderboard creaditPoints(Leaderboard ll) {
		return userDao.creaditPointsDao(ll);
	}

	@Override
	public List<Leaderboard> findAll() {
		return userDao.findAll();
	}

	@Override
	public Integer updateLeaderboard(Leaderboard leaderboard) {
		return userDao.updateLeaderboardDao(leaderboard);
	}

}
