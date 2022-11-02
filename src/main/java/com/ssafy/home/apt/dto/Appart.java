package com.ssafy.home.apt.dto;

public class Appart {
	private String apartmentName;
	private int dealAmount;
	private String area;
	private int dealYear;
	private int dealMonth;
	private String lng;
	private String lat;
	public Appart() {
		// TODO Auto-generated constructor stub
	}
	public Appart(String apartmentName, int dealAmount, String area, int dealYear, int dealMonth, String lng, String lat) {
		super();
		this.apartmentName = apartmentName;
		this.dealAmount = dealAmount;
		this.area = area;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.lng = lng;
		this.lat = lat;
	}
	public String getApartmentName() {
		return apartmentName;
	}
	public void setApartmentName(String apartmentName) {
		this.apartmentName = apartmentName;
	}
	public int getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(int dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getDealYear() {
		return dealYear;
	}
	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}
	public int getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return  lng + "/" + lat ;
	}
	
}
