package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.fr")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
	  	int boardType = Integer.parseInt(request.getParameter("boardType"));
		
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
	
		
		int result = new BoardService().deleteBoard(boardNo, userNo);
		
		if(result > 0) {
			//삭제처리
		
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.fr?boardType="+boardType);
		}else {
			request.setAttribute("errorMsg", "게시글작성에 실패했습니다..");
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
