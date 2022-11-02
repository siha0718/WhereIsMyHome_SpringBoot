package com.ssafy.home.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.home.user.dao.UserDao;
import com.ssafy.home.user.dto.User;

@Service
public class UserServiceImpl implements UserService {
	
	private UserDao dao;

	@Autowired
	public UserServiceImpl(UserDao dao) {
		this.dao = dao;
	}

	@Override
	public void regist(User user) throws Exception {
		dao.regist(user);
	}

	@Override
	public User login(Map<String, String> map) throws Exception {
		return dao.login(map);
	}

	@Override
	public void edit(User user) throws Exception {
		dao.edit(user);		
	}

	@Override
	public int findNo(User user) throws Exception {
		return dao.findNo(user);
	}

	@Override
	public void addStar(Map<String, Integer> map) throws Exception {
		dao.addStar(map);
	}
	
	
	
	


}
