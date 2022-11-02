package com.ssafy.home.user.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.home.user.dto.User;
import com.ssafy.home.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	
	private final Logger logger = LoggerFactory.getLogger(UserController.class);

	private final UserService service;	
 	
	@Autowired
 	public UserController(UserService service) {
		logger.info("UserController 생성자 호출");
		this.service = service;
	}

	
	/* -------------------------- 로그인-------------------------- */
	
	@GetMapping("/login")
	public String doLogin() {
		return "login";
	}
	
	@PostMapping("/login")
	public String doLogin(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		logger.debug("map : {}", map.get("userid"));
		try {
			User user = service.login(map);
			logger.debug("UserDto : {}", user);
			if(user != null) {
				session.setAttribute("userinfo", user);
				
				Cookie cookie = new Cookie("ssafy_id", map.get("userid"));
				cookie.setPath("/board");
				if("ok".equals(map.get("saveid"))) {
					cookie.setMaxAge(60*60*24*365*40);
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
				return "user/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제 발생!!!");
			return "error/error";
		}
	}

	
	/* -------------------------- 회원가입 -------------------------- */

	@GetMapping("/regist")
	public String doRegist() { 
		return "signup";
	}
	
	@PostMapping("/regist")
	public String doRegist(User user, Model model) {
		logger.debug("User info : {}", user);
		try {
			service.regist(user);
			return "redirect:/login";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제 발생!!!");
			return "error/error";
		}
	}
	
	
	/* -------------------------- 로그아웃 -------------------------- */

	@GetMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	/* -------------------------- 회원정보 수정 -------------------------- */

	
	@GetMapping("/edit")
	public String doEdit() {		
		return "edit";
	}
	
	
	public String doEdit(User user, Model model) {
		logger.debug("수정 요청한 User info : {}", user);
		try {
			service.edit(user);
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "정보 수정 중 문제 발생!!!");
			return "error/error";
		}
	
	}
	
	
	
	/* -------------------------- 즐겨찾기 -------------------------- */

	
	@GetMapping("/star")
	public String doStar(@RequestParam("dongcode") int dongcode, HttpSession session, Model model) throws Exception {
		
		logger.debug("show favorite dongcode : {}", dongcode);
		
		User user = (User) session.getAttribute("userinfo");
		logger.debug("즐겨찾기 선택한 사용자 정보", user);
		if(user == null) {
			model.addAttribute("msg", "로그인 후 가능합니다");
		}
		else { 
			int no = service.findNo(user);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("no", no);
			map.put("dongcode", dongcode);
			service.addStar(map);
		}
		
		
		return "redirect:/";
	}
	
	
	

	
	
	
	
	
 

	
//	
//	public class SHA256 {
//
//	    public String encrypt(String text) throws NoSuchAlgorithmException {
//	        MessageDigest md = MessageDigest.getInstance("SHA-256");
//	        md.update(text.getBytes());
//
//	        return bytesToHex(md.digest());
//	    }
//
//	    private String bytesToHex(byte[] bytes) {
//	        StringBuilder builder = new StringBuilder();
//	        for (byte b : bytes) {
//	            builder.append(String.format("%02x", b));
//	        }
//	        return builder.toString();
//	    }
//
//	}
//
//	private void doRegist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException {
//		//1. 
//		String userid = request.getParameter("userid");
//		String username = request.getParameter("username");
//		String address = request.getParameter("address");
//		String phone = request.getParameter("phone");
//		
//		//2. password 검증 및 암호화
//		String pattern = "^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$";
//		String password = request.getParameter("password");
//		// 2.1 패턴 매칭실패
//		if(!password.matches(pattern)) {
//			System.out.println("Diffrent pattern");
//			response.sendRedirect("./signup.jsp");
//			return;
//		}
//
//		
//		// 비밀번호 암호화
//		SHA256 sha256 = new SHA256();
//		String cryptogram = sha256.encrypt(password);
//		
//		User user = new User(userid, cryptogram, username, address, phone);
//		//3. 모델 객체 (service, DAO) 생성, 호출
//		try {
//			int rowCnt = service.regist(user);
//			if(rowCnt == 1) {
//				String msg = "회원가입 완료";
//				request.setAttribute("msg", msg);
//				response.sendRedirect(request.getContextPath() + "/login.jsp");
//			}
//		} catch (SQLException e) {	
//			response.sendRedirect("./signup.jsp");
//			e.printStackTrace();
//			return;
//			
//		}
//		
//
// 	}
//	
 	

 }
