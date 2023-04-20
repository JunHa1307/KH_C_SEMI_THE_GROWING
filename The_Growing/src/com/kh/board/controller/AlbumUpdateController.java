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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AlbumUpdateController
 */
@WebServlet("/update.al")
public class AlbumUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		//int bno = 4;
		Board b= new BoardService().selectAlbumBoard(bno);
		ArrayList<Attachment> list = new BoardService().selectAlbumInnerList(bno);
		
		request.setAttribute("b", b);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/albumUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 필요한 데이터를 전달받고 실제 Board 테이블과 Attachment 테이블에 Update 쿼리문을 실행 
		
				// 1. 전송된 데이터에 input file이 포함된 경우 enctype="multipart/form-data"로 전송했을 것. 
				if(ServletFileUpload.isMultipartContent(request)) {
						
						// 1_1. 전송파일 용량제한(10mByte)
						int mb = 1024 * 1024 * 10;
						
						// 1_2. 전달된 파일을 저장시킬 서버의 폴더의 물리적인 경로 알아내기
						String path = request.getSession().getServletContext().getRealPath("/resources/album_upfiles/");
						
						// 2. 전달된 파일명 수정작업 후 서버에 업로드 
						MultipartRequest multi= new MultipartRequest(request, path, mb, "UTF-8", new MyFileRenamePolicy());
						
						// 3. 본격적으로 sql문 실행시 필요한 값들 셋팅 
						int bno = Integer.parseInt(multi.getParameter("bno"));
						String title = multi.getParameter("title");
						String content = multi.getParameter("content");
						
						Board b = new Board();
						b.setBoardTitle(title);
						b.setBoardContent(content);
						b.setBoardNo(bno);
						
						// 새롭게 전달된 첨부파일이 있는 경우에만 at변수에 필요한 값을 추가할것 
						ArrayList<Attachment> list = new ArrayList<Attachment>();
						
						int index = 1;
						for(int i=1; i<=5; i++) {
							if(multi.getOriginalFileName("file"+i) != null) {
							index = i;
							}
						
						}
							
							for(int i=1; i<=index; i++) {
								if(multi.getOriginalFileName("file"+i) != null) {
									Attachment at = new Attachment();
									
									at.setRefBno(bno);
									at.setOriginName(multi.getOriginalFileName("file"+i));
									at.setChangeName(multi.getFilesystemName("file"+i));
									at.setFilePath("/resources/album_upfiles/");
									list.add(at);
									// 첨부파일이 원래 등록되어 있을경우 원본파일의 파일번호, 수정된 이름을 hidden 넘겨받았음
									if(multi.getParameter("originFileNo"+(i-1)) != null ) {
										
										// 기존에 파일이 있었던 경우 
										// Attachment 테이블의 정보를 update
										
										
										// 기존의 파일번호를 저장시키기 
										if(list.size() > i-1 ) {
											list.get(i-1).setFileNo(Integer.parseInt(multi.getParameter("originFileNo"+(i-1))));
										}else {
											list.get(list.size()-1).setFileNo(Integer.parseInt(multi.getParameter("originFileNo"+(i-1))));
										}
										
										// 기존의 첨부파일을 삭제 
										new File(path+multi.getParameter("changeFileName"+(i-1))).delete();
										
									}else {
										//기존에 첨부파일이 없는 경우 
										// Attachment 테이블의 정보를 insert
										
										// REF_BNO에 현재 게시글 번호를 추가시켜줌. 
										/*
										 * list.get(i-1).setRefBno(Integer.parseInt(multi.getParameter("bno")));
										 * 
										 */
									}
									list.get(list.size()-1).setFileLevel(i);
								}
							}	
							
							
						
						
						int result = new BoardService().updateBoard(b, list);
						// 하나의 트랜잭션으로 board에 update문과 Attachment 테이블의 insert, update 동시에 처리해주기 
						
						// 항상 board에 update문은 반드시 실행시켜줘야함. 
						// case1 : 새로운 첨부파일이 없는 경우 (x) -> insert(x), update(x) 
						// case2 : 새로운 첨부파일이 있는 경우 (o), 기존에도 첨부파일이 있던 경우 (o) -> update(o), insert(x)
						// case3 : 새로운 첨부파일이 있는 경우 (o), 기존에는 첨부파일이 없던 경우 (x) -> update(x), insert(o)
						
						// 성공시 : 상세조회페이지로 redirect
						// 실패시 : 에러페이지로 포워딩 
						if(result>0) {
							ArrayList<Attachment> count  = new BoardService().selectAlbumInnerList(bno);
							for(int i = 0; i < count.size(); i ++) {
								if(count.get(i).getFileLevel() != i) {
									count.get(i).setFileLevel(i+1);
									new BoardService().updateAttachmentLevel(count.get(i));
								}
							}
							request.getSession().setAttribute("alertMsg", "게시글이 수정되었습니다.");
							response.sendRedirect(request.getContextPath()+"/list.al");
						}else {
							request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
							request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
						}
						
					
				} else {
					request.setAttribute("errorMsg", "전송방식이 잘못되었습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
		
		
		
	}

}
