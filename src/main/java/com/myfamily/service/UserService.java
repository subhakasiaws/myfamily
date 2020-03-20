/**
 * 
 */
package com.myfamily.service;

import java.util.List;

import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;

public interface UserService {

	Integer addUser(User user);

	Leaderboard creaditPoints(Leaderboard ll);

	List<Leaderboard> findAll();

	Integer updateLeaderboard(Leaderboard leaderboard);

	Boolean saveEvent(Event event);

	List<Event> findAllEvents();

}
