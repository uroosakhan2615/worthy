package com.worthy.entity;

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
	
	@Column(name = "STATUS")
	private String status;
	
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
}
