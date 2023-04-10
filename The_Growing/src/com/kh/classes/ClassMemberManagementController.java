package com.kh.classes;

import java.io.IOException;
import java.util.ArrayList;

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
		int uno = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		int cno = (int)request.getSession().getAttribute("cno");
		Class c = new ClassService().selectClass(cno,uno);
		
		ArrayList<Member> memberList = new MemberService().selectMemberList(cno);
		
		request.setAttribute("Class", c );
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher("views/management/classMemberManagement.jsp").forward(request, response);
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
