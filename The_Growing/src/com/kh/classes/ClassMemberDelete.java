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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cno = (int)request.getSession().getAttribute("cno");
		int uno = Integer.parseInt(request.getParameter("uno"));
		
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
