package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
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
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		System.out.println("get boardType:"+boardType);
		 request.setAttribute("boardType", boardType);
		request.getRequestDispatcher("views/board/boardEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			// 1_1. 전송용량제한
						
			// 1_2. 저장할 폴더의 물리적 경로
						
			// 2. 전달된 파일명 수정작업후 서버에 업로드
			
			int uno = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
			int cno = (int) request.getSession().getAttribute("cno");
			int boardType = Integer.parseInt(request.getParameter("boardType"));
			System.out.println("boardType:"+boardType);
			
			Board b = new Board();
			if(boardType==4) {
				
				b.setBoardType(4);
				b.setBoardTitle(request.getParameter("title"));
				b.setBoardContent(request.getParameter("content"));
				b.setRefUno(uno);
				b.setRefCno(cno);
				
				 int result = new BoardService().insertBoard(b);
					
				 if(result > 0 ) { 
					 
					 request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
					 response.sendRedirect(request.getContextPath()+"/list.fr?currentPage=1&boardType=4");
				 	}else { 
		
					
					  request.setAttribute("errorMsg", "게시글 작성 실패");
					 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); 
					 }
				 
				 
				 
				}else {
				  
				  b.setBoardType(5); 
				  b.setBoardTitle(request.getParameter("title"));
				  b.setBoardContent(request.getParameter("content")); 
				  b.setRefUno(uno);
				  b.setRefCno(cno);
					  
					  
				  
				  int result = new BoardService().insertBoard(b);
				  
				  if(result > 0 ) {
				  
				  request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				  response.sendRedirect(request.getContextPath()+"/list.fr?currentPage=1&boardType=5");
				  }else {
				  
				  
				  
				  request.setAttribute("errorMsg", "게시글 작성 실패");
				  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); 
				  }
					 
				
				
			}
				
			// 3. db에 저장
			// Board에 들어갈 값들 뽑아오기
		
//			 Attachment at = null;
//			 if(multi.getOriginalFileName("upfile") != null) {
//				 at = new Attachment();
//				 at.setOriginName( multi.getOriginalFileName("upfile")  );
//				 at.setChangeName( multi.getFilesystemName("upfile") );
//				 at.setFilePath("resources/board_upfiles/");
//				 at.setFileLevel(1);
//			 }
			
			
	/*		 Class cInfo = new ClassService().selectClass(cno, uno);
			 request.setAttribute("cInfo", cInfo);
			 */
			
		
	}
	
}

