package com.myfamily.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myfamily.dao.UserDao;
import com.myfamily.model.Leaderboard;
import com.myfamily.model.User;
import com.myfamily.model.UserDetails;

@Component
@Transactional
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManagerFactory;

	public List getUserDetails() {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery criteria = builder.createQuery(UserDetails.class);
		Root contactRoot = criteria.from(UserDetails.class);
		criteria.select(contactRoot);
		return session.createQuery(criteria).getResultList();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Boolean addUserDao(User user) {
		boolean flag = false;
		entityManagerFactory.persist(user);
		if(user.getId() >0) {
			flag= true;
		}
		return flag;
	}
	
	public User findByName(String name) {
	    User user = null;
	    Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
	    Query query = session.createQuery("SELECT u FROM User u WHERE u.name=:name");
	    query.setParameter("name", name);
	    try {
	        user = (User) query.getSingleResult();
	    } catch (Exception e) {
	        // Handle exception
	    }
	    return user;
	}

	@Override
	public Boolean creaditPointsDao(Leaderboard ll) {
		entityManagerFactory.persist(ll);
		return true;
	}

}
