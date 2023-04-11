package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class NoticeCheckInsertController
 */
@WebServlet("/checkinsert.no")
public class NoticeCheckUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCheckUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int uno = (int) request.getSession().getAttribute("refUno");
		int cno = (int) request.getSession().getAttribute("refCno");
		int bno = Integer.parseInt( request.getParameter("bno"));
		
		int result = new BoardService().insertNoticeCheck(uno, cno, bno, loginUser.getUserName(), loginUser.getUserLevel());
		
		if(result>0) {
			/* request.setAttribute("bno", bno); */
			/* response.sendRedirect("views/board/noticeListView.jsp"+bno); */
			response.getWriter().print(bno);
			
		}else {
			request.setAttribute("errorMsg", "수정 실패.");
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
