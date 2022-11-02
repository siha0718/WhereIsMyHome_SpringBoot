package com.ssafy.home.user.dao;

import java.sql.SQLException;

import com.ssafy.sample.dto.User;


public interface UserDao {
	
	public int insert(User user) throws SQLException;
	public User select(String id, String pw) throws SQLException;
	public int update(User user) throws SQLException;
	
}
