package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NoticeMoveController
 */
@WebServlet("/movenotice.bo")
public class NoticeMoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMoveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int refUno = loginUser.getUserNo();
		int refCno = (int) request.getSession().getAttribute("cno");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("refUno", refUno);
		session.setAttribute("refCno", refCno);

		request.getRequestDispatcher("views/board/noticeFirstPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
