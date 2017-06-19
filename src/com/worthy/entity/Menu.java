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
	
	@Column(name = "MENU_NAME")
	private String menuName;
	
	@Column(name = "MENU_DESC")
	private String description;
	
	@Column(name = "MENU_IMAGE_NAME")
	private String imageName;
	
	@OneToMany(mappedBy="menu")
	private List<MenuItem> menuItems;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
}
