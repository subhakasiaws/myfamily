package com.myfamily.dao;

import java.util.List;

import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;

public interface UserDao {
	
	List<Leaderboard> createBoardDao(Leaderboard user);

	Leaderboard creaditPointsDao(Leaderboard ll);

	List<Leaderboard> findAll();

	Integer updateLeaderboardDao(Integer userId, Integer points);

	Boolean saveEventDao(Event event);

	List<Event> findAllEventsDao();

	Boolean dropEvent(Integer eventId);

}
