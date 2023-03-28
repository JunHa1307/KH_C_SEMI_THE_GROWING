package com.kh.classes;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;

/**
 * Servlet implementation class TableUpdateController
 */
@WebServlet("/tableUpdate.c")
public class TableUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TableUpdateController() {
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
		request.setCharacterEncoding("UTF-8");
		/*
		 * Enumeration e = request.getParameterNames(); while(e.hasMoreElements()) {
		 * System.out.println(e.nextElement()); }
		 */

		String arr = request.getParameter("arr");
		int classNo = Integer.parseInt(request.getParameter("cno"));
		
		String updateTable = new ClassService().updateTable(classNo,arr);
		  
		if(updateTable == null) {// 실패
			
			request.setAttribute("errorMsg", "수정에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}else { // 성공
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정했습니다");
			
			response.sendRedirect(request.getContextPath()+"/mainpage.me");
		}
		 
	}

}
