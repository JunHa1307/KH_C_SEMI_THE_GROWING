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
import com.kh.board.model.vo.NoticeCheck;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NoticeCheckController
 */
@WebServlet("/checklist.no")
public class NoticeCheckListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCheckListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = (int) request.getSession().getAttribute("refCno");
		int bno = Integer.parseInt( request.getParameter("bno")); 
		System.out.println(cno);
		System.out.println(bno);
		
		ArrayList<NoticeCheck> noticeCheckList = new BoardService().selectUserName(cno, bno);
		
		/*
		 * request.getSession().setAttribute("noticeCheckList", noticeCheckList);
		 * System.out.println(noticeCheckList);
		 * 
		 * request.getRequestDispatcher("views/board/noticeListView.jsp").forward(
		 * request, response);
		 */
		response.setContentType("application/json; charset=UTF-8");
		      // JSONArray<JSONObject>
		new Gson().toJson(noticeCheckList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
