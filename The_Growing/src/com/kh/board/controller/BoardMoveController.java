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
import com.kh.board.model.vo.Reply;
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
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

		ArrayList<Board> list = new BoardService().selectAlbumList(cno);
		
		request.setAttribute("list", list);
		
		
		ArrayList<Reply> rlist = new BoardService().selectReplyList(2);
	     
	        		 request.setAttribute("rlist", rlist);
	    
	
		
		request.getSession().setAttribute("cInfo", cInfo);
		request.getRequestDispatcher("views/board/albumList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
