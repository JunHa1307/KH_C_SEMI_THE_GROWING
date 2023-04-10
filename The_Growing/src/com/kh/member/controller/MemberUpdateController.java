package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
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
		String userId = request.getParameter("id");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		Member m = new Member();
		m.setUserNo(loginUser.getUserNo());
		m.setUserId(userId);
		m.setUserName(userName);
		m.setPhone(phone);
		m.setAddress(address);
		
		int result = new MemberService().updateMember(m);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다");
			loginUser = new MemberService().loginMember(userId, loginUser.getUserPwd(), loginUser.getUserLevel());
			request.getSession().setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath()+"/myPage.me");
		}else {
			request.setAttribute("errorMsg", "회원정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
