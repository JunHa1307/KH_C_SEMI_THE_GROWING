package com.kh.classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MoveNoticeToClass
 */
@WebServlet("/noticeToClass.c")
public class MoveNoticeToClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveNoticeToClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int noticeType = Integer.parseInt(request.getParameter("noticeType"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Class cInfo = new ClassService().selectClass(cno, uno);
		request.getSession().setAttribute("cno", cno);
		request.getSession().setAttribute("cInfo", cInfo);
		
		if(noticeType == 1) {
			
			request.getRequestDispatcher("/resent.bo").forward(request, response);
			
		}else if(noticeType == 2) {
			
			int bno = Integer.parseInt(request.getParameter("bno"));
			String search = request.getParameter("search");
			Board b = new BoardService().selectBoard(bno);
			
			request.getRequestDispatcher("/detail.fr?bno="+b.getBoardNo()+"&boardType="+b.getBoardType()).forward(request, response);
			
		}else if (noticeType == 3) {
			request.getRequestDispatcher("/movenotice.bo").forward(request, response);
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
