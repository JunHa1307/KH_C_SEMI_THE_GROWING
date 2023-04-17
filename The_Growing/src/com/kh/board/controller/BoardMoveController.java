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
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardMoveController
 */
@WebServlet("/boardmove.bo")
public class BoardMoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMoveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 * int cno = Integer.parseInt(request.getParameter("cno")); ArrayList<Board>
		 * list = new BoardService().selectAlbumList(cno);
		 * request.getSession().setAttribute("cno", cno);
		 * 
		 * request.setAttribute("list", list);
		 * 
		 * 
		 * request.getRequestDispatcher("views/board/albumList.jsp").forward(request,
		 * response);
		 */
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int cno = Integer.parseInt(request.getParameter("cno"));
		request.getSession().setAttribute("cno", cno);
		
		Class cInfo = new ClassService().selectClass(cno, uno);
		request.getSession().setAttribute("cInfo", cInfo);

		int listCount;	 	// 현재 게시판의 총 게시글 갯수 
		int currentPage; 	// 현재 페이지(사용자가 요청한 페이지) 
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 
		int boardLimit; 	// 한 페이지에 보여질 게시글의 최대 갯수 
		
		int maxPage;		// 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 수) 
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작 수 
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝 수 
		listCount = new BoardService().selectListCount(cno); // 119 
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" :  request.getParameter("currentPage"));
		
		pageLimit = 10; 
		
		boardLimit = 8; 

		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		startPage = (currentPage -1) / pageLimit * pageLimit +1;
		
	
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
	
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); 
		ArrayList<Member> mList = new MemberService().selectMemberList(cno);
		ArrayList<Board> list = new BoardService().selectList(pi, cno);
		 ArrayList<Integer> r = new ArrayList<Integer>();
		 for(int i =0; i<list.size(); i++) {
			int rCount = new BoardService().selectCountReply(list.get(i).getBoardNo());
			 r.add(rCount);
		 }
		 request.setAttribute("mList", mList);
		 request.setAttribute("r", r);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/board/boardResent.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
