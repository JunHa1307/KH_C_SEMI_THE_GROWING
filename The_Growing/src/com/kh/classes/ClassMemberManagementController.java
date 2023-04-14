package com.kh.classes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.classes.model.service.ClassService;
import com.kh.classes.model.vo.Class;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ClassMemberManagementController
 */
@WebServlet("/classmembermanagement.c")
public class ClassMemberManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassMemberManagementController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int uno = m.getUserNo();
		int cno = (int)request.getSession().getAttribute("cno");
		Class c = new ClassService().selectClass(cno,uno);
		
		if(m.getUserLevel() == 1) {
			ArrayList<Member> memberList = new MemberService().selectMemberList(cno);
			ArrayList<Member> applyList = new ClassService().selectApplyList(cno);
			
			request.setAttribute("Class", c );
			request.setAttribute("memberList", memberList);
			request.setAttribute("applyList", applyList);
			request.getRequestDispatcher("views/management/classMemberManagement.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "선생님만 관리페이지를 사용할 수 있습니다.");
			 
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
		}
		response.setContentType("application/x-json; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		Member m = new MemberService().selectMember(uno);
		
		ArrayList<String> list = new ArrayList<String>();
		
		list.add(m.getUserNo()+"");
		list.add(m.getUserName());
		list.add(m.getChildrenName());
		list.add(m.getPhone());
		list.add(m.getAddress());
		list.add(m.getUserId());
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		
	}

}
