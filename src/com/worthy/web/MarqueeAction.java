package com.worthy.web;

import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.MarqueeDaoImpl;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.City;
import com.worthy.entity.Marquee;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;
import com.worthy.entity.Hall;

public class MarqueeAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private UserDAOImpl userDao = new UserDAOImpl();
	private MarqueeDaoImpl marqueeDao = new MarqueeDaoImpl();
	private Marquee marquee;
	private int marqueeId;
	private Marquee editMarquee;
	private List<Marquee> marqueeList;
	private List<City> cities;
	private String msg;
	private SessionMap<String, Object> session;
	private int cityId;
	private List<Marquee> marquees;
	private List<Hall> hall;
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}


	public String saveUpdateMarquee()
	{	
		
		City city= statfulDao.findById(City.class, marquee.getCity().getId());
		marquee.setCity(city);
		statfulDao.saveOrUpdate(marquee);
		return SUCCESS;
	}

	public String marqueeList()
	{	
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			if(isUserAuthrized(userId)){
				marqueeList=statfulDao.findAll(Marquee.class);
				cities=statfulDao.findAll(City.class);
				return SUCCESS;
			} else {
				return Constants.UNAUTH;
			}
		}
		return ERROR;
	}

	//Get jsp page to edit marquee
	public String getEditMarqueeJsp()
	{	
		if(session.get("userId")!=null){
			editMarquee=statfulDao.findById(Marquee.class, marqueeId);
			cities=statfulDao.findAll(City.class);
			return SUCCESS;
		}
		return ERROR;
	}

	//Update edited marquee
	public String editMarquee()
	{	
		if(session.get("userId")!=null)
		{
			Marquee marqueefromDb=statfulDao.findById(Marquee.class, marquee.getId());
			if(marqueefromDb!=null){
				City city= statfulDao.findById(City.class, marquee.getCity().getId());
				marqueefromDb.setCity(city);
				marqueefromDb.setMarqueeName(marquee.getMarqueeName());
				marqueefromDb.setMarqueeEmailId(marquee.getMarqueeEmailId());
				marqueefromDb.setMarqueeContact(marquee.getMarqueeContact());
				marqueefromDb.setMarqueeAddress(marquee.getMarqueeAddress());
				statfulDao.saveOrUpdate(marqueefromDb);
			}
			return SUCCESS;
		}
		return ERROR;
	}

	public String deleteMarquee() {
		if(session.get("userId")!=null){
			Marquee marqueeToDelete=statfulDao.findById(Marquee.class, marqueeId);
			if(marqueeToDelete!=null){
				marqueeToDelete.setStatus(false);
				statfulDao.saveOrUpdate(marqueeToDelete);
				return SUCCESS;
			}
			return ERROR;
		}
		return SUCCESS;
	}

	
	public String marqueeListForUser()
	{	
		if(session.get("userId")!=null){
			marqueeList=statfulDao.findAll(Marquee.class);
			return SUCCESS;
		}
		return ERROR;
	}
	
	//TODO: get all marquess of current user
	public String userMarquees()
	{	
		int id=(int) session.get("userId");
		if(session.get("userId")!=null){
//			marqueeList=marqueeDao.findUserBookedMarquees(id);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String getMarqueesByCity(){
		marquees=marqueeDao.getMarqueesByCity(cityId);
		return SUCCESS;
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
	
	public String getHallByMarquee(){
		hall=marqueeDao.getHallByMarquee(marqueeId);
		return SUCCESS;
	}
	
/* -------------------------------- Getter Setter ------------------------------------- */

	public Marquee getMarquee() {
		return marquee;
	}

	public void setMarquee(Marquee marquee) {
		this.marquee = marquee;
	}

	public List<Marquee> getMarqueeList() {
		return marqueeList;
	}

	public void setMarqueeList(List<Marquee> marqueeList) {
		this.marqueeList = marqueeList;
	}

	public Marquee getEditMarquee() {
		return editMarquee;
	}

	public void setEditMarquee(Marquee editMarquee) {
		this.editMarquee = editMarquee;
	}

	public int getMarqueeId() {
		return marqueeId;
	}

	public void setMarqueeId(int marqueeId) {
		this.marqueeId = marqueeId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}


	public List<City> getCities() {
		return cities;
	}


	public void setCities(List<City> cities) {
		this.cities = cities;
	}


	public int getCityId() {
		return cityId;
	}


	public void setCityId(int cityId) {
		this.cityId = cityId;
	}


	public List<Marquee> getMarquees() {
		return marquees;
	}


	public void setMarquees(List<Marquee> marquees) {
		this.marquees = marquees;
	}


	public List<Hall> getHall() {
		return hall;
	}


	public void setHall(List<Hall> hall) {
		this.hall = hall;
	}

}
