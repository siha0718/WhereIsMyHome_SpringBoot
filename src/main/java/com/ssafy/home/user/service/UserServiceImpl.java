package com.ssafy.home.user.service;

import java.sql.SQLException;

import com.ssafy.sample.dto.User;
import com.ssafy.sample.model.dao.UserDao;
import com.ssafy.sample.model.dao.UserDaoImpl;

public class UserServiceImpl implements UserService {
	
	private UserDao dao = UserDaoImpl.getInstance();
	
	private static UserServiceImpl instance = new UserServiceImpl();
	
	private UserServiceImpl() {}
	
	
	public static UserServiceImpl getInstance() {
		return instance;
	}


	@Override
	public int regist(User user) throws SQLException {
		return dao.insert(user);
	}

	@Override
	public User login(String id, String pw) throws SQLException {
		return dao.select(id, pw);
	}


	@Override
	public int edit(User user) throws SQLException {
		return dao.update(user);
	}

	




}
