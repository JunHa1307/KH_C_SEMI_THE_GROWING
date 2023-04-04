package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteCookieController
 */
@WebServlet("/deleteCookie.me")
public class DeleteCookieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCookieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 저장된 쿠키 삭제
		// Map객체는 동일한 객체를 저장할 수없음 해당 key값을 가져와서 / 해당 쿠키 유지시간 0으로 만들기
		String loginUser = request.getParameter("loginUser");
		// cookieId키값으로 가진 value=userId
		
		//1. 쿠키의 key값을 이용하여 유효기간을 조정하여 삭제하기
		Cookie c = new Cookie(loginUser, ""); // 빈문자열로 userId => ""
		c.setMaxAge(0); // 동일한 이름의 key값을 가진 cookie객체를 생성하여, 유효시간을 0초로 만들어서 전달하게되면, 클라이언트의 cookie가 삭제됨
	
		response.addCookie(c);
							// index.jsp
		response.sendRedirect(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
