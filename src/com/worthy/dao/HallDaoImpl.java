package com.worthy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.worthy.entity.Hall;

public class HallDaoImpl implements HallDao{

	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Hall> getActiveHalls() {
		return session.createQuery("From Hall where status=true").list();
	}
	
	@Override
	public Hall getActiveHall(int hallId) {
		return (Hall) session.createQuery("From Hall where id=:hallId")
				.setParameter("hallId", hallId)
				.list().get(0);
	}
	
}
