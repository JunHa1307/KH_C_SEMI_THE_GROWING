package com.kh.management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.classes.model.vo.Class;

/**
 * Servlet implementation class ClassInforController
 */
@WebServlet("/infor.bo")
public class ClassInforController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInforController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		int cno = (int) request.getSession().getAttribute("cno");
		
		Member m = new MemberService().loginMemberInfo(uno);
		Class c = new ClassService().selectClass(cno,uno);
		
		request.setAttribute("m", m);
		request.setAttribute("c", c);
		request.getRequestDispatcher("views/management/classInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
