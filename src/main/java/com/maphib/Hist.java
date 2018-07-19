package com.mapshib;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServlet;
@Entity
@Table(name="history")
//@WebServlet("/Hist")
public class Hist extends HttpServlet {
	
	@Id
	@Column(name="idhistory")
	private int idhistory;
	
	@Column(name="places")
	private String places;

	public Hist(int idhistory, String places) {
		super();
		this.idhistory = idhistory;
		this.places = places;
	}

	public Hist() {
        super();
    }
	

	public int getIdhistory() {
		return idhistory;
	}

	public void setIdhistory(int idhistory) {
		this.idhistory = idhistory;
	}

	public String getPlace() {
		return places;
	}

	public void setPlace(String places) {
		this.places = places;
	}

	@Override
	public String toString() {
		return "History [idhistory=" + idhistory + ", place=" + places + "]";
	}

}