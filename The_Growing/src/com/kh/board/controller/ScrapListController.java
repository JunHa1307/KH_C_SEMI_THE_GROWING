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
 * Servlet implementation class ScrapListController
 */
@WebServlet("/selecScrapList.s")
public class ScrapListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Scrap> scrapList = new Gson().fromJson(request.getParameter("scrapList"), ArrayList.class);
		System.out.println(scrapList);
		System.out.println(scrapList.size());
		
		int uno = scrapList.get(0).getRefUno();
		System.out.println(uno);
		
		ArrayList<Scrap> slist = new BoardService().selectScrapList(uno);
		System.out.println(slist);
		if(slist != null) {
			
			 request.getSession().setAttribute("slist", slist);
			  
			 response.sendRedirect(request.getContextPath()+"/goMyScrap.s");
			 
			/* response.getWriter().print(slist); */
		}else {
			request.setAttribute("errorMsg", "스크랩 리스트 보내기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	
	
	
	
	
	
	
	}

}
