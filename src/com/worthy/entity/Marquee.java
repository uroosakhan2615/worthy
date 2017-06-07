package com.worthy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MARQUEE")
public class Marquee {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MARQUEE_ID")
	private int id;
	
	@Column(name = "MARQUEE_NAME")
	private String marqueeName;
	
	@Column(name = "MARQUEE_ADDRESS")
	private String marqueeAddress;

	@Column(name = "MARQUEE_CONTACT")
	private String marqueeContact;
	
	@Column(name = "MARQUEE_EMAILId")
	private String marqueeEmailId;
	
	@Column(name = "CITY")
	private String city;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "STATUS")
	private String status;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMarqueeName() {
		return marqueeName;
	}

	public void setMarqueeName(String marqueeName) {
		this.marqueeName = marqueeName;
	}

	public String getMarqueeAddress() {
		return marqueeAddress;
	}

	public void setMarqueeAddress(String marqueeAddress) {
		this.marqueeAddress = marqueeAddress;
	}

	public String getMarqueeContact() {
		return marqueeContact;
	}

	public void setMarqueeContact(String marqueeContact) {
		this.marqueeContact = marqueeContact;
	}

	public String getMarqueeEmailId() {
		return marqueeEmailId;
	}

	public void setMarqueeEmailId(String marqueeEmailId) {
		this.marqueeEmailId = marqueeEmailId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
