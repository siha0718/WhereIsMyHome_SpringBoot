package com.ssafy.home.user.service;

import java.sql.SQLException;

import com.ssafy.sample.dto.User;

public interface UserService {
	
	public int regist(User user) throws SQLException;
	public User login(String id, String pw) throws SQLException;
	public int edit(User user) throws SQLException;

}
