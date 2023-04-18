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
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.fr")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int boardNo = Integer.parseInt(request.getParameter("bno"));
    	int boardType = Integer.parseInt(request.getParameter("boardType"));
    	
    	if(boardType==3) {
			response.sendRedirect(request.getContextPath()+"/list.al");
			return;
		}
    	
    	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int refUno = loginUser.getUserNo();
		int refCno = (int) request.getSession().getAttribute("cno");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("refUno", refUno);
		session.setAttribute("refCno", refCno);
		
		BoardService bService = new BoardService();
		ArrayList<Integer> arr = new BoardService().selectMyScrapList(refUno);
		
		ArrayList<Board> list2 = new BoardService().selectNoticeList(refCno);

		
		int result = bService.increaseCount(boardNo);
		
		if(result > 0 ) { 
			Board b = bService.selectBoard(boardNo);
			ArrayList<Reply> list = new BoardService().selectReplyList(boardNo);
			
			request.setAttribute("boardType", boardType);
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			request.setAttribute("arr", arr);
			request.getSession().setAttribute("list2", list2);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			
		}else { 
			request.setAttribute("errorMsg", "게시글 상세조회 실패");
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
