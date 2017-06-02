package com.worthy.web;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAO;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Menu;
import com.worthy.entity.User;

public class MenuAction extends ActionSupport {

	private static final long serialVersionUID = -6659925652584240539L;

	private UserDAO userDAO = new UserDAOImpl();
	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private List<Menu> menuList=new ArrayList<Menu>();
	
	public String menuList()
	{
		menuList = statfulDao.findAll(Menu.class);
		return SUCCESS;
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
}
