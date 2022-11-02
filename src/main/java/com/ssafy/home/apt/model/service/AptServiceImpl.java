package com.ssafy.sample.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.sample.dto.Apt;
import com.ssafy.sample.model.dao.AptDAO;
import com.ssafy.sample.model.dao.AptDAOImpl;

public class AptServiceImpl implements AptService {

	//나는 DAO객체가 필요해! 
	AptDAO dao;
	
	//singleton
	private AptServiceImpl() {
		dao = AptDAOImpl.getInstance();
	}

	private static AptServiceImpl instance = new AptServiceImpl();
	
	public static AptServiceImpl getinstance() {
		return instance;
	}	
		
	
	
	@Override
	public int regist(Apt person) throws SQLException {
		return dao.insert(person);
	}

	@Override
	public int modify(Apt person) throws SQLException {
		return dao.update(person);
	}

	@Override
	public int remove(int no) throws SQLException {
		return dao.delete(no);
	}

	@Override
	public Apt info(int no) throws SQLException {
//		return dao.select(no);
		return null;
	}

	@Override
	public List<Apt> infos(String dong, int row,String aptName) throws SQLException {
		return dao.selectAll(dong, row,aptName);
//		return null;
	}






}
