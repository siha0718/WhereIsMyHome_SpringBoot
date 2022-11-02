package com.ssafy.home.user.dto;

public class User {

	
	private String userid; // 아이디
	private String password; // 비밀번호
	private String username; // 이름
	private String address;// 주소
	private String phone; // 전화번호

	
	// 기본 생성자
	public User() {
	}


	public User(String userid, String password, String username, String address, String phone) {
		super();
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.address = address;
		this.phone = phone;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "User [userid=" + userid + ", password=" + password + ", username=" + username + ", address=" + address
				+ ", phone=" + phone + "]";
	}

	
	
	

}
