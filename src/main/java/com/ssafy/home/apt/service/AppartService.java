package com.ssafy.home.apt.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.home.apt.dto.Appart;


public interface AppartService {
 	 
	List<String> getSdio() throws SQLException; 
	List<String> getGugun(String sido) throws SQLException; 
	List<String> getDong(String sido, String gugun) throws SQLException; 
	List<Appart> infos(String sido, String gugun, String dong, String year, String month)throws SQLException;
}





















