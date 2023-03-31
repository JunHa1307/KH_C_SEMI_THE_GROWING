package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SnsLogin;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/mainpage.me")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		/*
		 * SnsLogin snsLoginUser =
		 * (SnsLogin)request.getSession().getAttribute("snsLoginUser");
		 */
		
		ArrayList<Class> list = new ClassService().selectClassList(loginUser.getUserNo());
		
		ArrayList<String> tableList = new ClassService().selectTableList(loginUser.getUserNo());
		
		ArrayList<String> calendarList = new ClassService().selectCalendarList(loginUser.getUserNo());
		
		request.setAttribute("list", list);
		request.setAttribute("tableList", tableList);
		request.setAttribute("calendarList", calendarList);
		
		request.getRequestDispatcher("views/member/mainPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
