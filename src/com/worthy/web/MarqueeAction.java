package com.worthy.web;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.entity.Marquee;

public class MarqueeAction extends ActionSupport{

	private static final long serialVersionUID = -6659925652584240539L;

	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	
	private Marquee marquee;
	private int marqueeId;
	private Marquee editMarquee;
	private List<Marquee> marqueeList;
	private String msg;
	/**
	 * To save or update Marquee.
	 * @return String
	 */
	public String saveUpdateMarquee()
	{	
		statfulDao.saveOrUpdate(marquee);
		return SUCCESS;
	}
	
	public String marqueeList()
	{	
		marqueeList=statfulDao.findAll(Marquee.class);
		return SUCCESS;
	}
	
	//Get jsp page to edit marquee
	public String getEditMarqueeJsp()
	{	
		editMarquee=statfulDao.findById(Marquee.class, marqueeId);
		return SUCCESS;
	}
	
	//Update edited marquee
	public String editMarquee()
	{	
		//statfulDao = new StatefulDaoSupportImpl();
		Marquee marqueefromDb=statfulDao.findById(Marquee.class, marquee.getId());
		if(marqueefromDb!=null){
			marqueefromDb.setMarqueeName(marquee.getMarqueeName());
			marqueefromDb.setMarqueeEmailId(marquee.getMarqueeEmailId());
			marqueefromDb.setMarqueeContact(marquee.getMarqueeContact());
			marqueefromDb.setMarqueeAddress(marquee.getMarqueeAddress());
			statfulDao.saveOrUpdate(marqueefromDb);
		}
		return SUCCESS;
	}
	
	public String deleteMarquee() {
		  Marquee marqueeToDelete=statfulDao.findById(Marquee.class, marqueeId);
		  if(marqueeToDelete!=null){
			  statfulDao.delete(marqueeToDelete);
//			  setMsg("success");
			  return SUCCESS;
		  }
		  return ERROR;
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
	
}
