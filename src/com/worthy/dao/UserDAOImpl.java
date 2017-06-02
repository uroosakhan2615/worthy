package com.worthy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public class UserDAOImpl implements UserDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a user.
	 */
	
	public void saveOrUpdateUser(User user) {
		try {
			session.saveOrUpdate(user);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a user.
	 */
	
	public void deleteUser(int userId) {
		try {
			User user = (User) session.get(User.class, userId);
			session.delete(user);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the users.
	 */
	@SuppressWarnings("unchecked")
	public List<User> listUser() {
		List<User> courses = null;
		try {
			courses = session.createQuery("from User").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single user by Id.
	 */
	public User listUserById(int userId) {
		User user = null;
		try {
			user = (User) session.get(User.class, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void delet9eUser(int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getUserByEmailAndPassword(String email, String password) {
		try {
			Criteria criteria= session.createCriteria(User.class);
			criteria.add(Restrictions.eq("email", email));
			criteria.add(Restrictions.eq("password", password));
			User user=(User) criteria.list().get(0);
			return user;
			
//			Query query= (Query) session.createQuery("From User where email=:email").list();
//			query.setParameter("email", email);
//			return (User) query.list().get(0);
			
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return null; 
	}

	@Override
	public User findByUserName(String username) {
		try {
			Criteria criteria= session.createCriteria(User.class);
			criteria.add(Restrictions.eq("email", username));
			User user=(User) criteria.list().get(0);
			return user;
			
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return null; 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRoles> getUserRolesByName(String email) {
		return session.createQuery("From UserRoles where user.email=:email")
				.setParameter("email", email).list();
	}
}
