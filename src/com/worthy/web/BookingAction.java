package com.worthy.web;

import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.BookingDaoImpl;
import com.worthy.dao.MarqueeDaoImpl;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Booking;
import com.worthy.entity.Marquee;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public class BookingAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private UserDAOImpl userDao = new UserDAOImpl();
	private BookingDaoImpl bookingDao= new BookingDaoImpl();
//	private MarqueeDaoImpl marqueeDao = new MarqueeDaoImpl();
//	private Marquee marquee;
	
	private List<Booking> bookingsList;
	
	private int marqueeId;
	private Marquee editMarquee;
	private List<Marquee> marqueeList;
	private String msg;
	private SessionMap<String, Object> session;
	
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}

//	public String saveUpdateMarquee()
//	{	
//		statfulDao.saveOrUpdate(marquee);
//		return SUCCESS;
//	}

//	public String bookingList()
//	{	
//		if(session.get("userId")!=null){
//			int userId=(int) session.get("userId");
//			if(isUserAuthrized(userId)){
//				bookingsList=statfulDao.findAll(Marquee.class);
//				return SUCCESS;
//			} else {
//				return Constants.UNAUTH;
//			}
//		}
//		return ERROR;
//	}

	public String userBookings()
	{	
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			bookingsList=bookingDao.getBookingsByUserId(userId);
			return SUCCESS;
		}
		return ERROR;
	}
	
	//Get jsp page to edit marquee
	public String getEditMarqueeJsp()
	{	
		if(session.get("userId")!=null){
			editMarquee=statfulDao.findById(Marquee.class, marqueeId);
			return SUCCESS;
		}
		return ERROR;
	}

	//Update edited marquee
//	public String editMarquee()
//	{	
//		if(session.get("userId")!=null)
//		{
//			Marquee marqueefromDb=statfulDao.findById(Marquee.class, marquee.getId());
//			if(marqueefromDb!=null){
//				marqueefromDb.setMarqueeName(marquee.getMarqueeName());
//				marqueefromDb.setMarqueeEmailId(marquee.getMarqueeEmailId());
//				marqueefromDb.setMarqueeContact(marquee.getMarqueeContact());
//				marqueefromDb.setMarqueeAddress(marquee.getMarqueeAddress());
//				statfulDao.saveOrUpdate(marqueefromDb);
//			}
//			return SUCCESS;
//		}
//		return ERROR;
//	}

//	public String deleteMarquee() {
//		if(session.get("userId")!=null){
//			Marquee marqueeToDelete=statfulDao.findById(Marquee.class, marqueeId);
//			if(marqueeToDelete!=null){
//				marqueeToDelete.setStatus(false);
//				statfulDao.saveOrUpdate(marqueeToDelete);
//				return SUCCESS;
//			}
//			return ERROR;
//		}
//		return SUCCESS;
//	}

	
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
	
	
/* -------------------------------- Getter Setter ------------------------------------- */


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

	public List<Booking> getBookingsList() {
		return bookingsList;
	}

	public void setBookingsList(List<Booking> bookingsList) {
		this.bookingsList = bookingsList;
	}

}
