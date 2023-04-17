package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
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
		
		int refUno = (int) request.getSession().getAttribute("refUno");
		int refCno = (int) request.getSession().getAttribute("refCno");
		Board b2 = new Board();
		
		b2.setBoardType(2);
		b2.setBoardTitle(request.getParameter("title"));
		b2.setBoardContent(request.getParameter("content"));
		b2.setRefUno(refUno);
		b2.setRefCno(refCno);
		
		System.out.println(b2.toString());
		int result = new BoardService().insertNotice(b2);
		
		if(result > 0) { // 성공적으로 작성 => 최신글 목록으로 이동
			
			HttpSession session = request.getSession();
			
			session.setAttribute("b2", b2);
			
			request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
			response.sendRedirect(request.getContextPath()+"/movenotice.bo");
		} else { // 실패시에는 -> 첨부파일이 있었을 경우 이미 업로드된 첨부파일을 삭제해주기!(용량만 차지함)

			request.setAttribute("errorMsg", "게시글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
	}

}
