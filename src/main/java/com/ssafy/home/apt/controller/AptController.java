package com.ssafy.home.apt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssafy.home.apt.model.service.AptService;


/**
 * Servlet implementation class MainServlet
 */
@Controller("/main")
public class AptController extends HttpServlet {
	
	AptService aptService;
	
	@Autowired
	public AptController(AptService aptService) {
		this.aptService = aptService;
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action>>>" + action);
		switch (action) {
		case "showApt":
			doList(request,response);
			break;
		case "news":
			doNews(request,response);
			break;
		case "likes":
			doLikes(request,response);
			break;
		case "next":
			doList(request, response);
			break;	


		}

	}// process

	public String 

	private void doLikes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession session=request.getSession();
			User userinfo=(User)session.getAttribute("userinfo");
			List<String> likes=aptDao.likesList(userinfo);
			List<String> dongCodes=new ArrayList<>();
			
			
			for (String like: likes) {
				dongCodes.add(aptDao.convertCode(like));
			}
			request.setAttribute("likesList",dongCodes);
			request.setAttribute("likesListCodes",likes);
			
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/likes.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/main?action=error");
		}		
	}

	private void doNews(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {

			request.getRequestDispatcher("/news.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/main?action=error");
		}
		
	}

	private void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			
			String dong = request.getParameter("dong");
			
			System.out.println(request.getParameter("listSize"));
			String listSize = "10";
			
			List<Apt> list = null;			
			
			System.out.println("request.get>>>>>>"+request.getParameter("listSize"));
			if(request.getParameter("aptName")!=null)  {
				list = service.infos(dong, 100,request.getParameter("aptName"));
			}
			
			else if(request.getParameter("listSize") != null) {
				list = service.infos(dong, Integer.parseInt(request.getParameter("listSize")) + 10,"all");	
				System.out.println(Integer.parseInt(request.getParameter("listSize")) + 10);
				System.out.println(list.size());
			}
			
				
			else {
				
				list = service.infos(dong, 10,"all");
				
			}		
			
			
			request.setAttribute("list", list);
			request.setAttribute("dongCode", dong);
			request.setAttribute("dongName", aptDao.convertCode(dong));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			// error.jsp로 넘어가도록 구현할 수 있다.
			response.sendRedirect(request.getContextPath() + "/main?action=error");
		}
	}

		

}
