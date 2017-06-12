package com.worthy.entity;

import java.util.List;

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
@Table(name = "MENU")
public class Menu {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MENU_ID")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="EVENT_ID")
	Event event;
	
	@Column(name = "MENU_NAME")
	private String menuName;
	
	@Column(name = "MENU_DESC")
	private String description;
	
	@OneToMany(mappedBy="menu")
	private List<MenuItem> menuItems;
	
	public String getmenuName() {
		return menuName;
	}

	public void setmenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<MenuItem> getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(List<MenuItem> menuItems) {
		this.menuItems = menuItems;
	}
}
