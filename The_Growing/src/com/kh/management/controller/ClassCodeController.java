package com.kh.management.controller;

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
 * Servlet implementation class ClassCodeController
 */
@WebServlet("/classCode.bo")
public class ClassCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassCodeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Class> list = new ClassService().selectClassListAll();
		
		int classCode = (int)(Math.random()*900000+100000);
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getClassCode()==classCode) {
				classCode = (int)(Math.random()*900000+100000);
				i--;
			}
		}
		
		int cno = (int) request.getSession().getAttribute("cno");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int result = new ClassService().updateClassCode(cno,classCode );
		if(result>0) {
			Class cInfo = new ClassService().selectClass(cno, uno);
			request.getSession().setAttribute("cInfo", cInfo);
			response.sendRedirect(request.getContextPath()+"/invite.bo");
		}else {
			request.setAttribute("errorMsg", "초대코드를 다시 받지 못했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
