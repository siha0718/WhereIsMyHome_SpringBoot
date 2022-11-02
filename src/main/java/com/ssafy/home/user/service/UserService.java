package com.ssafy.home.user.service;

import java.util.Map;

import com.ssafy.home.user.dto.User;

public interface UserService {
	
	void regist(User user)  throws Exception;
	User login(Map<String, String> map)  throws Exception;
	void edit(User user)  throws Exception;
	int findNo(User user)  throws Exception;
	void addStar(Map<String, Integer> map)  throws Exception;

}
