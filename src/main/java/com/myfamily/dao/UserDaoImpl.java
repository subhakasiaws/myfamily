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
import com.myfamily.model.User;

@Component
@Transactional
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Integer addUserDao(User user) {
		User isExists = findByName(user.getName());
		if (isExists == null) {
			entityManager.persist(user);
			entityManager.flush();
			return user.getId();
		}
		return isExists.getId();
	}
	
	public User findByName(String name) {
	    User user = null;
	    Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.name=:name");
	    query.setParameter("name", name);
	    try {
	        user = (User) query.getSingleResult();
	    } catch (Exception e) {
	    }
	    return user;
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
		Leaderboard leaderboard = findByNameFromLeader(ll.getName());
		if (leaderboard == null) {
		entityManager.persist(ll);
		entityManager.flush();
		return ll;
		}
		return leaderboard;
	}
	
	@Override
	public Integer updateLeaderboardDao(Leaderboard ll) {
		Leaderboard leaderBoard = entityManager.find(Leaderboard.class,ll.getUserId());
		leaderBoard.setPoints(leaderBoard.getPoints()+ll.getPoints());
		entityManager.merge(leaderBoard);
		entityManager.flush();
		return leaderBoard.getPoints();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Leaderboard> findAll() {
		return entityManager.createQuery("select e from Leaderboard as e where e.name is not null order by points desc",
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

}
