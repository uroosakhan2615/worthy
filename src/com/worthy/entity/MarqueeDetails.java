package com.worthy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "MARQUEEDETAILS")
public class MarqueeDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MARQUEE_DETAILS_ID")
	private int id;
	
	@Column(name = "MARQUEE_NAME")
	private String Marquee_name;
	
	@Column(name = "CAPICITY")
	private String capicity;
	
	@Column(name = "CITY")
	private String city;
	
	
	@ManyToOne
	@JoinColumn(name="MARQUEE_ID")
	Marquee marquee;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCapicity() {
		return capicity;
	}

	public void setCapicity(String capicity) {
		this.capicity = capicity;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMarquee_name() {
		return Marquee_name;
	}

	public void setMarquee_name(String marquee_name) {
		Marquee_name = marquee_name;
	}
	
	 
	
}
