package com.worthy.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAO;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Event;
import com.worthy.entity.Menu;
import com.worthy.entity.User;

public class MenuAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private UserDAO userDAO = new UserDAOImpl();
	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private List<Menu> menuList=new ArrayList<Menu>();
	private List<Event> eventList=new ArrayList<Event>();
	private Menu menu;
	private int menuId;
	private SessionMap<String, Object> session;

	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}
	
	public String menuList()
	{
		if(session.get("userId")!=null){
			menuList = statfulDao.findAll(Menu.class);
			eventList=statfulDao.findAll(Event.class);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String addMenu(){
		Event event=statfulDao.findById(Event.class, menu.getEvent().getId());
		menu.setEvent(event);
		statfulDao.saveOrUpdate(menu);
		return SUCCESS;
	}

	public String deleteMenu() {
		Menu menuToDelete=statfulDao.findById(Menu.class, menuId);
		  if(menuToDelete!=null){
			  statfulDao.delete(menuToDelete);
			  return SUCCESS;
		  }
		  return ERROR;
		}
	
	/* -------------------------------- Getter Setter ------------------------------------- */
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public StatefulDaoSupport getStatfulDao() {
		return statfulDao;
	}

	public void setStatfulDao(StatefulDaoSupport statfulDao) {
		this.statfulDao = statfulDao;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	
}