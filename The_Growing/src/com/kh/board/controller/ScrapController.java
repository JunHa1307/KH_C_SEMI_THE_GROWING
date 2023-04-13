package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno = Integer.parseInt(request.getParameter("uno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int scrap = new BoardService().selectScrap(bno, uno);
		System.out.println("scrap"+scrap);
		int result1 = 0;
		
		if(scrap == 0) {
			result1 = new BoardService().insertScrap(bno,uno);
			System.out.println("result1-1:"+result1);
		}else {
			int result2 = new BoardService().deleteScrap(bno,uno);
		}
		/* scrap = new BoardService().selectScrap(bno,uno); */
		ArrayList<Scrap> scrapList = new ArrayList<>();
		if(result1 > 0) {
			scrapList = new BoardService().selectScrapList(uno); 
			System.out.println("scrapList:"+scrapList);
		}else {
			System.out.println("에러남");
		}
		
		response.getWriter().print(scrapList);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
