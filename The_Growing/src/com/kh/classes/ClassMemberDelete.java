package com.kh.classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ClassMemberDelete
 */
@WebServlet("/classmemberdelete.c")
public class ClassMemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassMemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = (int)request.getSession().getAttribute("cno");
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int uno = m.getUserNo();
		
		int result = new ClassService().deleteClassMember(uno, cno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 탈퇴되었습니다");
			response.sendRedirect(request.getContextPath()+"/mainpage.me");
		}else {
			request.getSession().setAttribute("alertMsg", "탈퇴 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cno = (int)request.getSession().getAttribute("cno");
		int uno = Integer.parseInt(request.getParameter("uno"));
		Member m = (Member)request.getSession().getAttribute("loginUser");
		if(uno == m.getUserNo() && m.getUserLevel() == 1) {
			response.getWriter().print("Fail");
		}else {
		
			int result = new ClassService().deleteClassMember(uno, cno);
			
			if(result > 0) {
				int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
				Class cInfo = new ClassService().selectClass(cno, userNo);
				request.getSession().setAttribute("cInfo", cInfo);
				response.getWriter().print("Success");
			}else {
				response.getWriter().print("Fail");
			}
		}
	}

}
