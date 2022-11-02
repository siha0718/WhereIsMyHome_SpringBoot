 package com.ssafy.home.user.dao;

 import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.sample.dto.User;
import com.ssafy.sample.util.DBUtil;



 public class UserDaoImpl implements UserDao{
	
	DBUtil dbutil = DBUtil.getInstance();	
	
 	private static UserDaoImpl instance = new UserDaoImpl();
	
 	private UserDaoImpl() {}
	
 	public static UserDaoImpl getInstance() {
 		return instance;
 	}

 	
 	//회원가입
	@Override
	public int insert(User user) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCnt = 0;
		
		try {
			conn = dbutil.getConnection();
			String sql = "insert into user (id, password, username, address, phone) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());		
			pstmt.setString(2, user.getPassword());		
			pstmt.setString(3, user.getUsername());		
			pstmt.setString(4, user.getAddress());		
			pstmt.setString(5, user.getPhone());		
			
			rowCnt = pstmt.executeUpdate();
			
			
		} finally {
			dbutil.close(pstmt, conn);
		}		
		
		return rowCnt;
	}

	
	//로그인
	@Override
	public User select(String id, String pw) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		
		try {
			conn = dbutil.getConnection();
			String sql = "select id, password, username, address, phone from user where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			pstmt.setString(2, pw);		
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u = new User(rs.getString("id"),
							 rs.getString("password"),
							 rs.getString("username"),
							 rs.getString("address"),
							 rs.getString("phone")
							);
			}
		} finally {
			dbutil.close(pstmt, conn);
		}		
		
		return u;
	}

	@Override
	public int update(User user) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCnt = 0;
		
		try {
			conn = dbutil.getConnection();
			String sql = "update user set username=?, address=?, phone=? where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());		
			pstmt.setString(2, user.getAddress());		
			pstmt.setString(3, user.getPhone());		
			pstmt.setString(4, user.getUserid());		
						
			rowCnt = pstmt.executeUpdate();
			
		} finally {
			dbutil.close(pstmt, conn);
		}		
		
		return rowCnt;
	}

	

 
 }