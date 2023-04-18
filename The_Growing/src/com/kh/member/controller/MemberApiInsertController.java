package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SnsLogin;

/**
 * Servlet implementation class MemberApiInsertController
 */
@WebServlet("/apinsert.me")
public class MemberApiInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberApiInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1) 인코딩작업
		request.setCharacterEncoding("UTF-8");

		// 2) 요청시 전달값을 뽑아서 변수 , 객체에 기록해줄것
		String snsId = request.getParameter("snsId");// 필수값
		String snsName = request.getParameter("snsName");// 필수값
		String snsType = request.getParameter("snsType"); // kakao 1, naver 2, google 3
		String filePath = request.getParameter("filePath");
		int userLevel = (int) request.getSession().getAttribute("userLevel");

		// 전달받은 파라미터를 가지고 Member클래스로 만들어주기
		Member loginUser = new Member(snsId, snsName, userLevel);
		SnsLogin snsLoginUser = new SnsLogin(snsId, snsName, snsType, filePath);

		int result2 = new MemberService().idNlevelCheck(snsId, userLevel);
		/* int result2 = new MemberService().idCheck(snsId); */

		// DB에 같은 snsId와 같은 userLevel 소유시 회원가입이 아닌 로그인 컨트롤(같은아이디 다른 레벨시 회원가입 가능하도록 작업)

		if (result2 == 0 || result2 < 0) {
			int result = new MemberService().insertMemberApi(loginUser, snsLoginUser);

			if (result > 0) { // 회원 가입 성공
				loginUser = new MemberService().loginMember(snsId, "", userLevel);
				request.getSession().setAttribute("loginUser", loginUser);
				request.getSession().setAttribute("snsLoginUser", snsLoginUser);

				response.sendRedirect(request.getContextPath() + "/mainpage.me");

			} else { // 회원 가입 실패
				request.setAttribute("errorMsg", "회원가입에 실패했습니다");

				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			/* loginUser에 setUserNo userNo가져오기 */
			int userNo = new MemberService().selectUserNo(snsId, userLevel);
			loginUser = new MemberService().snsLoginMember(userNo, snsId, userLevel);

			if (loginUser == null) {
				request.setAttribute("errorMsg", "로그인에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			} else {
				request.getSession().setAttribute("loginUser", loginUser);
				request.getSession().setAttribute("snsLoginUser", snsLoginUser);
				request.getSession().setAttribute("alertMsg", "로그인에 성공함ㅎㅎ");

				response.sendRedirect(request.getContextPath() + "/mainpage.me");
			}
		}

		/*
		 * try { if (result2 > 0) { loginUser에 setUserNo userNo가져오기 int userNo = new
		 * MemberService().selectUserNo(snsId, userLevel); loginUser = new
		 * MemberService().snsLoginMember(userNo, snsId, userLevel);
		 * 
		 * if (loginUser == null) { request.setAttribute("errorMsg", "로그인에 실패했습니다.");
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("views/common/errorPage.jsp");
		 * view.forward(request, response); } else {
		 * System.out.println(loginUser.toString());
		 * request.getSession().setAttribute("loginUser", loginUser);
		 * request.getSession().setAttribute("snsLoginUser", snsLoginUser);
		 * request.getSession().setAttribute("alertMsg", "로그인에 성공함ㅎㅎ");
		 * 
		 * response.sendRedirect(request.getContextPath() + "/mainpage.me"); } } } catch
		 * (NullPointerException e) { int result = new
		 * MemberService().insertMemberApi(loginUser, snsLoginUser);
		 * 
		 * if (result > 0) { // 회원 가입 성공 request.getSession().setAttribute("loginUser",
		 * loginUser); request.getSession().setAttribute("snsLoginUser", snsLoginUser);
		 * 
		 * response.sendRedirect(request.getContextPath() + "/mainpage.me");
		 * 
		 * } else { // 회원 가입 실패 request.setAttribute("errorMsg", "회원가입에 실패했습니다");
		 * 
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); }
		 * 
		 * }
		 */

		/*
		 * if(result2 < 0) {
		 * 
		 * int result = new MemberService().insertMemberApi(loginUser, snsLoginUser);
		 * 
		 * if(result > 0) { // 회원 가입 성공 request.getSession().setAttribute("loginUser",
		 * loginUser); request.getSession().setAttribute("snsLoginUser", snsLoginUser);
		 * 
		 * 
		 * response.sendRedirect(request.getContextPath()+"/mainpage.me");
		 * 
		 * }else { // 회원 가입 실패 request.setAttribute("errorMsg", "회원가입에 실패했습니다");
		 * 
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); } }else {
		 * 
		 * loginUser = new MemberService().snsLoginMember(snsId, userLevel);
		 * 
		 * if(loginUser == null) { request.setAttribute("errorMsg", "로그인에 실패했습니다.");
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("views/common/errorPage.jsp");
		 * view.forward(request, response); } else { loginUser에 setUserNo userNo가져오기 int
		 * userNo = new MemberService().selectUserNo(snsId, userLevel);
		 * 
		 * loginUser.setUserNo(userNo);
		 * 
		 * System.out.println(loginUser.toString());
		 * request.getSession().setAttribute("loginUser", loginUser);
		 * request.getSession().setAttribute("snsLoginUser", snsLoginUser);
		 * request.getSession().setAttribute("alertMsg", "로그인에 성공함ㅎㅎ");
		 * 
		 * 
		 * response.sendRedirect(request.getContextPath()+"/mainpage.me"); }
		 * 
		 * 
		 * }
		 */
	}

}
