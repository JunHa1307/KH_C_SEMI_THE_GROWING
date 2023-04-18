package com.kh.classes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.classes.model.service.ClassService;

/**
 * Servlet implementation class CalendarUpdateController
 */
@WebServlet("/calendarUpdate.c")
public class CalendarUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarUpdateController() {
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
		
		String arr = request.getParameter("cArr");
		int classNo = Integer.parseInt(request.getParameter("cno"));
		
		int updateTable = new ClassService().updateCalendar(classNo,arr);
		  
		if(updateTable == 0) {// 실패
			
			response.getWriter().print("Fail");
			
		}else { // 성공
			
			response.getWriter().print("Success");
		}
	}
}
