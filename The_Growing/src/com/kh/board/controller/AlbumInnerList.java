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
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class AlbumInnerList
 */
@WebServlet("/innerlist.al")
public class AlbumInnerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumInnerList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		
		int result = new BoardService().increaseCount(bno);
		if(result > 0 ) { 
		
		ArrayList<Attachment> list = new BoardService().selectAlbumInnerList(bno);
		
		//Gson을 이용해서 응답 ArrayList -> JsonArray로 변환해서 보내기 
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		}else { 
			request.setAttribute("errorMsg", "게시글 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
