package com.ssafy.home.apt.controller;

import java.sql.SQLException;
import java.util.List;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.home.apt.dto.Appart;
import com.ssafy.home.apt.service.AppartService;
import com.ssafy.home.user.controller.UserController;



@RequestMapping("/apt")
@Controller
public class AppartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final Logger logger = LoggerFactory.getLogger(UserController.class);

	private AppartService service;	
	
	@Autowired
	public AppartController(AppartService service) {
		logger.info("appart 생성자 호출");
		this.service = service;
	}
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/getInfos")
	public String getInofs(@RequestParam("sido") String sido, @RequestParam("gugun") String gugun, @RequestParam("dong") String dong,
			@RequestParam("year") String year, @RequestParam("month") String month, HttpServletRequest request) throws SQLException {
		
		List<Appart> appartList = service.infos(sido, gugun, dong, year, month);
		System.out.println(appartList);
		request.setAttribute("appartList", appartList);
		request.setAttribute("sido", request.getParameter("sido"));
		request.setAttribute("gugun", request.getParameter("gugun"));
		request.setAttribute("dong", request.getParameter("dong"));
		return "list";
	}
	@GetMapping("/getSido")
	public ResponseEntity<?> getSido() throws SQLException {
		List<String> sidoList = service.getSdio();
		return new ResponseEntity<List<String>>(sidoList, HttpStatus.OK);
	}
	@GetMapping("/getGugun")
	public ResponseEntity<?> getGugun(@RequestParam("sido") String sido) throws SQLException{
		List<String> gugunList = service.getGugun(sido);
		return new ResponseEntity<List<String>>(gugunList, HttpStatus.OK);
	}
	
	@GetMapping("/getDong")
	public ResponseEntity<?> getDong(@RequestParam("sido") String sido, @RequestParam("gugun") String gugun) throws SQLException{
		List<String> dongList = service.getDong(sido, gugun);
		return new ResponseEntity<List<String>>(dongList, HttpStatus.OK);
	}
	
	
}















