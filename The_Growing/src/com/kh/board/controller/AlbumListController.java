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
 * Servlet implementation class AlbumListController
 */
@WebServlet("/list.al")
public class AlbumListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = (int)request.getSession().getAttribute("cno");
	
		ArrayList<Board> list = new BoardService().selectAlbumList(cno);
		
		
		//ArrayList<Reply> rlist = new BoardService().selectReplyList(bno);
		
		request.setAttribute("list", list);
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
