package com.worthy.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAO;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Event;
import com.worthy.entity.Menu;
import com.worthy.entity.MenuItem;
import com.worthy.entity.User;

public class MenuAction extends ActionSupport implements SessionAware, ServletRequestAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private UserDAO userDAO = new UserDAOImpl();
	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private List<Menu> menuList=new ArrayList<Menu>();
	private List<MenuItem> menuItems= new ArrayList<MenuItem>();
	
	private List<Event> eventList=new ArrayList<Event>();
	private Menu menu;
	private Menu editMenu;
	private int menuId;
	private SessionMap<String, Object> session;
	
	private File menuImage;
	private String menuImageContentType;
	private String menuImageFileName;
	
	private HttpServletRequest servletRequest;
	
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}
	
	public String menuList()
	{
		if(session.get("userId")!=null){
			menuList = statfulDao.findAll(Menu.class);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String addMenu(){
		try {
			String filePath = servletRequest.getRealPath("/");
			
			File fileToCreate = new File(filePath+"\\images\\"+ this.menuImageFileName);
			FileUtils.copyFile(this.menuImage, fileToCreate);
			menu.setImageName("\\worthy\\images\\"+this.menuImageFileName);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
		
		for(MenuItem obj: menu.getMenuItems()){
			obj.setMenu(menu);
		}

		statfulDao.saveOrUpdate(menu);
		statfulDao.saveEntities(menu.getMenuItems());
		return SUCCESS;
	}

	public String getEditMenuJsp()
	{	
			editMenu=statfulDao.findById(Menu.class, menuId);
			return SUCCESS;
	}
	
	public String editMenu()
	{	
		if(session.get("userId")!=null)
		{	
			Menu menufromDb=statfulDao.findById(Menu.class, menu.getId());
			if(menufromDb!=null){
				for(MenuItem obj: menu.getMenuItems()){
					obj.setMenu(menu);
				}
				menufromDb.setMenuItems(menu.getMenuItems());
				menufromDb.setDescription(menu.getDescription());
				menufromDb.setMenuName(menu.getMenuName());
				
				statfulDao.saveOrUpdate(menufromDb);
				statfulDao.saveEntities(menufromDb.getMenuItems());
			}
			return SUCCESS;
		}
		return ERROR;
	}

	public String deleteMenu() {
		if(session.get("userId")!=null){
			Menu menuToDelete=statfulDao.findById(Menu.class, menuId);
			if(menuToDelete!=null){
				statfulDao.deleteEntities(menuToDelete.getMenuItems());
				statfulDao.delete(menuToDelete);
				return SUCCESS;
			}
			return ERROR;
		}
		return SUCCESS;
	}
	/* -------------------------------- Getter Setter ------------------------------------- */
	
	public Menu getEditMenu() {
		return editMenu;
	}

	public void setEditMenu(Menu editMenu) {
		this.editMenu = editMenu;
	}

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

	public List<MenuItem> getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(List<MenuItem> menuItems) {
		this.menuItems = menuItems;
	}

	public File getMenuImage() {
		return menuImage;
	}

	public void setMenuImage(File menuImage) {
		this.menuImage = menuImage;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}

	public String getMenuImageContentType() {
		return menuImageContentType;
	}

	public void setMenuImageContentType(String menuImageContentType) {
		this.menuImageContentType = menuImageContentType;
	}

	public String getMenuImageFileName() {
		return menuImageFileName;
	}

	public void setMenuImageFileName(String menuImageFileName) {
		this.menuImageFileName = menuImageFileName;
	}

}