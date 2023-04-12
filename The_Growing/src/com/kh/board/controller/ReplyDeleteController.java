package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReplyDeleteController
 */
@WebServlet("/rDelete.bo")
public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyNo = Integer.parseInt(request.getParameter("rno"));
		
		int result = new BoardService().deleteReply(replyNo);
		
		if(result > 0) {
			 response.getWriter().print(result); 
		}else {
			request.setAttribute("errorMsg", "댓글삭제에 실패했습니다..");
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
