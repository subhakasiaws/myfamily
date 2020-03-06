package com.myfamily.dao.impl;

import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.myfamily.dao.UserDao;
import com.myfamily.model.User;
import com.myfamily.model.UserDetails;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public List getUserDetails() {
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery criteria = builder.createQuery(UserDetails.class);
		Root contactRoot = criteria.from(UserDetails.class);
		criteria.select(contactRoot);
		return session.createQuery(criteria).getResultList();
	}

	@Override
	public Boolean addUserDao(User user) {
		boolean flag = false;
		Session session = entityManagerFactory.unwrap(SessionFactory.class).openSession();
			session.saveOrUpdate(user);
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

}
