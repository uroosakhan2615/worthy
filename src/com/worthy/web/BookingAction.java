package com.worthy.web;

import java.util.List;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.BookingDaoImpl;
import com.worthy.dao.HallDaoImpl;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Booking;
import com.worthy.entity.City;
import com.worthy.entity.Hall;
import com.worthy.entity.Marquee;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public class BookingAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -6659925652584240539L;

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private UserDAOImpl userDao = new UserDAOImpl();
	private BookingDaoImpl bookingDao= new BookingDaoImpl();
	private HallDaoImpl hallDao= new HallDaoImpl();
	private List<Booking> bookingsList;
	private SessionMap<String, Object> session;
	Booking booking;
	private List<Hall> halls;
	private List<City> cities;
	private Hall hall;
	private int hallId;
	private int bookingId;
	private Booking editBooking;
	
	@Override
	public void setSession(Map<String, Object> map) {
		session = (SessionMap<String, Object>) map;
	}
	
	public String bookings(){
		
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			if(isUserAuthrized(userId)){
				bookingsList= statfulDao.findAll(Booking.class);
				cities=statfulDao.findAll(City.class);
				halls= statfulDao.findAll(Hall.class);
				return SUCCESS;
			} else {
				return Constants.UNAUTH;
			}
		}
		return ERROR;
	}
	
	public String addNewBooking()
	{	
		if(session.get("userId")!=null){
			int userId=(int) session.get("userId");
			if(isUserAuthrized(userId)){
				Hall hallFromDb= statfulDao.findById(Hall.class, hall.getId());
				User user=statfulDao.findById(User.class, userId);
				
				booking.setUser(user);		
				int noOfDays=booking.getToDate().getDate()-booking.getFromDate().getDate();
				if(noOfDays>1){
					int rent=noOfDays*hallFromDb.getRent();
					booking.setRent(rent);
				}else {
					booking.setRent(hallFromDb.getRent());
				}
				booking.setHall(hallFromDb);
				hallFromDb.setStatus(false);
				statfulDao.save(booking);
				return SUCCESS;
			}
			else {
				return Constants.UNAUTH;
			}
		}
		return ERROR;
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
	
	//Get only active halls
	public String getHallById() {
		hall = hallDao.getActiveHall(hallId);
        return SUCCESS;
    }
	
	
	public String getEditBookingJsp()
	{	
		if(session.get("userId")!=null){
			editBooking=statfulDao.findById(Booking.class, bookingId);
//			cities=statfulDao.findAll(City.class);
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

	public List<Hall> getHalls() {
		return halls;
	}

	public void setHalls(List<Hall> halls) {
		this.halls = halls;
	}

	public List<City> getCities() {
		return cities;
	}

	public void setCities(List<City> cities) {
		this.cities = cities;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Booking getEditBooking() {
		return editBooking;
	}

	public void setEditBooking(Booking editBooking) {
		this.editBooking = editBooking;
	}

	public SessionMap<String, Object> getSession() {
		return session;
	}

}
