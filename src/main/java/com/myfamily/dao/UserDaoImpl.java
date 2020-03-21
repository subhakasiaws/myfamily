package com.myfamily.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myfamily.model.Event;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.Users;

@Component
@Transactional
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Leaderboard> createBoardDao(Leaderboard users) {
		Users isExists = findByName(users.getUsers().getName());
		if (isExists == null) {
			entityManager.persist(users);
			entityManager.flush();
		}
		return findAll();
	}
	
	public Users findByName(String name) {
	    Users users = null;
	    Query query = entityManager.createQuery("SELECT u FROM Users u WHERE u.name=:name");
	    query.setParameter("name", name);
	    try {
	    	users = (Users) query.getSingleResult();
	    } catch (Exception e) {
	    }
	    return users;
	}
	public Leaderboard findByNameFromLeader(String name) {
		Leaderboard leaderboard = null;
	    Query query = entityManager.createQuery("SELECT u FROM Leaderboard u WHERE u.name=:name");
	    query.setParameter("name", name);
	    try {
	    	leaderboard = (Leaderboard) query.getSingleResult();
	    } catch (Exception e) {
	    }
	    return leaderboard;
	}
	@Override
	public Leaderboard creaditPointsDao(Leaderboard ll) {
		Leaderboard leaderboard = findByNameFromLeader(ll.getUsers().getName());
		if (leaderboard == null) {
		entityManager.persist(ll);
		entityManager.flush();
		return ll;
		}
		return leaderboard;
	}
	
	@Override
	public Integer updateLeaderboardDao(Integer userId, Integer points) {
		Leaderboard leaderBoard = entityManager.find(Leaderboard.class,userId);
		leaderBoard.setPoints(leaderBoard.getPoints()+points);
		entityManager.merge(leaderBoard);
		entityManager.flush();
		return leaderBoard.getPoints();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Leaderboard> findAll() {
		return entityManager.createQuery("select e from Leaderboard as e where e.points >=0 order by points desc",
				Leaderboard.class).getResultList();
	}

	@Override
	public Boolean saveEventDao(Event event) {
		entityManager.persist(event);
		entityManager.flush();
		if(event.getId()!=null) {
			return true;
		}
		return false;
		
	}

	@Override
	public List<Event> findAllEventsDao() {
		return entityManager.createQuery("Select t from " + Event.class.getSimpleName() + " t").getResultList();
	}

}
