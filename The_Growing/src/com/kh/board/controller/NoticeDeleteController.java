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
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/boardDelete.no")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
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
		/* JSON Array는 문자열 */
		
		ArrayList<String> checkBoxArr =  new Gson().fromJson( request.getParameter("checkBoxArr") , ArrayList.class );
		
		int[] arr = new int[checkBoxArr.size()];
		
		for(int i=0 ; i<checkBoxArr.size(); i++) {
			arr[i] = Integer.parseInt(checkBoxArr.get(i));
		}
		
		int result = new BoardService().deleteNotice(arr);
		
		
		if(result > 0) {
			
			int refCno = (int) request.getSession().getAttribute("refCno");
			
			ArrayList<Board> list2 = new BoardService().selectNoticeList(refCno);

			request.getSession().setAttribute("list2", list2);
			
			response.getWriter().print("선택된 게시물이 모두 삭제되었습니다.");
		}else {
			request.setAttribute("errorMsg", "게시물 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
