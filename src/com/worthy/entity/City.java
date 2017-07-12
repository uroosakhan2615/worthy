package com.worthy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

	@Entity
	@Table(name = "CITY")
	public class City {

		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		@Column(name = "CITY_ID")
		private int id;
		
		@Column(name = "CITY_NAME")
		private String name;
		
		@Column(name = "CITY_DESCRIPTION")
		private String description;

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

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}
}
	
