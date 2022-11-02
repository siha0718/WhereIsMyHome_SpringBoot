package com.ssafy.sample.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.sample.dto.Apt;
import com.ssafy.sample.dto.User;
import com.ssafy.sample.util.DBUtil;

public class AptDAOImpl implements AptDAO {	//PersonDAO명세에 대한 구현체
	
	DBUtil dbUtil = DBUtil.getInstance();
	
	//singleton패턴을 위한 생성자 instance 만들기
	private AptDAOImpl () {}
	private static AptDAOImpl instance = new AptDAOImpl();
	
	public static AptDAOImpl getInstance() { 
		return instance;
	}
		
	
	@Override
	public List<Apt> selectAll(String dong, int row,String aptName) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Apt> aptList = new ArrayList<>();

		try {
			conn = dbUtil.getConnection();
			
			String sql = "select  apartmentName, lat, lng, max(deal.dealAmount) dealAmount,count(apartmentName) count \r\n" + 
					"from houseinfo info \r\n" + 
					"inner join housedeal deal \r\n" + 
					"on info.aptCode = deal.aptCode \r\n" + 
					"where dongCode=? \r\n" + 
					"group by apartmentName \r\n"+
					"limit ?";
				
			
			if(aptName!="all") {
				sql="select  apartmentName, lat, lng, deal.dealAmount dealAmount \r\n" + 
						"from houseinfo info \r\n" + 
						"inner join housedeal deal\r\n" + 
						"on info.aptCode = deal.aptCode \r\n" + 
						"where dongCode=? \r\n" + 
						"and info.apartmentName=? \r\n" + 
						"limit 100";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			
			if(aptName!="all") {
				pstmt.setString(1, dong);
				pstmt.setString(2, aptName);
			}else {
				pstmt.setString(1, dong);
				pstmt.setInt(2, row);
				
			}
			rs = pstmt.executeQuery();
			
			if(aptName=="all") {
				
				while(rs.next()) {			
					Apt apt = new Apt(	rs.getString("apartmentName"), 
							rs.getString("lat"), 
							rs.getString("lng"), 
							rs.getString("dealAmount"),
							rs.getInt("count")
							);
					aptList.add(apt);
					
				}//end while
			}
			else {
				while(rs.next()) {			
					Apt apt = new Apt(	rs.getString("apartmentName"), 
							rs.getString("lat"), 
							rs.getString("lng"), 
							rs.getString("dealAmount"),
							0
							);
					aptList.add(apt);
					
				}//end while
			}
		
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}

		return aptList;
	}
public String convertCode(String dongCode) throws SQLException {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String returnValue="";
	try {
		conn = dbUtil.getConnection();
		String sql="select sidoName,gugunName,dongName from dongcode where dongcode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dongCode);
		rs = pstmt.executeQuery();
		rs.next();
		returnValue+=rs.getString("sidoName");
		returnValue+=rs.getString("gugunName");
		returnValue+=rs.getString("dongName");
		
	} finally {
		dbUtil.close(rs, pstmt, conn);
	}
	return returnValue;
}
	
public List<String> likesList(User user) throws SQLException {
		List<String> likesList=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dbUtil.getConnection();
			String meSql="select no from user where id=?";
			pstmt = conn.prepareStatement(meSql);
			pstmt.setString(1, user.getUserid());
			rs = pstmt.executeQuery();
			rs.next();
			int no=rs.getInt("no");
			
			String sql = "select distinct dongcode\r\n" + 
					"from `user` A \r\n" + 
					"inner join likes B\r\n" + 
					"on A.no = B.userId\r\n" + 
					"where A.no = ?;\r\n"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs= pstmt.executeQuery();
			while(rs.next()) {			
				likesList.add(rs.getString("dongcode"));
			}//end while
		
			
			
			
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return likesList;
	}

	@Override
	public int insert(Apt person) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int update(Apt person) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int delete(int no) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
