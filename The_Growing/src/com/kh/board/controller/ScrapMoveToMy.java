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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		/* response.setContentType("application/json; charset=UTF-8"); */
		
		/*
		 * ArrayList<Scrap> slist = (ArrayList<Scrap>)
		 * request.getSession().getAttribute("slist");
		 */		
		
		
	
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
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<String> scrap = new Gson().fromJson(request.getParameter("scrap"),  ArrayList.class);
		
		response.setContentType("application/json; charset=UTF-8");
		
		System.out.println(scrap.toString());
		System.out.println("scrap.get(0):"+scrap.get(0));
		System.out.println("scrap.get(0):"+scrap.get(1));
		int uno = Integer.parseInt( scrap.get(0)); 
		int bno = Integer.parseInt(scrap.get(1));
		
		Scrap resultScrap = new Scrap();
		
		resultScrap.setRefUno(uno); 
		resultScrap.setRefBno(bno);

		System.out.println(resultScrap.toString());
		  
		request.getSession().setAttribute("resultScrap", resultScrap);
		
		new Gson().toJson(resultScrap);
		
		request.getRequestDispatcher("views/my/myScrap.jsp").forward(request, response);
		
	}

}
