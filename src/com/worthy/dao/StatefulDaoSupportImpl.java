package com.worthy.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;

public class StatefulDaoSupportImpl implements StatefulDaoSupport{
	
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;
	
	@Override
	public void save(Object entity) {
		session.save(entity);
	}

	@Override
	public void merge(Object entity) {
		session.merge(entity);
	}

	@Override
	public void saveOrUpdate(Object entity) {
		session.saveOrUpdate(entity);
	}

	@Override
	public void delete(Object entity) {
		session.delete(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T findById(Class<T> type, int id) {
		return  (T) session.get(type, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll(Class<T> type) {
		Criteria crit=session.createCriteria(type);
		return crit.list();
	}
	
	@Override
	public void deleteEntities(Collection<?> entities) {
		for (Object entity : entities) {
			session.delete(entity);
		}		
	}
	@Override
	public void saveEntities(List<?> entities) {
		for (Object entity : entities) {
			session.saveOrUpdate(entity);
		}
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
}