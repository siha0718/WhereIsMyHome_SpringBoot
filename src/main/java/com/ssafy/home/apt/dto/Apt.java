package com.ssafy.sample.dto;

public class Apt { // 폼안의 관련있는 데이터를 묶어주는 역할, DB테이블의 레코드(row)한개를 자바 객체로 표현

	private String aptName;
	private String lat;
	private String lng;
	private String dealAmount;
	private int count;


	public Apt() {
		// TODO Auto-generated constructor stub
	}


	public Apt(String aptName, String lat, String lng, String dealAmount,int count) {
		super();
		this.aptName = aptName;
		this.lat = lat;
		this.lng = lng;
		this.dealAmount = dealAmount;
		this.count= count;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getAptName() {
		return aptName;
	}


	public void setAptName(String aptName) {
		this.aptName = aptName;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}


	public String getDealAmount() {
		return dealAmount;
	}


	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}



	
	
	
	
}
