package com.kh.member.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. 사용자가 전달한 데이터 변수화
		String userId = request.getParameter("userId");
		
		// 2. DB에 현재 전달된 데이터가 존재한는지 확인
		int result = new MemberService().idCheck(userId);
		
		// 3. 중복된 아이디가 존재하는 케이스 , 존재하지 않는 케이스 별로 데이터 전달
		// 어떤식으로 데이터전달하고 프론트페이지안에서 사용자가 사용가능한지아닌지 직접기술
		
		// 비동기요청에서는 getWriter()객체와 print()메서드 사용하는것을 알아야함
		response.getWriter().print(result);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
