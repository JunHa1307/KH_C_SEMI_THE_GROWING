package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginpage.me")
public class LoginMoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMoveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 포워딩 방식
		int userLevel = Integer.parseInt(request.getParameter("userLevel"));
		
		if(userLevel > 0) {
			
			/* request.setAttribute("userLevel", userLevel); */
			HttpSession session = request.getSession();
			session.setAttribute("userLevel", userLevel);
			
			request.getRequestDispatcher("views/member/loginPage.jsp").forward(request,response);
			
		}else { 
			request.setAttribute("errorMsg", "로그인 페이지 이동 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
