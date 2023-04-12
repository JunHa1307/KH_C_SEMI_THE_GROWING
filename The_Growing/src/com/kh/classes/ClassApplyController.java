package com.kh.classes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ClassApplyController
 */
@WebServlet("/classapply.c")
public class ClassApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassApplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ArrayList<Class> list = new ClassService().selectClassList(uno);
		
		int result = new ClassService().selectApply(uno,cno);
		
		boolean isMember = false;
		
		for(Class c : list) {
			if(c.getClassNo() == cno) {
				isMember = true;
			}
		}
		
		if(result > 0 || isMember) {
			response.getWriter().print("0");
		}else {
			int result2 = new ClassService().insertApply(uno,cno);
			if(result2 > 0) {
				response.getWriter().print("1");
			}else {
				response.getWriter().print("2");
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
