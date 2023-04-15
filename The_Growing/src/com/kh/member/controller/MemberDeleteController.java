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
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd =((Member)request.getSession().getAttribute("loginUser")).getUserPwd();
	
		int result = new MemberService().deleteMember(userId,userPwd);
		
			if(result > 0) { 
				request.getSession().setAttribute("alertMsg","성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다. ");
			 
				request.getSession().removeAttribute("loginUser");
			 
				
				Cookie c1 = new Cookie("userId", "");
				Cookie c2 = new Cookie("userPwd", "");
				Cookie c3 = new Cookie("userLevel", "");
				c1.setMaxAge(0);
				c2.setMaxAge(0);
				c3.setMaxAge(0);
				response.addCookie(c1);
				response.addCookie(c2);
				response.addCookie(c3);
				
				response.sendRedirect(request.getContextPath());
			 
			 
			} else{ // 실패시 -> 에러페이지 포워딩 or 안내문구 전송
				request.setAttribute("alertMsg",  "회원 탈퇴에 실패했습니다");
				response.sendRedirect(request.getContextPath()+"/infor.bo");
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
