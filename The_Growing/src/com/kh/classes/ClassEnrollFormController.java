package com.kh.classes;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.common.model.vo.HttpConnection;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
/**
 * Servlet implementation class ClassEnrollFormController
 */
@WebServlet("/classEnrollForm.c")
public class ClassEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int code = 
						(Integer.parseInt(request.getParameter("code0"))*100000) +
						(Integer.parseInt(request.getParameter("code1"))*10000) +
						(Integer.parseInt(request.getParameter("code2"))*1000) +
						(Integer.parseInt(request.getParameter("code3"))*100) +
						(Integer.parseInt(request.getParameter("code4"))*10) +
						Integer.parseInt(request.getParameter("code5"));
		
		int result = new ClassService().insertClassMember(code, m.getUserNo());
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "클래스 가입 성공");
			response.sendRedirect(request.getContextPath()+"/mainpage.me");
		}else {
			
			request.setAttribute("errorMsg", "클래스 가입 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10; // 10MB;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/classProfile/");
			
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			String classTypeName = multi.getParameter("classTypeName").replaceAll(" ", "");
			int classGrade = Integer.parseInt(multi.getParameter("classYear"))*100 + Integer.parseInt(multi.getParameter("classGrade"));
			String className = multi.getParameter("className");
			String teacherName = multi.getParameter("teacherName");
			String atCode = multi.getParameter("atCode");
			
			
			new HttpConnection();
			
			
			String lunchCode = HttpConnection.getSchoolCode(classTypeName, atCode);
			if(lunchCode == null) {
				lunchCode = "0";
			}
			
			int classCode = (int)(Math.random()*900000+100000);
			
			int refUno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo(); 
			
			Class c = new Class();
			c.setClassTypeName(classTypeName);
			c.setClassGrade(classGrade);
			c.setClassName(className);
			c.setTeacherName(teacherName);
			c.setClassCode(classCode);
			c.setAtptOfcdcScCode(atCode);
			c.setSdSchulCode(Integer.parseInt(lunchCode));
			
			
			Attachment at = null;// 처음에는 null값으로 초기화시키고, 실제로 사용자가 첨부파일을 업로드 했을 때만 객체생성
			
			// 첨부파일이 있을 경우 원본 명을 반환해주고, 없을 경우 null값을 반환해줌
			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multi.getOriginalFileName("upfile"));//원본명
				at.setChangeName( multi.getFilesystemName("upfile"));// 수정명(실제 서버에 업로드 되어있는 파일명)
				at.setFilePath("/resources/image/classProfile/");
			}
			
			// 4. 서비스 요청
			int result = new ClassService().insertClass(c, at, refUno);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "클래스 생성 성공");
				response.sendRedirect(request.getContextPath()+"/mainpage.me");
			}else {// 실패시에는 -> 첨부파일이 있었을 경우 이미 업로드된 첨부파일을 삭제해주기(용량만 차지함)
				
				if(at != null) {
					// 삭제시키고자 하는 파일 객체 생성 후 delete메서드 호출시 파일이 삭제된다
					new File(savePath+at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "클래스 생성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
		}else {
			request.setAttribute("errorMsg", "전송방법이 잘못되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
