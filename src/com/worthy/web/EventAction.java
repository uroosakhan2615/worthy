package com.worthy.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.EventDaoImpl;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Event;
import com.worthy.entity.Marquee;
import com.worthy.entity.Menu;
import com.worthy.entity.MenuItem;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public class EventAction extends ActionSupport implements SessionAware{

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private UserDAOImpl userDao = new UserDAOImpl();
	private EventDaoImpl eventDao= new EventDaoImpl();
	
	private int eventId;
	private List<Marquee> marqueeList;
	private List<Menu> menuList;
	private List<Event> eventList;
	private List<User> userList;
	private Event event;
	private SessionMap<String, Object> session;
	private int marqueeId;
	private Event editEvent;
	
	private String startDateStr;
	private String endDateStr;
	
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}
	
	public String eventList()
	{	
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			if(isUserAuthrized(userId)){
				//get active events only
				eventList=eventDao.getActiveEvents();
				marqueeList=statfulDao.findAll(Marquee.class);
				menuList=statfulDao.findAll(Menu.class);
				userList=statfulDao.findAll(User.class);
				return SUCCESS;
			}else {
				return Constants.UNAUTH;
			}
		}
		return ERROR;
	}
	
	public String addEvent(){
		int userId=(int) session.get("userId");
		if(userId!=0){
			User user = statfulDao.findById(User.class, userId);
			Marquee marquee = statfulDao.findById(Marquee.class, event.getMarquee().getId());
			Menu menu=statfulDao.findById(Menu.class, event.getMenu().getId());
			event.setMenu(menu);
			event.setUser(user);
			event.setMarquee(marquee);
			
			event.setStartDate(getStrToDate(startDateStr));
			event.setEndDate(getStrToDate(endDateStr));
			
			statfulDao.saveOrUpdate(event);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String getEditEventJsp(){
		editEvent=statfulDao.findById(Event.class, eventId);
		marqueeList=statfulDao.findAll(Marquee.class);
		userList=statfulDao.findAll(User.class);
		menuList=statfulDao.findAll(Menu.class);
		return SUCCESS;
	}
	
	//Get user's events
	public String userEventList()
	{	
		if(session.get("userId")!=null){
			eventList=eventDao.getActiveEvents();
			marqueeList=statfulDao.findAll(Marquee.class);
			menuList=statfulDao.findAll(Menu.class);
			userList=statfulDao.findAll(User.class);
		return SUCCESS;
		}
		return ERROR;
	}
	
	public String editEvent()
	{	
//		if(session.get("userId")!=null)
//		{	
			
			Event eventFromDb=statfulDao.findById(Event.class, event.getId());
			if(eventFromDb!=null){
				eventFromDb.setEventName(event.getEventName());
				eventFromDb.setDescription(event.getDescription());
				eventFromDb.setEndDate(getStrToDate(endDateStr));
				eventFromDb.setStartDate(getStrToDate(startDateStr));
				eventFromDb.setStatus(event.getStatus());
				statfulDao.saveOrUpdate(eventFromDb);
			}
			return SUCCESS;
//		}
//		return ERROR;
	}
	
	public String deleteEvent() {
		if(session.get("userId")!=null){
			Event eventToDelete=statfulDao.findById(Event.class, eventId);
			if(eventToDelete!=null){
				eventToDelete.setStatus(false);
				statfulDao.saveOrUpdate(eventToDelete);
				return SUCCESS;
			}
			return SUCCESS;
		}
		return ERROR;
	}
	
	
	public boolean isUserAuthrized(int userId){
		User user=statfulDao.findById(User.class, userId);
		boolean status=false;
		List<UserRoles> userRoles=userDao.getUserRolesByUser(user);
		for(UserRoles obj: userRoles){
			if(obj.getRoles().getRoleName().equalsIgnoreCase(("admin"))){
				status=true;
				break;
			}
		}
		return status;
	}
	
	
	public Date getStrToDate(String dateStr){
		
		DateFormat format = new SimpleDateFormat("dd/mm/yyyy", Locale.ENGLISH);
		Date date = null;
		try {
			date = format.parse(dateStr);
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	
	
	/* -------------------------------- Getter Setter ------------------------------------- */
	
	public List<Marquee> getMarqueeList() {
		return marqueeList;
	}

	public void setMarqueeList(List<Marquee> marqueeList) {
		this.marqueeList = marqueeList;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public int getMarqueeId() {
		return marqueeId;
	}

	public void setMarqueeId(int marqueeId) {
		this.marqueeId = marqueeId;
	}

	public Event getEditEvent() {
		return editEvent;
	}

	public void setEditEvent(Event editEvent) {
		this.editEvent = editEvent;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	
}