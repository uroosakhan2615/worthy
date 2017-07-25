package com.worthy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.worthy.entity.Hall;
import com.worthy.entity.Marquee;

public class MarqueeDaoImpl implements MarqueeDao {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	//TODO: to be decided
	@SuppressWarnings("unchecked")
	@Override
	public List<Marquee> getMarqueesByCity(int cityId) {
		return session.createQuery("From Marquee where city.id=:cityId").setParameter("cityId", cityId).list();
	}

	@Override
	public List<Hall> getHallByMarquee(int marqueeId) {
		return session.createQuery("From Hall where marquee.id=:marqueeId").setParameter("marqueeId", marqueeId).list();
	}

	@Override
	public List<Marquee> getActiveMarquees() {
		return session.createQuery("From Marquee where status=true").list();
	}

}
