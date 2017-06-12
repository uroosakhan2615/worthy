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
@Table(name = "MENU_ITEM")
public class MenuItem {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MENU_ITEM_ID")
	private int id;
	
	@Column(name = "MENU_ITEM_NAME")
	private String name;
	
	@Column(name = "MENU_NAME")
	private int price;

	@ManyToOne
	@JoinColumn(name="MENU_ID")
	Menu menu;
	
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
