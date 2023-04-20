package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class NoticeCheckInsertController
 */
@WebServlet("/checkinsert.no")

public class NoticeCheckInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCheckInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int uno = (int) request.getSession().getAttribute("refUno");
		int cno = (int) request.getSession().getAttribute("refCno");
		int bno = Integer.parseInt( request.getParameter("bno"));
		
		int result = new BoardService().twoNoCheck(uno, cno); // 유저번호, 클래스번호가 같은 사람이있냐 체크함
		
		// 유저, 클래스번호가 같지 않을때 insert
		if(result <= 0) {
			int result2 = new BoardService().insertNoticeCheck(uno, cno, bno, loginUser.getUserName(), loginUser.getUserLevel());
			
			if(result2>0) {
				/* request.setAttribute("bno", bno); */
				/* response.sendRedirect("views/board/noticeListView.jsp"+bno); */
				response.getWriter().print(bno);

			}else {
				request.setAttribute("errorMsg", "수정 실패.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}else { // 유저, 클래스 번호가 같을때
			int result3 = new BoardService().threeNoCheck(uno, cno, bno); // 여기서 문제남
			
			// bno를 체크해서 bno값도 같다면?
			if(result3 > 0) {
				/* session.setAttribute("alertMsg","이미 확인되었습니다. 감사합니다 ^^"); */
				response.sendRedirect(request.getContextPath()+"/checklist.no");
			}else { // bno값이 같지 않다면?
				int result2 = new BoardService().insertNoticeCheck(uno, cno, bno, loginUser.getUserName(), loginUser.getUserLevel());
				
				if(result2>0) {
					/* request.setAttribute("bno", bno); */
					/* response.sendRedirect("views/board/noticeListView.jsp"+bno); */
					response.getWriter().print(bno);
					

				}else {
					request.setAttribute("errorMsg", "수정 실패.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}
			
		}
	}

}
