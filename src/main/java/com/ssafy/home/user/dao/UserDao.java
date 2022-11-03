package com.ssafy.home.user.dao;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.home.user.dto.User;

public interface UserDao {
	
	void regist(User user)  throws SQLException;
	User login(Map<String, String> map)  throws SQLException;
	void edit(User user)  throws SQLException;
	int findNo(User user)  throws SQLException;
	void addStar(Map<String, Integer> map)  throws SQLException;
	int delete(User user) throws SQLException;
	
}
