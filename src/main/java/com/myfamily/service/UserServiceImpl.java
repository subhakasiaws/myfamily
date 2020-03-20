/**
 * 
 */
package com.myfamily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myfamily.dao.UserDao;
import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public List<Leaderboard> createBoard(Leaderboard leaderboard) {
		return userDao.createBoardDao(leaderboard);
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

	@Override
	public Boolean saveEvent(Event event) {
		return userDao.saveEventDao(event);
	}

	@Override
	public List<Event> findAllEvents() {
		return userDao.findAllEventsDao();
	}

}
