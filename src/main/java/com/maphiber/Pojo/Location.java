package com.maphiber.Pojo;

public class Location {

	 public double lat;
	 public double lng;
	 String formatted_address;
	 String phone_number;
	 String mapUrl;
	 Double rating;
	 String imagess;
	 
	public Location(double lat, double lng, String formatted_address, String phone_number, String mapUrl, Double rating, String imagess) {
		super();
		this.lat = lat;
		this.lng = lng;
		this.formatted_address = formatted_address;
		this.phone_number = phone_number;
		this.mapUrl = mapUrl;
		this.rating = rating;
		this.imagess = imagess;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public String getFormatted_address() {
		return formatted_address;
	}
	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
	}
	public String phone_number() {
		return phone_number;
	}
	public void phone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getMapUrl() {
		return mapUrl;
	}
	public void setMapUrl(String mapUrl) {
		this.mapUrl = mapUrl;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getImagess() {
		return imagess;
	}
	public void setImagess(String imagess) {
		this.imagess = imagess;
	}
	 
}
