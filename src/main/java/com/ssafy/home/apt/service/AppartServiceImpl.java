package com.ssafy.home.apt.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.home.apt.dao.AppartDAO;
import com.ssafy.home.apt.dto.Appart;

@Service
public class AppartServiceImpl implements AppartService{

	private AppartDAO dao;
	
	@Autowired
	private AppartServiceImpl(AppartDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<String> getSdio() throws SQLException {
		return dao.getSido();
	}

	@Override
	public List<String> getGugun(String sido) throws SQLException {
		return dao.getGugun(sido);
	}

	@Override
	public List<String> getDong(String sido, String gugun) throws SQLException {
		return dao.getDong(sido, gugun);
	}

	@Override
	public List<Appart> infos(String sido, String gugun, String dong, String year, String month) throws SQLException {
		return dao.selectAll(sido, gugun, dong, year, month);
	}






}
