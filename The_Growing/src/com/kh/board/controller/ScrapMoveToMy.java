package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.vo.Scrap;

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
		
		ArrayList scrapList = new Gson().fromJson(request.getParameter("scrapList"), ArrayList.class);
		System.out.println(scrapList);
		
		
		
		/* response.setContentType("application/json; charset=UTF-8"); */
		
		  request.getSession().setAttribute("scrapList", scrapList);
		
		  request.getRequestDispatcher("views/my/myScrap.jsp").forward(request, response);
		
	
		/*
		 * request.getSession().getAttribute("slist");
		 * request.getRequestDispatcher("views/my/myScrap.jsp").forward(request,
		 * response);
		 */	
		/* new Gson().toJson(scrapList, response.getWriter()); */
	
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
