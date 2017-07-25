package com.worthy.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	
	@OneToOne
	@JoinColumn(name="CITY_ID")
	private City city;
	
	@OneToMany(mappedBy="marquee")
	private List<Hall> halls;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "STATUS")
	private boolean status;
	
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public List<Hall> getHalls() {
		return halls;
	}

	public void setHalls(List<Hall> halls) {
		this.halls = halls;
	}

}
