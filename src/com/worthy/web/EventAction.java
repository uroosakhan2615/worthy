package com.worthy.web;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.entity.Event;
import com.worthy.entity.Marquee;

public class EventAction extends ActionSupport{

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private int eventId;
	private List<Marquee> marqueeList;
	private List<Event> eventList;

	public String marqueeList()
	{	
		marqueeList=statfulDao.findAll(Marquee.class);
		return SUCCESS;
	}
	
	public String eventList()
	{	
		eventList=statfulDao.findAll(Event.class);
		return SUCCESS;
	}
	
// 	Update edited marquee
//	public String editMarquee()
//	{	
//		//statfulDao = new StatefulDaoSupportImpl();
//		Marquee marqueefromDb=statfulDao.findById(Marquee.class, marquee.getId());
//		if(marqueefromDb!=null){
//			marqueefromDb.setMarqueeName(marquee.getMarqueeName());
//			marqueefromDb.setMarqueeEmailId(marquee.getMarqueeEmailId());
//			marqueefromDb.setMarqueeContact(marquee.getMarqueeContact());
//			marqueefromDb.setMarqueeAddress(marquee.getMarqueeAddress());
//			statfulDao.saveOrUpdate(marqueefromDb);
//		}
//		return SUCCESS;
//	}

//	public String deleteMarquee() {
//		  Marquee marqueeToDelete=statfulDao.findById(Marquee.class, marqueeId);
//		  if(marqueeToDelete!=null){
//			  statfulDao.delete(marqueeToDelete);
////			  setMsg("success");
//			  return SUCCESS;
//		  }
//		  return ERROR;
//		}
	
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
	
}
