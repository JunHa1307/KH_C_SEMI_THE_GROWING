package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/updatePassword.me")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		
		int result = new MemberService().updatePassword(loginUser.getUserNo(),oldPwd,newPwd);
		
		if(result > 0) {
			loginUser = new MemberService().loginMember(loginUser.getUserId(), newPwd, loginUser.getUserLevel());
			
			Cookie c1 = new Cookie("userId",loginUser.getUserId());
			Cookie c2 = new Cookie("userPwd",loginUser.getUserPwd());
			Cookie c3 = new Cookie("userLevel",loginUser.getUserLevel()+"");
			
			c1.setMaxAge(24*60*60);
			c2.setMaxAge(24*60*60);
			c3.setMaxAge(24*60*60);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
			
			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", "비밀번호 수정 성공");
			response.sendRedirect(request.getContextPath()+"/myPage.me");
		}else {
			request.setAttribute("errorMsg", "수정 실패.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
