package com.kh.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class updateProfileImg
 */
@WebServlet("/updateImg.me")
public class UpdateProfileImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileImg() {
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
		request.setCharacterEncoding("UTF-8");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		if(ServletFileUpload.isMultipartContent(request)) {
			int mb = 1024 * 1024 * 10;
			String path = request.getSession().getServletContext().getRealPath("/resources/image/memberProfile/");
			MultipartRequest multi= new MultipartRequest(request, path, mb, "UTF-8", new MyFileRenamePolicy());
			
			Attachment at = null;
			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multi.getOriginalFileName("upfile"));
				at.setChangeName( multi.getFilesystemName("upfile"));
				at.setFilePath("/resources/image/memberProfile/");
				if(multi.getParameter("changeFileName") != null) {
					int ano = new MemberService().selectAttachmentNo(multi.getParameter("changeFileName"));
					at.setFileNo(ano);
					new File(path + multi.getParameter("changeFileName")).delete();
				}else {
					
					at.setRefUno(Integer.parseInt(multi.getParameter("uno")));
				}
			}
			
			int result = new MemberService().updateAttachment(at);
			
			if(result >0) {
				loginUser = new MemberService().loginMember(loginUser.getUserId(), loginUser.getUserPwd(), loginUser.getUserLevel());
				request.getSession().setAttribute("loginUser", loginUser);
				request.getSession().setAttribute("alertMsg", "프로필 사진 수정 성공");
				response.sendRedirect(request.getContextPath()+"/myPage.me");
			}else {
				request.setAttribute("errorMsg", "수정 실패.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("errorMsg", "전송방식이 잘못되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
