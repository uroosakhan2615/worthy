package com.worthy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.worthy.entity.Event;
import com.worthy.entity.Marquee;

public class EventDaoImpl implements EventDao {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getActiveEvents() {
		return session.createQuery("From Event where status=true").list();
	}

}
