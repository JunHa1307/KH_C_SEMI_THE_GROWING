package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CookieCheckController
 */
@WebServlet("/firstLogin.me")
public class FirstLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		
		if(cookies.length >= 3) {
			String userId = ""; 
			String userPwd = ""; 
			int userLevel = 0;
			
			for(Cookie c : cookies) {
				if(c.getName().equals("userId")) {
					userId = c.getValue();
				}else if (c.getName().equals("userPwd")) {
					userPwd = c.getValue();
				}else if (c.getName().equals("userLevel")) {
					userLevel = Integer.parseInt(c.getValue());
				}
			}
			
			if(userLevel == 0) {
				request.getRequestDispatcher("views/member/firstPage.jsp").forward(request, response);
			}else {
				Member loginUser = new MemberService().loginMember(userId, userPwd, userLevel);
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", loginUser);
				
				response.sendRedirect(request.getContextPath()+"/mainpage.me");
			}
		}else {			
			request.getRequestDispatcher("views/member/firstPage.jsp").forward(request, response);
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
