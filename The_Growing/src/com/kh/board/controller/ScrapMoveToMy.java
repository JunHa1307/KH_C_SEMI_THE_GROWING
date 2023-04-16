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
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ScrapMoveToMy
 */
@WebServlet("/goMyScrap.s")
public class ScrapMoveToMy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapMoveToMy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		
		int uno = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Integer> arr = new BoardService().selectMyScrapList(uno);
		
		ArrayList<Board> boardArr = new BoardService().selectMyScrapList2(uno, arr);
		
		request.setAttribute("boardArr", boardArr);
		
		request.getRequestDispatcher("views/my/myScrap.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
