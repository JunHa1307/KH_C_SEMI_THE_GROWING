package com.kh.management.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateClassController
 */
@WebServlet("/updateClass.ma")
public class UpdateClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClassController() {
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
		/* request.setCharacterEncoding("UTF-8"); */
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/classProfile/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int cno = (int) request.getSession().getAttribute("cno");
			String classYear = multi.getParameter("classYear")+"0";
			String classGrade = multi.getParameter("classGrade");
			String className = multi.getParameter("className");
			
			Class cInfo = (Class) request.getSession().getAttribute("cInfo");
			
			System.out.println(classYear);
			System.out.println(classGrade);
			System.out.println(className);

			Attachment at = null;
			
			if(multi.getOriginalFileName("classImg") != null ) {
				
				at = new Attachment();
				at.setOriginName(multi.getOriginalFileName("classImg"));
				at.setChangeName(multi.getFilesystemName("classImg"));
				at.setFilePath("/resources/image/classProfile/");
				System.out.println(at.getOriginName());
				System.out.println(at.getChangeName());
				System.out.println(multi.getParameter("originFileRefCno"));
				if(multi.getParameter("originFileRefCno") != null) {
					System.out.println(multi.getParameter("originFileNo"));
					at.setFileNo(Integer.parseInt(multi.getParameter("originFileNo") ) );
					
					new File(savePath + multi.getParameter("changeFileName")).delete();
				
				}else {
					at.setRefCno(cno);
				}
			}
			
			Class c = new Class(cno, Integer.parseInt(classYear.concat(classGrade)), className);	
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");	
			
			/*
			 * Class updateClass = new ClassService().updateClass(c, at,
			 * loginUser.getUserNo());
			 */
			int result = new ClassService().updateClass(c, at, loginUser.getUserNo());			
						
			if(result > 0) {
				Class updateClass = new ClassService().selectClass(c.getClassNo(), loginUser.getUserNo());
				
				HttpSession session = request.getSession();
				session.setAttribute("cInfo", updateClass);
				session.setAttribute("alertMsg", "성공적으로 클래스를 수정했습니다");
				
				response.sendRedirect(request.getContextPath()+"/views/management/classSetting.jsp");
			}else {
				request.setAttribute("errorMsg", "클래스 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		
	}else {
		request.setAttribute("errorMsg", "전송방식이 잘못되었습니다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	}

	}

}
