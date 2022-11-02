package com.ssafy.home.apt.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.apt.dto.Appart;


@Mapper
public interface AppartDAO {
	
//	public int insert(Appart person)throws SQLException;
//	public int update(Appart person)throws SQLException;
	public List<Appart> selectAll(String sido, String gugun, String dong, String year, String month)throws SQLException;
	
	public List<String> getSido() throws SQLException;
	public List<String> getGugun(String sido) throws SQLException;
	public List<String> getDong(String sido, String gugun) throws SQLException;
}











