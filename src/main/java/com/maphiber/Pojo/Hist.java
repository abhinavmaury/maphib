package com.maphiber.Pojo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServlet;



@Entity
@Table(name="history")
public class Hist extends HttpServlet {
	

	@Id
	@Column(name="idhistory")
	@GeneratedValue(strategy=GenerationType.AUTO)
	int idhistory;
	
	@Column(name="places")
	String places;
	
	@Column(name="date")
	java.sql.Timestamp date=new java.sql.Timestamp(0);
	
	
	public Hist() {
		super();
	}
	public int getIdhistory() {
		return idhistory;
	}
	public void setIdhistory(int idhistory) {
		this.idhistory = idhistory;
	}
	public String getPlaces() {
		return places;
	}
	public void setPlaces(String places) {
		this.places = places;
	}
	public java.sql.Timestamp getDate() {
		return date;
	}
	public void setDate(java.sql.Timestamp date) {
		this.date = date;
	}

	public Hist(String places, Timestamp date) {
		super();
		this.places = places;
		this.date = date;
	}

}