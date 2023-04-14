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
/**
 * Servlet implementation class ClassSearchController
 */
@WebServlet("/searchClass.c")
public class ClassSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchClassName = request.getParameter("searchClassName");
		
		ArrayList<Class> list = new ClassService().searchClassList(searchClassName);
		
		request.setAttribute("list", list);
		request.setAttribute("searchClassName", searchClassName);
		
		request.getRequestDispatcher("views/common/searchClassResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
