package com.worthy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.worthy.entity.Booking;
import com.worthy.entity.Event;
import com.worthy.entity.Marquee;

public class BookingDaoImpl implements BookingDao {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@Override
	public List<Booking> getBookingsByUserId(int userId) {
		session.createQuery("From Booking where user.id=:userId").setParameter("userId", userId).list();
		return null;
	}


}
