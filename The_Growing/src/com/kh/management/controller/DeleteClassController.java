package com.kh.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class DeleteClassController
 */
@WebServlet("/deleteclass.ma")
public class DeleteClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClassController() {
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
		HttpSession session = request.getSession();
		
		int cno = ((Class) session.getAttribute("cInfo")).getClassNo();
		
		/*
		 * Attachment at = new ClassService().selectAttachment(cno);
		 * 
		 * int result = new ClassService().deleteClass(cno, at);
		 */
		
		
	}

}
