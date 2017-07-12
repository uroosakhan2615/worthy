package com.worthy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BOOKING")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "BOOKING_ID")
	private int id;
	
	@OneToOne
	@JoinColumn(name="HALL_ID")
	Hall hall;
	
	@OneToOne
	@JoinColumn(name="USER_ID")
	User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
