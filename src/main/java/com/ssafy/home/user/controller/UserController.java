 package com.ssafy.home.user.controller;

 import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.sample.dto.User;
import com.ssafy.sample.model.service.UserService;
import com.ssafy.sample.model.service.UserServiceImpl;
import com.ssafy.sample.util.DBUtil;


 @WebServlet("/user")
 public class UserController extends HttpServlet {

 	private static final long serialVersionUID = 1L;

 	// Mybatis 연동 DB
 	private UserService service = UserServiceImpl.getInstance();

 	
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		process(request, response);
 	}

 	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		// post 요청 시 한글 파라미터의 처리를 위해 encoding을 처리한다.
 		request.setCharacterEncoding("utf-8");
 		process(request, response);
 	}

 	
 	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String action = request.getParameter("action");
 		System.out.println("action>>>"+ action);
 	      
 	      try {
 			if(action==null) {
 				  //==> 첫페이지 이동
 				  response.sendRedirect(request.getContextPath());
 			  }else if(action.equals("regist")) {//DB입력 요청
 				  doRegist(request, response);
 			  }else if(action.equals("form")) {//입력폼 요청
 				  request.getRequestDispatcher("/signup.jsp").forward(request, response);
 			  }else if(action.equals("login")) {//DB입력 요청
 				  doLogin(request, response);
 			  }else if(action.equals("logout")) {//DB목록 요청
 				  doLogout(request, response);
 			  }else if(action.equals("edit")){
 				  doEdit(request, response);
 			  }else if(action.equals("star")){
 				 doStar(request, response);
 			  }
 		} catch (Exception e) {
 			request.getRequestDispatcher("/error/error.jsp").forward(request, response);
 			e.printStackTrace();
 		}
 			
 	}

 

	private void doStar(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("REHH");
		System.out.println(request.getParameter("dongCode"));
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("userinfo");
		if(user==null) {
			return;
		}else {
			DBUtil dbUtil = DBUtil.getInstance();
			System.out.println("HHH");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			conn = dbUtil.getConnection();
			String sql="select no from user where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			rs = pstmt.executeQuery();
			rs.next();
			int no=rs.getInt("no");
			
			sql="insert into likes values (?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, request.getParameter("dongCode"));
			pstmt.executeUpdate();
			dbUtil.close(rs, pstmt, conn);
//			insert into likes values (1, 1111017200)
		}
	}
	
	public class SHA256 {

	    public String encrypt(String text) throws NoSuchAlgorithmException {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(text.getBytes());

	        return bytesToHex(md.digest());
	    }

	    private String bytesToHex(byte[] bytes) {
	        StringBuilder builder = new StringBuilder();
	        for (byte b : bytes) {
	            builder.append(String.format("%02x", b));
	        }
	        return builder.toString();
	    }

	}

	private void doRegist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException {
		//1. 
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		//2. password 검증 및 암호화
		String pattern = "^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$";
		String password = request.getParameter("password");
		// 2.1 패턴 매칭실패
		if(!password.matches(pattern)) {
			System.out.println("Diffrent pattern");
			response.sendRedirect("./signup.jsp");
			return;
		}

		
		// 비밀번호 암호화
		SHA256 sha256 = new SHA256();
		String cryptogram = sha256.encrypt(password);
		
		User user = new User(userid, cryptogram, username, address, phone);
		//3. 모델 객체 (service, DAO) 생성, 호출
		try {
			int rowCnt = service.regist(user);
			if(rowCnt == 1) {
				String msg = "회원가입 완료";
				request.setAttribute("msg", msg);
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		} catch (SQLException e) {	
			response.sendRedirect("./signup.jsp");
			e.printStackTrace();
			return;
			
		}
		

 	}
	
 	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		SHA256 sha256 = new SHA256();
		String cryptogram = sha256.encrypt(password);
		
		User userinfo = service.login(id, cryptogram);
		
		
		if(userinfo != null) {//로그인이 잘 되었다면
			//로그인 성공 시 세션을 사용하여 브라우저에서 계속 유지 ==> 세션 로그인
			HttpSession session = request.getSession();
			//4.
			session.setAttribute("userinfo", userinfo);
			
			request.setAttribute("msg", "로그인 성공!");
				
			
		}else {//로그인 실패
			request.setAttribute("msg", "로그인 실패!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);			
		}
		
		//5.
		response.sendRedirect("./index.jsp");	//첫페이지로감
		
	}		
	

	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		request.getSession().invalidate();		
		response.sendRedirect(request.getContextPath());		
	}
	
	
	
	private void doEdit(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("userinfo");
		
		String id = user.getUserid();		
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		User u = new User(id, password, username, address, phone);
		
		
		int rowCnt = service.edit(u);
		
		
		if(rowCnt == 1) {
			String msg = "정보 수정 완료";
			request.setAttribute("msg", "등록완료");
			session.setAttribute("userinfo", u);
//			request.getRequestDispatcher("/note/listNote.jsp").forward(request, response);
			response.sendRedirect("./index.jsp");
			return;
				
			
		}else {//로그인 실패
			request.setAttribute("msg", "수정 실패");
			request.getRequestDispatcher("/error/error.jsp").forward(request, response);		
		}
		
		//5.
		response.sendRedirect("./index.jsp");	//첫페이지로감
	}





 }
