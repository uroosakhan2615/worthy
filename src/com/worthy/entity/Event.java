package com.worthy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EVENT")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "EVENT_ID")
	private int id;
	
	@Column(name = "EVENT_NAME")
	private String eventName;
	
	@Column(name = "EVENT_STATUS")
	private Boolean status;
	
	@Column(name = "EVENT_DESCRIPTION")
	private String description;
	
	@Column(name = "START_DATE")
	private Date startDate;
	
	@Column(name = "END_DATE")
	private Date endDate;
	
	@ManyToOne
	@JoinColumn(name="USER_ID")
	User user;
	
	@ManyToOne
	@JoinColumn(name="MARQUEE_ID")
	Marquee marquee;
	
	@ManyToOne
	@JoinColumn(name="MENU_ID")
	Menu menu;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public Marquee getMarquee() {
		return marquee;
	}

	public void setMarquee(Marquee marquee) {
		this.marquee = marquee;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	
}
