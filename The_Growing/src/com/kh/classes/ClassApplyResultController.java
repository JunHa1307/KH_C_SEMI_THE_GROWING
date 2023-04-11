package com.kh.classes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;
/**
 * Servlet implementation class ClassApplyResultController
 */
@WebServlet("/applyResult.c")
public class ClassApplyResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassApplyResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Class c = (Class) request.getSession().getAttribute("cInfo");
		int uno = Integer.parseInt(request.getParameter("uno"));
		int type= Integer.parseInt(request.getParameter("type"));
		System.out.println(type);
		if(type == 1) {
			int result1 = new ClassService().insertClassMember(c.getClassCode(),uno);
			int result2 = new ClassService().deleteApplyMember(uno,c.getClassNo());
			if((result1 * result2) > 0) {
				request.getSession().setAttribute("alertMsg","가입신청 승인 성공");
				
				int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
				Class cInfo = new ClassService().selectClass(c.getClassNo(), userNo);
				
				request.getSession().setAttribute("cInfo", cInfo);
				response.sendRedirect(request.getContextPath()+"/classmembermanagement.c");
			}else {
				request.setAttribute("errorMsg", "가입신청 승인 실패");
				 
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
			}
		}else {
			int result = new ClassService().deleteApplyMember(uno,c.getClassNo());
			if(result > 0) {
				request.getSession().setAttribute("alertMsg","가입신청 거절 성공");
				response.sendRedirect(request.getContextPath()+"/classmembermanagement.c");
			}else {
				request.setAttribute("errorMsg", "가입신청 거절 실패");
				 
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
			}
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
