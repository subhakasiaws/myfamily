/**
 * 
 */
package com.myfamily.service;

import java.util.List;

import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;

public interface UserService {

	Leaderboard creaditPoints(Leaderboard ll);

	List<Leaderboard> findAll();

	Integer updateLeaderboard(Integer userId, Integer points);

	Boolean saveEvent(Event event);

	List<Event> findAllEvents();

	List<Leaderboard> createBoard(Leaderboard leaderboard);

}
