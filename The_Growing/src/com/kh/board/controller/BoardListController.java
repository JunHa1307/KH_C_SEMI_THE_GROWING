package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.Reply;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.fr")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		
	
	
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit;
		
		int maxPage; 
		int startPage; 
		int endPage;
		int cno = (int)request.getSession().getAttribute("cno");
		
		listCount = new BoardService().selectBoardListCount(cno, boardType); 
		
		currentPage = Integer.parseInt(  request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")  );
		
		pageLimit = 10;
		
		boardLimit = 8;
		
		
		maxPage = (int) Math.ceil( ((double) listCount / boardLimit) );
	
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		 if(endPage >maxPage) {
			 endPage = maxPage;
		 }
		 
		 PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		 ArrayList<Board> list = new BoardService().selectBoardList(pi, boardType, cno);
		 
		 ArrayList<Integer> r = new ArrayList<Integer>();
		 for(int i =0; i<list.size(); i++) {
			int rCount = new BoardService().selectCountReply(list.get(i).getBoardNo());
			 r.add(rCount);
		 }
		 request.setAttribute("r", r);
		 request.setAttribute("boardType", boardType);
		 request.setAttribute("pi", pi);
		 request.setAttribute("list", list);
		 
//		 System.out.println(pi);
//		 System.out.println(list);
		
		
			 request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
