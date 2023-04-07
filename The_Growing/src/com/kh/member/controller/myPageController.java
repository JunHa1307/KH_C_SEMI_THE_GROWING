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
 * Servlet implementation class myPageController
 */
@WebServlet("/myPage.me")
public class myPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int[] snsType = new MemberService().selectSnsType(uno);
		if(uno == 0) {
		
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("snsType0", snsType[0]);
			request.setAttribute("snsType1", snsType[1]);
			request.getRequestDispatcher("views/my/mypage.jsp").forward(request, response);
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
