package com.ssafy.home.user.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		return "user/login";
	}
	
	@PostMapping("/login")
	public String doLogin(@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd, 
			@RequestParam(value="remember", required=false) String rememberid, Model model,HttpServletRequest request, HttpServletResponse response ,HttpSession session) {
//		logger.debug("map : {}", map.get(userid));
		
		System.out.println(rememberid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userId);
		map.put("password",userPwd);
		try {
			User user = service.login(map);
			logger.debug("UserDto : {}", user);
			if(user != null) {
				session.setAttribute("userinfo", user);
				
				if("ok".equals(rememberid)) {
					Cookie cookie = new Cookie("rememberid", userId);
					cookie.setMaxAge(60*60*24);
					cookie.setPath(request.getContextPath());
					response.addCookie(cookie);

				} else { //쿠키삭제
					Cookie[] cookies = request.getCookies();
					if(cookies != null) {
						for(Cookie cookie : cookies) {
							if(cookie.getName().equals("rememberid")) {
								cookie.setMaxAge(0);
								cookie.setPath(request.getContextPath());
								response.addCookie(cookie);
								break;
							}
						}
					}
				}
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
		return "user/regist";
	}
	
	@PostMapping("/regist")
	public String doRegist(User user, Model model) {
		logger.debug("User info : {}", user);
		try {
			service.regist(user);
			return "redirect:/user/login";
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
		return "user/edit";
	}
	
	@PostMapping("/edit")
	public String doEdit(User user, RedirectAttributes rda, HttpSession session) {
		logger.debug("수정 요청한 User info : {}", user);
		System.out.println(user + "@@@@@@@@@@@@@@@@@@@");
		
		try {
			service.edit(user);
			session.setAttribute("userinfo", user);
			rda.addFlashAttribute("msg", "수정 완료");
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			rda.addFlashAttribute("msg", "수정 중 문제발생");
			return "error/error";
		}
	
	}
	
	
	
	
/* -------------------------- 회원정보 삭제 -------------------------- */

	
	@GetMapping("/delete")
	public String doDelete(HttpSession session, RedirectAttributes rda) throws Exception {
		User user = (User) session.getAttribute("userinfo");
		int res = service.delete(user);
		session.invalidate();
		System.out.println("res>>>" + res);
		if(res != 1) {
		
			rda.addFlashAttribute("msg", "삭제 실패");
		
		}
		else if(res == 1){
			System.out.println("들어왔음");
			rda.addFlashAttribute("msg", "삭제 성공");
		}
		
		return "redirect:/";
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
