package com.ssafy.sample.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.sample.dto.Apt;

public interface AptDAO {
	
	public int insert(Apt person) throws SQLException;
	public int update(Apt person) throws SQLException;
	public int delete(int no) throws SQLException;
	

	public List<Apt> selectAll(String dong, int row, String aptName) throws SQLException;

	
	
}
