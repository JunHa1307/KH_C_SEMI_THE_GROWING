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
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		request.getSession().setAttribute("bno", bno);
		Board b = new BoardService().selectNotice(bno);
		
		request.setAttribute("b", b);
		request.getRequestDispatcher("views/board/noticeUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		Board b = new Board();
		int bno = (int) request.getSession().getAttribute("bno");
		b.setBoardNo(bno);
		b.setBoardTitle(request.getParameter("title"));
		b.setBoardContent(request.getParameter("content"));
		
		Board updateNotice = new BoardService().updateNotice(b);
				
		if(updateNotice != null) {
			HttpSession session = request.getSession();
			session.setAttribute("updateNotice", updateNotice);
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다");
			response.sendRedirect(request.getContextPath()+"/movenotice.bo");
		}else {
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
