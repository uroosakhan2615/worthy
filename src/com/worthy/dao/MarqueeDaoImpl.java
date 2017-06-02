package com.worthy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;

public class MarqueeDaoImpl implements MarqueeDao {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a marquee.
	 */
//	
//	public void saveOrUpdatemarquee(marquee marquee) {
//		try {
//			session.saveOrUpdate(marquee);
//		} catch (Exception e) {
//			transaction.rollback();
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * Used to delete a marquee.
//	 */
//	
//	public void deletemarquee(int marqueeId) {
//		try {
//			marquee marquee = (marquee) session.get(marquee.class, marqueeId);
//			session.delete(marquee);
//		} catch (Exception e) {
//			transaction.rollback();
//			e.printStackTrace();
//		} 
//	}
//	
//	/**
//	 * Used to list all the marquees.
//	 */
//	@SuppressWarnings("unchecked")
//	public List<marquee> listmarquee() {
//		List<marquee> courses = null;
//		try {
//			courses = session.createQuery("from marquee").list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return courses;
//	}
//
//	/**
//	 * Used to list a single marquee by Id.
//	 */
//	public marquee listmarqueeById(int marqueeId) {
//		marquee marquee = null;
//		try {
//			marquee = (marquee) session.get(marquee.class, marqueeId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return marquee;
//	}
//
//	@Override
//	public void delet9emarquee(int marqueeId) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public marquee getmarqueeByEmailAndPassword(String email, String password) {
//		try {
//			Criteria criteria= session.createCriteria(marquee.class);
//			criteria.add(Restrictions.eq("email", email));
//			criteria.add(Restrictions.eq("password", password));
//			marquee marquee=(marquee) criteria.list().get(0);
//			return marquee;
//			
////			Query query= (Query) session.createQuery("From marquee where email=:email").list();
////			query.setParameter("email", email);
////			return (marquee) query.list().get(0);
//			
//		} catch (Exception e) {
//			transaction.rollback();
//			e.printStackTrace();
//		}
//		return null; 
//	}
//
//	@Override
//	public marquee findBymarqueeName(String marqueename) {
//		try {
//			Criteria criteria= session.createCriteria(marquee.class);
//			criteria.add(Restrictions.eq("email", marqueename));
//			marquee marquee=(marquee) criteria.list().get(0);
//			return marquee;
//			
//		} catch (Exception e) {
//			transaction.rollback();
//			e.printStackTrace();
//		}
//		return null; 
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<marqueeRoles> getmarqueeRolesByName(String email) {
//		return session.createQuery("From marqueeRoles where marquee.email=:email")
//				.setParameter("email", email).list();
//	}
}
