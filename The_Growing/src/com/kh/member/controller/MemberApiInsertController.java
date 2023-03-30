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
		//1) 인코딩작업
				request.setCharacterEncoding("UTF-8");
				
				//2) 요청시 전달값을 뽑아서 변수 , 객체에 기록해줄것
				String snsId = request.getParameter("snsId");// 필수값
				String snsName = request.getParameter("snsName");// 필수값
				String snsType = request.getParameter("snsType"); // 1, 2, 3		
				String filePath = request.getParameter("filePath");
				int userLevel = (int) request.getSession().getAttribute("userLevel");

				// 전달받은 파라미터를 가지고 Member클래스로 만들어주기
				Member loginUser = new Member(snsId, snsName, userLevel);
				SnsLogin snsLoginUser = new SnsLogin(snsId, snsName, snsType, filePath);
				
				int result2 = new MemberService().idCheck(snsId);
				
				// 3) 요청처리 (서비스 메소드호출 결과값 돌려받기)
				// if를 해가지고 select해서 가져옴. 
				if(result2 < 0) {

					int result = new MemberService().insertMemberApi(loginUser, snsLoginUser);
					
					// 4) 처리 결과를 가지고 사용자가보게될 응답화면을 지정
					if(result > 0) { // 성공 => /jspproject (url 재요청방식)
						request.getSession().setAttribute("loginUser", loginUser);
						request.getSession().setAttribute("snsLoginUser", snsLoginUser);
						request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다");
						
						response.sendRedirect(request.getContextPath()+"/mainpage.me");
						
					}else { // 실패 => 에러페이지 포워딩
						request.setAttribute("errorMsg", "회원가입에 실패했습니다");
						
						request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					}
				}else {
					
					loginUser = new MemberService().snsLoginMember(snsId, userLevel);
					
					if(loginUser == null) {
						request.setAttribute("errorMsg", "로그인에 실패했습니다.");
						RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
						view.forward(request, response);
					} else {
						request.getSession().setAttribute("loginUser", loginUser);
						request.getSession().setAttribute("snsLoginUser", snsLoginUser);
						request.getSession().setAttribute("alertMsg", "로그인에 성공함ㅎㅎ");
						
						response.sendRedirect(request.getContextPath()+"/mainpage.me");
					}
					/* alert("이미 존재하는 아이디로, 성공적으로 로그인 되었습니다."); */
					
				}
	}

}
