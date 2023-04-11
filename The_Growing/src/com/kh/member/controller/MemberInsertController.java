package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
/*import com.kh.common.AEScryptor;*/
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
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
		String userId = request.getParameter("userId");// 필수값
		String userPwd = request.getParameter("userPwd");// 필수값
		String userName = request.getParameter("userName");// 필수값
		String phone = request.getParameter("phone");// 빈문자열이 전달될수도 있다.
		String address = request.getParameter("address");// 빈문자열이 전달될수도 있다.
		
		String url = (String) request.getHeader("REFERER");
		int userLevel = 0;
		
		if(url.contains("growing/classmembermanagement.c")) {
			userLevel = 3;
		}else {
			userLevel = (int) request.getSession().getAttribute("userLevel"); // 입력받지는 않지만 필수값
		}
		
		// 이메일 암호화 (개발자가 정보 못보게)
//		email = AEScryptor.encrypt(email);
		
		// 전달받은 파라미터를 가지고 Member클래스로 만들어주기
		Member m = new Member(userId, userPwd,userName,phone,address,userLevel);
	
		// 3) 요청처리 (서비스 메소드호출 결과값 돌려받기)
		int result = new MemberService().insertMember(m);
		
		// 4) 처리 결과를 가지고 사용자가보게될 응답화면을 지정
		if(result > 0 && url.contains("growing/classmembermanagement.c")) { // 성공 => /jspproject (url 재요청방식)
			int classCode = Integer.parseInt(request.getParameter("classCode"));
			int uno = new MemberService().selectUserNo(userId, userLevel);
			int result2 = new ClassService().insertClassMember(classCode, uno);
			if(result2 > 0) {
				request.getSession().setAttribute("alertMsg", "임시 학생계정 생성에 성공했습니다");
				
				response.sendRedirect(request.getContextPath()+"/classmembermanagement.c");
			}else {
				request.setAttribute("errorMsg", "학생계정 생성에 실패했습니다");
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}else if(result > 0) {	
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다");
			
			response.sendRedirect(request.getContextPath()+"/views/member/theGrowingLoginForm.jsp");
			
		}else { // 실패 => 에러페이지 포워딩
			request.setAttribute("errorMsg", "회원가입에 실패했습니다");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	
	
	
	
	
	
	
	
	
	}

}
