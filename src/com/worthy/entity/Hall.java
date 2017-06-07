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
@Table(name = "HALL")
public class Hall {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "HALL_ID")
	private int id;
	
	@Column(name = "HALL_NAME")
	private String name;
	
	@Column(name = "HALL_CAPACITY")
	private int capacity;
	
	@Column(name = "HALL_RENT")
	private int rent;
	
	@Column(name = "STATUS")
	private boolean status;
	
	@ManyToOne
	@JoinColumn(name="MARQUEE_ID")
	Marquee marquee;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Marquee getMarquee() {
		return marquee;
	}

	public void setMarquee(Marquee marquee) {
		this.marquee = marquee;
	}
	
}
