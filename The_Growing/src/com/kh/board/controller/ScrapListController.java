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
		
		ArrayList<String> bnoArr = new Gson().fromJson(request.getParameter("bnoArr"), ArrayList.class);
		System.out.println(bnoArr);
		System.out.println(bnoArr.size());

		int[] bnoArr2 = new int[bnoArr.size()];
		
		for(int i=0 ; i<bnoArr.size(); i++) {
			bnoArr2[i] = Integer.parseInt(bnoArr.get(i));
		}
		
		int uno = Integer.parseInt(request.getParameter("uno"));

		ArrayList<Scrap> slist = new BoardService().selectScrapListForMy(uno, bnoArr2);
		
		System.out.println(slist);
		if(slist != null) {
			
			 request.getSession().setAttribute("slist", slist);
				/*
				 * request.getRequestDispatcher("views/my/myScrap.jsp").forward(request,
				 * response);
				 */
			 
				/* response.sendRedirect(request.getContextPath()+"/goMyScrap.s"); */
			 
			response.getWriter().print(slist);
		}else {
			request.setAttribute("errorMsg", "스크랩 리스트 보내기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	
	
	
	
	
	
	
	}

}
