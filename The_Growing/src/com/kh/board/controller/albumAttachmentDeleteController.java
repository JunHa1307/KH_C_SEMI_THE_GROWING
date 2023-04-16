package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class albumAttachmentDeleteController
 */
@WebServlet("/deleteAttachment.al")
public class albumAttachmentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public albumAttachmentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String path = request.getParameter("path"); String changeName =
		 * request.getParameter("cn");
		 */
		int bno = Integer.parseInt(request.getParameter("bno"));
		int index = Integer.parseInt(request.getParameter("index"));
		int level = Integer.parseInt(request.getParameter("level"));
	
		
		ArrayList<Attachment> list = new BoardService().selectAlbumInnerList(bno);
		
		int result = new BoardService().deleteAttachment(bno , level);

		if(result > 0) {
			String savePath = request.getSession().getServletContext().getRealPath(list.get(index-1).getFilePath());
			
			new File(savePath+list.get(index-1).getChangeName()).delete();
			response.sendRedirect(request.getContextPath()+"/update.al?bno="+bno);
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
