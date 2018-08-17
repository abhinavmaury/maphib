package com.maphiber.Pojo;

import java.util.Map;



public class Poi {

       
	private Map<String, Location> name;
    
    public Poi() {
        super();
        
    }
	public Map<String, Location> getName() {
		return name;
	}
	public void setName(Map<String, Location> places) {
		this.name = places;
	}
  
}