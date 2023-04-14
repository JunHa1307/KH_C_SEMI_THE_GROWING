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
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AlbumDeleteController
 */
@WebServlet("/delete.al")
public class AlbumDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이동");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int uno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Attachment> list = new BoardService().selectAlbumInnerList(bno);
	
		int result = new BoardService().deleteBoard(bno , uno, list);
		
		if(result > 0) {
			//삭제처리 
			for(int i =0; i<list.size(); i++) {
			if(list.get(i) != null) {
				String savePath = request.getSession().getServletContext().getRealPath(list.get(i).getFilePath());
				
				new File(savePath+list.get(i).getChangeName()).delete();
			}
			}
			
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.al");
		}else {
			request.setAttribute("errorMsg", "게시글 삭제에 실패했습니다");
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
