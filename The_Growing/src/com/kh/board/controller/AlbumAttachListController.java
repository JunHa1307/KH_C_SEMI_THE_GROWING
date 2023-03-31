package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class AlbumAttachListController
 */
@WebServlet("/att.al")
public class AlbumAttachListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumAttachListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int cno = Integer.parseInt(request.getParameter("cno"));
		 Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			int uno = loginUser.getUserNo();
			Class cInfo = new ClassService().selectClass(cno, uno);
			request.setAttribute("cInfo", cInfo);
		 
		ArrayList<Attachment> list = new BoardService().selectAttachList(cno);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/albumFileView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
