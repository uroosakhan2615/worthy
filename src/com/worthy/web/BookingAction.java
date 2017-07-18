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
import com.worthy.entity.Hall;
import com.worthy.entity.Marquee;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public class BookingAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private UserDAOImpl userDao = new UserDAOImpl();
	private BookingDaoImpl bookingDao= new BookingDaoImpl();
	private List<Booking> bookingsList;
	private SessionMap<String, Object> session;
	Booking booking;
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}

	public String addNewBooking()
	{	
		
		Hall hallFromDb= statfulDao.findById(Hall.class, booking.getId());
		Booking bookingNew= new Booking();
		bookingNew.setHall(hallFromDb);
		int userId=(int) session.get("userId");
		User user=statfulDao.findById(User.class, userId);
		bookingNew.setUser(user);		
		
		if(hallFromDb.isStatus()){
			statfulDao.saveOrUpdate(bookingNew);
			return SUCCESS;
		}else {
			return ERROR;
		}
	}

	public String userBookings()
	{	
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			bookingsList=bookingDao.getBookingsByUserId(userId);
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
	
	
/* -------------------------------- Getter Setter ------------------------------------- */

	public List<Booking> getBookingsList() {
		return bookingsList;
	}

	public void setBookingsList(List<Booking> bookingsList) {
		this.bookingsList = bookingsList;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

}
