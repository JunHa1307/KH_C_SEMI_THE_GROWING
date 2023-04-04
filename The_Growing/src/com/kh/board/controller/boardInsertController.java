package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class boardInsertController
 */
@WebServlet("/insert.fr")
public class boardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("views/board/boardEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request) ) {
		
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request , savePath, maxSize ,"UTF-8", 
					 new MyFileRenamePolicy());

			 String title = multi.getParameter("title");
			 String content = multi.getParameter("content");
//			 int refUno = Integer.parseInt((((Member) request.getSession().getAttribute("loginUser")).getUserNo()+"")); 
			 
			 
			 Board b = new Board();
			 b.setBoardTitle(multi.getParameter("title"));
			 b.setBoardContent(multi.getParameter("content"));
			 int uno = 2;
			 int cno = 1;
			 
			 ArrayList<Attachment> list = new ArrayList();
			 Attachment at = new Attachment();
			 if(multi.getOriginalFileName("upfile") != null) {
				 at = new Attachment();
				 at.setOriginName( multi.getOriginalFileName("upfile")  );
				 at.setChangeName( multi.getFilesystemName("upfile") );
				 at.setFilePath("resources/board_upfiles/");
			 }
			 
			
			 int result = new BoardService().insertBoard(b, list, uno, cno );
			
			 if(result > 0 ) { 
				 
				 request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				 response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1");
			 }else { 
				 
				 if(list != null) {
					 new File(savePath+at.getChangeName()).delete();
				 }
				 
				 request.setAttribute("errorMsg", "게시글 작성 실패");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);				 
				 
			 }
		} else {
			request.setAttribute("errorMsg", "전송방법이 잘못되었습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
