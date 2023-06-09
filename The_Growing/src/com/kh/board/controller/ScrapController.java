package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Scrap;

/**
 * Servlet implementation class ScrapController
 */
@WebServlet("/scrap.bo")
public class ScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ScrapController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int uno = Integer.parseInt(request.getParameter("uno"));
		int bno = Integer.parseInt(request.getParameter("bno"));

		int scrap = new BoardService().selectScrap(bno, uno);

		int result1 = 0;

		if (scrap == 0) {
			result1 = new BoardService().insertScrap(bno, uno);

		} else {
			int result2 = new BoardService().deleteScrap(bno, uno);
		}
		
		Scrap s = new Scrap();
		if(result1 > 0) {
			s = new BoardService().selectScrapForMy(bno, uno); 

			
		}
		
		/* jsonarray로 파싱함 */
		 
		response.getWriter().print(s);
	}

}
